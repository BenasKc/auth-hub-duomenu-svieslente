const http = require("http");
const fs = require("fs");
const parser = require('./parser.js')
const { url } = require("inspector");
const port = process.env.PORT || 5000

const server = http.createServer((req,res)=>{
    if(req.url === '/create'){
        var status;
        req.on('data', chunk => {
            var item = chunk.toString().split('|');
            status = parser.create_acc(item[0], item[1], item[2])
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
    else if(req.url == '/secret'){
        res.write("You found it!");
        res.end();
    }
    else if(req.url == '/check_token'){
        var status;
        req.on('data', chunk => {
            console.log("UP")
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
