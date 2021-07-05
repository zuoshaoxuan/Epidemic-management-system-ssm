<%--
  Created by IntelliJ IDEA.
  User: zuoshaoxuan
  Date: 2021-04-14
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="../../../css/JavaScriptstyle.css">
    <style>
        /*!*定义滚动条宽高及背景，宽高分别对应横竖滚动条的尺寸*!*/
        ::-webkit-scrollbar {
            width: 6px; /*对垂直流动条有效*/
        }
        /*定义滚动条的轨道颜色、内阴影及圆角*/
        ::-webkit-scrollbar-track{
            /*-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);*/
            background-color: #FFFFFF;
            border-radius: 3px;
        }
        /*定义滑块颜色、内阴影及圆角*/
        ::-webkit-scrollbar-thumb{
            border-radius: 7px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.2);
            background-color: rgba(0,0,0,0.3);
        }
        /*定义两端按钮的样式*/
        /*::-webkit-scrollbar-button {
            background-color:cyan;
        }*/
        /*定义右下角汇合处的样式*/
        ::-webkit-scrollbar-corner {
            background:khaki;
        }
        .span{
            font-size: 28px;
        }
        .span-color{
            font-size: 30px;
            color: red;
        }
    </style>
</head>
<body bgcolor="#152B39">
<div style="color: #fff">
    <span class="span">隔离人数: <span style="color: #ffffff">${requestScope.Gcount}</span></span><br>
    <span class="span">异常人数: <span class="span-color">${requestScope.count}</span></span>
    <h2 id="dd"></h2>
    <h3>每种病状在异常人群的占比 <span style="color: #fcffc2">见下图:</span></h3>
