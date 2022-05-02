const port = 8009;
const host = 'localhost';
const { readFile } = require('fs');
const crypto = require('crypto');
const http = require('http');
const mysql = require('mysql2');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'administratorius',
    password: '10KyS92K94414dG',
    database: 'Duomenu_Svieslente'
});
// routes to fix: /create /fetchprofile /checklogin /create_new_chart
const requestListener = function (req, res) {
    if(req.url === '/checklogin'){
        req.on('data', (chunk)=>{
            
            var data_obj = JSON.parse(chunk.toString());
            data_obj[0] = data_obj[0].replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
            data_obj[1] = data_obj[1].replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');


            if(data_obj[0].length > 63)res.end("Too long username");
            else{
                connection.query(`CALL Duomenu_Svieslente.sp_Check_Login('${data_obj[0]}')`, function(error, result){
                    if(error) throw error;
                    if(result && result[0].length === 0){


                        res.write('-1');
                        res.end();
                    }
                    else{
                        var hash = crypto.pbkdf2Sync(data_obj[1],
                            result[0][0].Hash, 1000, 64, `sha512`).toString(`hex`);
                        if(hash === result[0][0].Password){
                            connection.query(`CALL Duomenu_Svieslente.sp_Init_Session('${data_obj[0]}')`, function(er, reslt){
                                if(er) throw er;
                                res.write(reslt[0][0].uid);
                                res.end();
                            })
                        }
                        else{
                            res.write('-1');
                            res.end();
                        }
                    }
                })
            }
        })
    }
    else if(req.url === '/check_token'){
        req.on('data', (chunk)=>{
                if(chunk.toString().replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '').length > 0){
                    connection.query(`CALL Duomenu_Svieslente.sp_Check_Token('${chunk.toString().replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '')}')`, function(err, result){
                    if(err)throw err;
                    if(result[0][0].stat === 'true'){
                        res.write('true');
                        res.end();
                    }
                    else{
                        res.write('false');
                        res.end();
                    }
                    })
                }
                
            
            
        })
    }
    else if(req.url === '/create'){
        req.on('data', (chunk)=>{
            var data = JSON.parse((chunk).toString());
            var salt = crypto.randomBytes(16).toString('hex');
            data[1] = crypto.pbkdf2Sync(data[1], salt,
            1000, 64, `sha512`).toString(`hex`);
            connection.query(`CALL Duomenu_Svieslente.sp_Create_Account('${ data[2]}', '${data[0]}' , '${data[1]}' , '${salt}')`, function(err, result){
                if(err) throw err;
                res.write(result[0][0].stat);
                res.end();
            })
        })
    }
    else if(req.url === '/fetchprofile'){
        req.on('data', (chunk)=>{
            connection.query(`CALL Duomenu_Svieslente.sp_Fetch_Profile('${(chunk).toString().replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '')}')`, function(er, resv){
                if(er) throw er;
                res.end(JSON.stringify([resv[0][0].Name_of_Organisation, resv[0][0].Username]));
            })
        })
    }
    else if(req.url === '/fetch_charts'){
        req.on('data', (chunk)=>{
            connection.query(`CALL Duomenu_Svieslente.sp_Fetch_Charts('${(chunk).toString().replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '')}')`, function(er, resv){
                if(er) throw er;
                res.end(JSON.stringify(resv[0]));
            })
        })
    }
    else if(req.url === '/save_pref'){
        req.on('data', (chunk)=>{
            var duom = JSON.parse(chunk.toString());
            duom.session = duom.session.replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '');
            duom.id = duom.id.replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '');
            duom.conf = duom.conf.replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '');
            connection.query(`CALL Duomenu_Svieslente.sp_Save_Preference('${duom.session}', '${duom.id}', '{"selected_graph": "${duom.conf}"}')`, function(er, resv){
                if(er) throw er;
                res.end(JSON.stringify(resv[0]));
            })
        })
    }
    else res.end();
};
const server = http.createServer(requestListener);
server.listen(port, host, ()=>{
    connection.connect();
    console.log(`Server running on ${host}:${port}`)
})