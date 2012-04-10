<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Biblioteca.WebApplication.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <STYLE>
P, body, td, tr, div {
scrollbar-base-color: #b9bbff;
   scrollbar-shadow-color: #b9bbff;
   scrollbar-highlight-color: #b9bbff; 
   scrollbar-3dlight-color: #b9bbff; 
   scrollbar-darkshadow-color: #b9bbff;
   scrollbar-track-color: #b9bbff; 
   scrollbar-arrow-color: #000000;}
</STYLE>
<script language="JavaScript">
<!--
    function chama_link(valor) {
        window.open(valor)
    }
    function P7_JumpMenu(selObj, restore) { //v1.7 by Project Seven
        var theFullString = selObj.options[selObj.selectedIndex].value;
        if (restore) selObj.selectedIndex = 0;
        var theLength = theFullString.length;
        var endPos = theFullString.lastIndexOf("~");
        var theUrl, theTarget, theParent;
        if (endPos > 0)
        { theUrl = theFullString.substring(0, endPos); }
        else
        { theUrl = theFullString; }
        endPos++
        if (endPos < theLength)
        { theTarget = theFullString.substring(endPos, theLength) }
        else
        { theTarget = "window:Main"; }
        if (theTarget == "window:New")
        { window.open(theUrl); }
        else if (theTarget == "window:Main")
        { eval("parent.location='" + theUrl + "'"); }
        else
        { eval("parent.frames[\'" + theTarget + "\'].location='" + theUrl + "'"); }
    }
    //-->
    // begin absolutely positioned scrollable area object scripts 
    // Extension developed by David G. Miles 
    // Original Scrollable Area code developed by Thomas Brattli 
    function verifyCompatibleBrowser() {
        this.ver = navigator.appVersion
        this.dom = document.getElementById ? 1 : 0
        this.ie5 = (this.ver.indexOf("MSIE 5") > -1 && this.dom) ? 1 : 0;
        this.ie4 = (document.all && !this.dom) ? 1 : 0;
        this.ns5 = (this.dom && parseInt(this.ver) >= 5) ? 1 : 0;
        this.ns4 = (document.layers && !this.dom) ? 1 : 0;
        this.bw = (this.ie5 || this.ie4 || this.ns4 || this.ns5)
        return this
    }

    bw = new verifyCompatibleBrowser()
    var speed = 50
    var loop, timer

    function ConstructObject(obj, nest) {
        nest = (!nest) ? '' : 'document.' + nest + '.'
        this.el = bw.dom ? document.getElementById(obj) : bw.ie4 ? document.all[obj] : bw.ns4 ? eval(nest + 'document.' + obj) : 0;
        this.css = bw.dom ? document.getElementById(obj).style : bw.ie4 ? document.all[obj].style : bw.ns4 ? eval(nest + 'document.' + obj) : 0;
        this.scrollHeight = bw.ns4 ? this.css.document.height : this.el.offsetHeight
        this.clipHeight = bw.ns4 ? this.css.clip.height : this.el.offsetHeight
        this.up = MoveAreaUp; this.down = MoveAreaDown;
        this.MoveArea = MoveArea; this.x; this.y;
        this.obj = obj + "Object"
        eval(this.obj + "=this")
        return this
    }

    function MoveArea(x, y) {
        this.x = x; this.y = y
        this.css.left = this.x
        this.css.top = this.y
    }

    function MoveAreaDown(move) {
        if (this.y > -this.scrollHeight + objContainer.clipHeight) {
            this.MoveArea(0, this.y - move)
            if (loop) setTimeout(this.obj + ".down(" + move + ")", speed)
        }
    }

    function MoveAreaUp(move) {
        if (this.y < 0) {
            this.MoveArea(0, this.y - move)
            if (loop) setTimeout(this.obj + ".up(" + move + ")", speed)
        }
    }

    function PerformScroll(speed) {
        if (initialised) {
            loop = true;
            if (speed > 0) objScroller.down(speed)
            else objScroller.up(speed)
        }
    }

    function CeaseScroll() {
        loop = false
        if (timer) clearTimeout(timer)
    }

    var initialised;
    function InitialiseScrollableArea() {
        objContainer = new ConstructObject('divContainer')
        objScroller = new ConstructObject('divContent', 'divContainer')
        objScroller.MoveArea(0, 0)
        objContainer.css.visibility = 'visible'
        initialised = true;
    }
    // end absolutely positioned scrollable area object scripts
</script>
<style type="text/css"> 
#divUpControl{position:absolute; width:16; left:300; top:10; z-index:1; text-align: right} 
#divDownControl{position:absolute; width:16; left:300; top:10; z-index:1; text-align: right} 
#divContainer{position:absolute; width:400; left:20; top:10; height:100; overflow:hidden; clip:rect(0,450,250,0); visibility:hidden} 
#divContent{position:absolute; widht:400; height: 100; top:10} 
</style>
</head>
<body bgcolor="#b9bbff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="InitialiseScrollableArea()">

<!-- INICIO DA CONFIGURACAO -->
<div id="divUpControl" style="left: 430px; width: 16; height: 16; top: 0px"> 
<a href="javascript:;" onMouseOver="PerformScroll(-7)" onMouseOut="CeaseScroll()"><img src="IMAGEM SOBE" width="16" height="16" border="0"></a> 
</div>
<div id="divDownControl" style="left: 430px; width: 16; height: 16; top: 90px"> 
<center><a href="javascript:;" onMouseOver="PerformScroll(7)" onMouseOut="CeaseScroll()"><img src="IMAGEM DESCE" width="16" height="16" border="0"></a> </center>
</div>
<div id="divContainer" ; top:10; width: 400px; height: 100px; visibility: visible"> 
<div id="divContent"; top:10; height:100; width: 400px> 

AQUI FICA O TEXTO =P AQUI FICA O TEXTO =]
<br><br><br>

AQUI FICA O TEXTO =) AQUI FICA O TEXTO =*<br><br><br>

AQUI FICA O TEXTO \o/ AQUI FICA O TEXTO =O<br><br><br>

AQUI FICA O TEXTO ^^'' AQUI FICA O TEXTO =X<br><br><br>

AQUI FICA O TEXTO =D AQUI FICA O TEXTO =#<br><br><br>

AQUI FICA O TEXTO =S AQUI FICA O TEXTO =b<br><br><br>

AQUI FICA O TEXTO !! AQUI FICA O TEXTO q=<br><br><br>

AQUI FICA O TEXTO ?! AQUI FICA O TEXTO d=<br><br><br>

AQUI FICA O TEXTO =] AQUI FICA O TEXTO =§

<br><br></div>
</div>
<!-- FIM DA CONFIGURACAO -->
</body>
</html>
