const http = require("http");
const fs = require("fs");
const parser = require('./parser.js')
const { url } = require("inspector");
const port = 8000//process.env.PORT || 5000

const server = http.createServer((req,res)=>{
    if(req.url === '/create'){
        var status;
        req.on('data', chunk => {
            var item = chunk.toString().split('|');
            status = parser.create_acc(item[0], item[1], item[2], item[3], item[4])
            res.writeHead(200, {'Content-Type':'text/plain'});
            res.write(JSON.stringify(status));
            res.end();
          })
    }
    else if(req.url === '/checklogin'){
        var status;
        req.on('data', chunk => {
            var item = chunk.toString().split('|');
            status = parser.check_login(item[0], item[1], 'name')
            res.writeHead(200, {'Content-Type':'text/plain'});
            res.write(JSON.stringify(status));
            res.end();
          })
          
    }
    else if(req.url === '/fetchprofile'){
        var status;
        req.on('data', chunk => {
            var item = chunk.toString().split('|');
            status = parser.fetch_profile(item[0].replace('"', '').replace('"', '')); // id
            res.writeHead(200, {'Content-Type':'text/plain'});
            res.write(JSON.stringify(status));
            res.end();
          })
          
    }
    // else if(req.url === '/create_chart'){
    //     var status;
    //     req.on('data', chunk => {
    //         var item = JSON.parse(chunk.toString());
    //         status = parser.create_chr(item.name, item.pass, item); // name, pass, data
    //         res.writeHead(200, {'Content-Type':'text/plain'});
    //         res.write(JSON.stringify(status));
    //         res.end();
    //       })
          
    // }
    else if(req.url == '/secret'){
        res.write("You found it!");
        res.end();
    }
    else if(req.url == '/check_token'){
        var status;
        //console.log(req.headers['x-forwarded-for'] ||
        //    req.socket.remoteAddress ||
         //   null);
        req.on('data', chunk => {
            
            var item = chunk.toString();
            status = parser.find_token(item);
            res.writeHead(200, {'Content-Type':'text/plain'});
            res.write(JSON.stringify(status));
            res.end();
          })
    }
    else{
        res.writeHead(200, {'Content-Type':'text/plain'});
        res.write("????");
        res.end();
    }
    
    
    
}).listen(port);