</div>
<%--饼图--%>
<div id="div1" style="background-color: #152B39"></div>
<script>
    let intdata ="${requestScope.count}";
    let count=parseInt(intdata)*6;
    intdata="${requestScope.Gcount}";
    let zintdate=parseInt(intdata);
    let zb=((count/6)/zintdate)*100+"%";
    document.getElementById("dd").innerHTML="异常人数比率:"+zb;
    let newdate="${requestScope.list}"
    newdate=newdate.replace("[","");
    newdate=newdate.replace("]","");
    let Rdata= newdate.split(",");
    /*感冒数据*/
    let gan=parseInt(Rdata[1]); let ganra=(gan/count).toFixed(3);let ganStr="感冒:"+(ganra*100)+"%";
    let fa=parseInt(Rdata[0]); let fara=(fa/count).toFixed(3);let faStr="发烧:"+(fara*100)+"%";
    let ke=parseInt(Rdata[2]); let kera=(ke/count).toFixed(3);let keStr="咳嗽:"+(kera*100)+"%";
    let ou=parseInt(Rdata[3]); let oura=(ou/count).toFixed(3);let ouStr="呕吐:"+(oura*100)+"%";
    let fu=parseInt(Rdata[4]); let fura=(fu/count).toFixed(3);let fuStr="腹泻:"+(fura*100)+"%";
    let yun=parseInt(Rdata[5]); let yunra=(yun/count).toFixed(3);let yunStr="头晕:"+(yunra*100)+"%";
    let teng=parseInt(Rdata[6]); let tengra=(teng/count).toFixed(3);let tengStr="头疼:"+(tengra*100)+"%";
    let nos=parseInt(Rdata[7]); let nosra=(nos/count).toFixed(3);let nosStr="无症状:"+(nosra*100)+"%";
    // alert(typeof (gan))
    console.log(gan);
    //数据
    var data={
        title:"",
        dataList:
            [
                {name:ganStr,rate:ganra,color:"#f60"},
                {name:faStr,rate:fara,color:"#64f"},
                {name:keStr,rate:kera,color:"#0f6"},
                {name:ouStr,rate:oura,color:"#d45"},
                {name:fuStr,rate:fura,color:"#4376e7"},
                {name:yunStr,rate:yunra,color:"#FA4CDE"},
                {name:tengStr,rate:tengra,color:"#E3F826"},
                {name:nosStr,rate:nosra,color:"#fff"}
            ]
    }
    //画布
    var cvs=document.createElement("canvas");
    var div1=document.getElementById("div1");
    div1.appendChild(cvs);
    cvs.width=900;
    cvs.height=500;
    cvs.style="display:block;margin:0 auto;background:#152B39;";
    var ctx=cvs.getContext("2d");
    //绘制标题
    ctx.font="24px 黑体";
    ctx.textAlign="left";
    ctx.textBaseline="midddle";
    ctx.fillStyle="#fff";
    ctx.fillText(data.title,cvs.width/2,25);
    //绘制左边实例图标
    ctx.textAlign="left";
    ctx.font="16px 微软雅黑";
    ctx.textBaseline="bottom";
    for(var i=0;i<data.dataList.length;i++)
    {
        ctx.beginPath();
        ctx.arc(30,50+20*i,10,1.5*Math.PI-0.2*Math.PI,1.5*Math.PI+0.2*Math.PI,false);
        ctx.lineWidth=5;
        ctx.strokeStyle=data.dataList[i].color;
        ctx.stroke();
        ctx.fillText(data.dataList[i].name,45,50+20*i);
    }
    //绘制饼图
    var startAngle=1.5*Math.PI;
    var endAngle,lineAngle;
    for(var j=0;j<data.dataList.length;j++)
    {
        ctx.beginPath();
        ctx.moveTo(500,250);
        endAngle=startAngle+data.dataList[j].rate*2*Math.PI;
        ctx.arc(500,250,100,startAngle,endAngle,false);
        ctx.closePath();
        ctx.fillStyle=data.dataList[j].color;
        ctx.fill();
        startAngle=endAngle;
        lineAngle=endAngle-data.dataList[j].rate*Math.PI-1.5*Math.PI;
        ctx.beginPath();
        ctx.moveTo(500+100*Math.sin(lineAngle),250-100*Math.cos(lineAngle));
        ctx.lineTo(500+120*Math.sin(lineAngle),250-120*Math.cos(lineAngle));
        ctx.textBaseline="midddle";
        if(lineAngle<=Math.PI)
        {
            ctx.lineTo(500+120*Math.sin(lineAngle)+15,250-120*Math.cos(lineAngle));
            ctx.textAlign="left";
            ctx.fillText(data.dataList[j].name,500+120*Math.sin(lineAngle)+20,250-120*Math.cos(lineAngle));
        }
        else
        {
            ctx.lineTo(500+120*Math.sin(lineAngle)-15,250-120*Math.cos(lineAngle));
            ctx.textAlign="right";
            ctx.fillText(data.dataList[j].name,500+120*Math.sin(lineAngle)-20,250-120*Math.cos(lineAngle));
        }
        ctx.lineWidth=1;
        ctx.strokeStyle=data.dataList[j].color;
        ctx.stroke();
    }
    //生成动画
    var cvsOver=document.createElement('canvas');
    div1.appendChild(cvsOver);
    cvsOver.width=cvs.width;
    cvsOver.height=cvs.height;
    div1.style.position="relative";
    cvsOver.style.position="absolute";
    cvsOver.style.top=1;
    cvsOver.style.left=1;
