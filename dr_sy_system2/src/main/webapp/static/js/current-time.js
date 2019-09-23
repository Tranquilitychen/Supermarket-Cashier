window.onload=function(){

//定时器每秒调用一次fnDate()
    setInterval(function(){
        fnDate();
    },1000);
}

//js 获取当前时间
function fnDate(){
    var oDiv=document.getElementById("time");
    var date=new Date();
    var year=date.getFullYear();//当前年份
    var month=date.getMonth();//当前月份
    var data=date.getDate();//天
    var hours=date.getHours();//小时
    var minute=date.getMinutes();//分
    var second=date.getSeconds();//秒
    var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
    oDiv.innerHTML=time;
}
//补位 当某个字段不是两位数时补0
function fnW(str){
    var num;
    str>10?num=str:num="0"+str;
    return num;
}