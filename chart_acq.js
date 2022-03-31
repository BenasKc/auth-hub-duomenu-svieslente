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
function create_chart(name, data){
    if(fs.access(`charts/${name}`, (bool)=>{
        if(bool === null)console.log("x");
        else{
            var item = JSON.parse(data);
            fs.writeFile(`charts/${name}/${item.title}`, data ,()=>{
                if(err) throw err;
                console.log(`Created ${item.title}`);
            })
            
            return;
        }
    }));

}
exports.create_chart_folder = create_chart_folder;
exports.create_chart = create_chart;