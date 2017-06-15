<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
<script type="text/javascript">  
function loadXMLDoc()//ajax发送请求并显示  
{  
var xmlhttp;  
if (window.XMLHttpRequest)  
  {// code for IE7+, Firefox, Chrome, Opera, Safari  
  xmlhttp=new XMLHttpRequest();  
  }  
else  
  {// code for IE6, IE5  
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");  
  }  
xmlhttp.onreadystatechange=function()  
  {  
  if (xmlhttp.readyState==4 && xmlhttp.status==200)  
    {  
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;  
    }  
  }  
xmlhttp.open("POST","${pageContext.request.contextPath}/book/qcy4",true);  
xmlhttp.send();  
setTimeout("loadXMLDoc()",1000);//递归调用  
}  
loadXMLDoc();//先执行一次  



</script>
</head> 
<body> 


<form enctype="multipart/form-data" method="post" id="fp" action="${pageContext.request.contextPath }/file/upload">

    <input type="file" name="file"/>
    <input type="submit" text="提交">

</form>



 
<button type="button" onclick="loadXMLDoc()">中文字符</button>  
<div id="myDiv"></div>  
<div id=show"></div>  
</body>  
</html>  