</script>
<%-- 折线图--%>
<div>
    <div class="wrapper">
        <canvas id='c'></canvas>
        <div class="label">text</div>
    </div>

    <div style="text-align:center;clear:both;">
        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
        <script src="/follow.js" type="text/javascript"></script>
    </div>

    <!-- partial -->
    <script>
        var label = document.querySelector(".label");
        var c = document.getElementById("c");
        var ctx = c.getContext("2d");
        var cw = c.width = 700;
        var ch = c.height = 350;
        var cx = cw / 2,
            cy = ch / 2;
        var rad = Math.PI / 180;
        var frames = 0;

        ctx.lineWidth = 1;
        ctx.strokeStyle = "#999";
        ctx.fillStyle = "#ccc";
        ctx.font = "14px monospace";

        var grd = ctx.createLinearGradient(0, 0, 0, cy);
        grd.addColorStop(0, "hsla(167,72%,60%,1)");
        grd.addColorStop(1, "hsla(167,72%,60%,0)");

        var oData = {
            "2008": 10,
            "2009": 19.9,
            "2010": 17,
            "2011": 30.0,
            "2012": 5.3,
            "2013": 38.4,
            "2014": 15.7,
            "2015": 9.0
        };

        var valuesRy = [];
        var propsRy = [];
        for (var prop in oData) {

            valuesRy.push(oData[prop]);
            propsRy.push(prop);
        }
        var vData = 4;
        var hData = valuesRy.length;
        var offset = 50.5; //offset chart axis
        var chartHeight = ch - 2 * offset;
        var chartWidth = cw - 2 * offset;
        var t = 1 / 7; // curvature : 0 = no curvature
        var speed = 2; // for the animation

        var A = {
            x: offset,
            y: offset
        }
        var B = {
            x: offset,
            y: offset + chartHeight
        }
        var C = {
            x: offset + chartWidth,
            y: offset + chartHeight
        }

        /*
              A  ^
                |  |
                + 25
                |
                |
                |
                + 25
              |__|_________________________________  C
              B
        */

        // CHART AXIS -------------------------
        ctx.beginPath();
        ctx.moveTo(A.x, A.y);
        ctx.lineTo(B.x, B.y);
        ctx.lineTo(C.x, C.y);
        ctx.stroke();

        // vertical ( A - B )
        var aStep = (chartHeight - 50) / (vData);

        var Max = 100;
        //Math.ceil(arrayMax(valuesRy) / 2) * 10;
        var Min = Math.floor(arrayMin(valuesRy) / 10) * 10;
        var aStepValue = (Max - Min) / (vData);
        console.log("aStepValue: " + aStepValue); //8 units
        var verticalUnit = aStep / aStepValue;

        var a = [];
        ctx.textAlign = "right";
        ctx.textBaseline = "middle";
        for (var i = 0; i <= vData; i++) {

            if (i == 0) {
                a[i] = {
                    x: A.x,
                    y: A.y + 25,
                    val: Max
                }
            } else {
                a[i] = {}
                a[i].x = a[i - 1].x;
                a[i].y = a[i - 1].y + aStep;
                a[i].val = a[i - 1].val - aStepValue;
            }
            drawCoords(a[i], 3, 0);
        }

        //horizontal ( B - C )
        var b = [];
        ctx.textAlign = "center";
        ctx.textBaseline = "hanging";
        var bStep = chartWidth / (hData + 1);

        for (var i = 0; i < hData; i++) {
            if (i == 0) {
                b[i] = {
                    x: B.x + bStep,
                    y: B.y,
                    val: propsRy[0]
                };
            } else {
                b[i] = {}
                b[i].x = b[i - 1].x + bStep;
                b[i].y = b[i - 1].y;
                b[i].val = propsRy[i]
            }
            drawCoords(b[i], 0, 3)
        }

        function drawCoords(o, offX, offY) {
            ctx.beginPath();
            ctx.moveTo(o.x - offX, o.y - offY);
            ctx.lineTo(o.x + offX, o.y + offY);
            ctx.stroke();

            ctx.fillText(o.val, o.x - 2 * offX, o.y + 2 * offY);
        }
        //----------------------------------------------------------

        // DATA
        var oDots = [];
        var oFlat = [];
        var i = 0;

        for (var prop in oData) {
            oDots[i] = {}
            oFlat[i] = {}

            oDots[i].x = b[i].x;
            oFlat[i].x = b[i].x;

            oDots[i].y = b[i].y - oData[prop] * verticalUnit - 25;
            oFlat[i].y = b[i].y - 25;

            oDots[i].val = oData[b[i].val];

            i++
        }



        ///// Animation Chart ///////////////////////////
        //var speed = 3;
        function animateChart() {
            requestId = window.requestAnimationFrame(animateChart);
            frames += speed; //console.log(frames)
            ctx.clearRect(60, 0, cw, ch - 60);

            for (var i = 0; i < oFlat.length; i++) {
                if (oFlat[i].y > oDots[i].y) {
                    oFlat[i].y -= speed;
                }
            }
            drawCurve(oFlat);
            for (var i = 0; i < oFlat.length; i++) {
                ctx.fillText(oDots[i].val, oFlat[i].x, oFlat[i].y - 25);
                ctx.beginPath();
                ctx.arc(oFlat[i].x, oFlat[i].y, 3, 0, 2 * Math.PI);
                ctx.fill();
            }

            if (frames >= Max * verticalUnit) {
                window.cancelAnimationFrame(requestId);

            }
        }
        requestId = window.requestAnimationFrame(animateChart);

        /////// EVENTS //////////////////////
        c.addEventListener("mousemove", function(e) {
            label.innerHTML = "";
            label.style.display = "none";
            this.style.cursor = "default";

            var m = oMousePos(this, e);
            for (var i = 0; i < oDots.length; i++) {

                output(m, i);
            }

        }, false);

        function output(m, i) {
            ctx.beginPath();
            ctx.arc(oDots[i].x, oDots[i].y, 20, 0, 2 * Math.PI);
            if (ctx.isPointInPath(m.x, m.y)) {
                //console.log(i);
                label.style.display = "block";
                label.style.top = (m.y + 10) + "px";
                label.style.left = (m.x + 10) + "px";
                label.innerHTML = "<strong>" + propsRy[i] + "</strong>: " + valuesRy[i] + "%";
                c.style.cursor = "pointer";
            }
        }

        // CURVATURE
        function controlPoints(p) {
            // given the points array p calculate the control points
            var pc = [];
            for (var i = 1; i < p.length - 1; i++) {
                var dx = p[i - 1].x - p[i + 1].x; // difference x
                var dy = p[i - 1].y - p[i + 1].y; // difference y
                // the first control point
                var x1 = p[i].x - dx * t;
                var y1 = p[i].y - dy * t;
                var o1 = {
                    x: x1,
                    y: y1
                };

                // the second control point
                var x2 = p[i].x + dx * t;
                var y2 = p[i].y + dy * t;
                var o2 = {
                    x: x2,
                    y: y2
                };

                // building the control points array
                pc[i] = [];
                pc[i].push(o1);
                pc[i].push(o2);
            }
            return pc;
        }

        function drawCurve(p) {

            var pc = controlPoints(p); // the control points array

            ctx.beginPath();
            //ctx.moveTo(p[0].x, B.y- 25);
            ctx.lineTo(p[0].x, p[0].y);
            // the first & the last curve are quadratic Bezier
            // because I'm using push(), pc[i][1] comes before pc[i][0]
            ctx.quadraticCurveTo(pc[1][1].x, pc[1][1].y, p[1].x, p[1].y);

            if (p.length > 2) {
                // central curves are cubic Bezier
                for (var i = 1; i < p.length - 2; i++) {
                    ctx.bezierCurveTo(pc[i][0].x, pc[i][0].y, pc[i + 1][1].x, pc[i + 1][1].y, p[i + 1].x, p[i + 1].y);
                }
                // the first & the last curve are quadratic Bezier
                var n = p.length - 1;
                ctx.quadraticCurveTo(pc[n - 1][0].x, pc[n - 1][0].y, p[n].x, p[n].y);
            }

            //ctx.lineTo(p[p.length-1].x, B.y- 25);
            ctx.stroke();
            ctx.save();
            ctx.fillStyle = grd;
            ctx.fill();
            ctx.restore();
        }

        function arrayMax(array) {
            return Math.max.apply(Math, array);
        };

        function arrayMin(array) {
            return Math.min.apply(Math, array);
        };

        function oMousePos(canvas, evt) {
            var ClientRect = canvas.getBoundingClientRect();
            return { //objeto
                x: Math.round(evt.clientX - ClientRect.left),
                y: Math.round(evt.clientY - ClientRect.top)
            }
        }
    </script>
</div>
</body>
</html>
