const fs = require('fs');
function create_chart_folder(name){
    if(fs.access(`charts/${name}`, (bool)=>{
        if(bool === null)console.log("x");
        else{
            fs.mkdirSync(`charts/${name}`);
            console.log('Created');
            return;
        }
    }));
}
function create_chart(name, data, callback){
    if(fs.access(`charts/${name}`, (err)=>{
        if(err)callback(err);
        else{
            fs.writeFileSync(`charts/${name}/${data.title}`, JSON.stringify(data));
            callback('Chart Created');
        }
    }));
}
function read_charts(username, onContent, onError){
    fs.readdir('charts/'+username, function(err, filenames){
        if(err){
            onError(err);
            return;
        }
        filenames.forEach(function(filename){
            fs.readFile('charts/'+username+'/'+filename, 'utf-8', function(err, content){
                if(err){
                    onError(err);
                    return;
                }
                onContent(filename, content);
            })

        })
    })
}
function fetch_charts(username, cb){
    read_charts(username, function(filename, content) {
        cb(filename, content);
       }, function(err) {
        throw err;
        
    });
    
}

// fetch_charts('BenasKc', (filename, content)=>{
//     var data = {};
//     data[filename] = content;
//     console.log(filename +' '+content +'\n');
//     return data;
// })
exports.create_chart_folder = create_chart_folder;
exports.create_chart = create_chart;
exports.fetch_charts = fetch_charts;