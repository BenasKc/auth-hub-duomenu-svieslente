const http = require("http");
const fs = require("fs");
const parser = require('./parser.js')
const { url } = require("inspector");

function sendFile(filename, contentType, res, callback){
    fs.readFile(filename, (err,data) => {
        if(err){
            console.log(err);
            res.write(err);
            return;
        }
        else{
            res.writeHead(200, {'Content-Type':contentType});
            res.write(data);      
        }
        res.end();
        if(callback){
            callback(error);
        }
    });
}
const server = http.createServer((req,res)=>{
    if(req.url === '/create'){
       
    }
    if(req.url == '/secret'){
        res.write("You found it!");
        res.end();
    }
    
    
    
}).listen(8080);
