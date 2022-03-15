var crypto = require('crypto'); 
var fs = require('fs');
const readline = require('readline');
const { callbackify } = require('util');
const uuidv4 = require("uuid/v4")

function find_attr(item, value){
    if(value === 'name')value = 0;
    else if(value === 'hash')value = 1;
    else if(value === 'email')value = 2;
    else if(value === 'id')value = 3;
    
    var data = fs.readFileSync('database_file.txt', 'utf8');

    data = data.split('\n');

    for(var i = 0;i < data.length;i++){
        var temp = data[i].split('|');
        if(temp[value] == item)return temp;
    }
    return -1;

    
}
function create_acc(name, pass, email){
    var l = find_attr(name, 'name');
    var m = find_attr(email, 'email');
    if(m == -1 && l == -1){
        var temo = uuidv4();
        var item = [name, pass, email,  temo]
        salt = crypto.randomBytes(16).toString('hex');
        item.push(salt);
        item[1] = crypto.pbkdf2Sync(item[1], item[4],  
            1000, 64, `sha512`).toString(`hex`);
        fs.appendFile('database_file.txt', '\n' + item.join('|'), function (err) {
            if (err) throw err;
            
          });
          return 'Created';
        }
    else{
        if(l != -1)return 'Name taken';
        else return 'Email taken';
    }
}
function set_login(pass, name){

}
function check_login(name, pass, option){
    if(option === 'name')option = 0;
    else if(option === 'hash')option = 1;
    else if(option === 'email')option = 2;
    else if(option === 'id')option = 3;
    var l = find_attr(name, option);
    if(l == -1)return 0;
    var hash = crypto.pbkdf2Sync(pass,  
        l[4], 1000, 64, `sha512`).toString(`hex`);
    return l[1] === hash; 
}
exports.check_login = check_login;
exports.create_acc = create_acc;