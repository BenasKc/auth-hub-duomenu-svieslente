var crypto = require('crypto');
var fs = require('fs');
const readline = require('readline');
const { callbackify } = require('util');
const uuid = require("uuid")
const chart_acq = require('./chart_acq.js')
function find_attr(item, value) {
    if (value === 'name') value = 0;
    else if (value === 'hash') value = 1;
    else if (value === 'email') value = 2;
    else if (value === 'id') value = 3;

    var data = fs.readFileSync('database_file.txt', 'utf8');

    data = data.split('\n');

    for (var i = 0; i < data.length; i++) {
        var temp = data[i].split('|');
        if (temp[value] == item) return temp;
    }
    return -1;
}
function create_acc(name, pass, email, first_n, last_n) {
    if (!(name && pass && email && first_n && last_n)) return 'Enter all data legitimately';
    var l = find_attr(name, 'name');
    var m = find_attr(email, 'email');
    if (m == -1 && l == -1) {
        var temo = uuid.v4();
        var item = [name, pass, email, first_n, last_n, temo]
        salt = crypto.randomBytes(16).toString('hex');
        item.push(salt);
        item[1] = crypto.pbkdf2Sync(item[1], item[6],
            1000, 64, `sha512`).toString(`hex`);
        chart_acq.create_chart_folder(item[0]);
        fs.appendFile('database_file.txt', '\n' + item.join('|'), function (err) {
            if (err) throw err;

        });
        
        return 'Created';
    }
    else {
        if (l != -1) return 'Name taken';
        else return 'Email taken';
    }
}
function fetch_profile(id) {
    var itm = check_id(id);
    if (itm[0] === '-1') return 'Nerasta';
    else {
        var data = fs.readFileSync('database_file.txt', 'utf8');
        data = data.split('\n');
        var personal_Data = {}; // sutvarkyti json objekto valdyma
        for (var i = 0; i < data.length; i++) {
            var temp = data[i].split('|');
            var valid = false;
            for (var j = 0; j < temp.length; j++) {
                if (itm[3] === temp[5]) {
                    if (j == 2 || j == 3 || j == 4) { //email, fname, lname
                        if(j === 2)personal_Data.email = temp[2];
                        else if(j === 3)personal_Data.firstName = temp[3];
                        else if(j === 4)personal_Data.lastName = temp[4];
                    }
                    valid = true;
                }

            }
            if (valid) {
                break;
            }

        }
        return JSON.stringify(personal_Data);
    }
}
function find_token(token) {
    var data = fs.readFileSync('login_tokens.txt', 'utf8');
    data = data.split('\n');
    for (var i = 0; i < data.length; i++) {
        var temp = data[i].split(' ');
        if (temp[0].length > 0) {
            if (temp[0].toString() == token.toString()) {
                if (Date.now() < +temp[1]) {
                    return temp[0];
                }
            }
        }
    }
    return '-1';
}
function check_id(token) {
    var data = fs.readFileSync('login_tokens.txt', 'utf8');
    data = data.split('\n');
    for (var i = 0; i < data.length; i++) {
        var temp = data[i].split(' ');
        if (temp[0].length > 0) {
            if (temp[0].toString() == token.toString()) {
                if (Date.now() < +temp[1]) {
                    return temp;
                }
            }
        }
    }
    return '-1';

}
function find_token_by_name(token) {
    var data = fs.readFileSync('login_tokens.txt', 'utf8');
    data = data.split('\r\n');
    for (var i = 0; i < data.length; i++) {
        var temp = data[i].split(' ');
        if (temp[0].length > 0) { 
            if (temp[2].toString() == token.toString()) {
                if (Date.now() < +temp[1]) {
                    return temp[0];
                }
            }
        }

    }
    return '-1';
}

function create_token(name) {
    var tmp = uuid.v4();
    var x = find_attr(name, 'name');
    var item = tmp + ' ' + (Date.now() + 1800000).toString() + ' ' + name + ' ' + x[5];
    fs.appendFile('login_tokens.txt', '\n' + item, function (err) {
        if (err) throw err;
    });
    return tmp;
}
function check_login(name, pass, option) {
    if (name.length < 1 || pass.length < 1 || name === 'null' || pass === 'null') return '-1';
    var l = find_attr(name, option);
    if (l == -1) return '-1';
    var obj = find_attr(name, 'name');
    var status = find_token_by_name(name, 'name');
    if (option === 'name') option = 0;
    else if (option === 'hash') option = 1;
    else if (option === 'email') option = 2;
    else if (option === 'id') option = 3;
    l[6] = l[6].replace(/(\r\n|\n|\r)/gm, "");
    var hash = crypto.pbkdf2Sync(pass,
        l[6], 1000, 64, `sha512`).toString(`hex`);
    if (l[1] === hash && status === '-1') {
        var tok = create_token(name);
        return tok;
    }
    else if (l[1] === hash) return status;
    return -1;
}
function create_chr(data, cb){
    var status = check_id(data.id);
    if(status === '-1'){
        cb("Invalid ID");
    }
    else{
        chart_acq.create_chart(status[2], data, (result)=>{
            cb(result);
        });
    }
    //var status = check_login(name, pass, 'name');
    //if(status != -1){
      //  chart_acq.create_chart(name, data);
       // return 'Created';
   // }

}
function get_charts(id, cb){
    chart_acq.fetch_charts(username, (filename, content)=>{
        var data = {};
        data[filename] = content;
        cb(data);
    })
}
exports.check_login = check_login;
exports.create_acc = create_acc;
exports.find_token = find_token;
exports.fetch_profile = fetch_profile;
exports.create_chr = create_chr;
exports.get_charts = get_charts;