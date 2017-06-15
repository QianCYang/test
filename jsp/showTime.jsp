<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
      
      <script type="text/javascript">
        //获取当前时间并拼接放到div中的函数
          function nowTime(){
              var nowDate = new Date();
              
              
              $("#time").text(nowDate.toLocaleString());
          }
          //加载后执行一次函数，以后每秒再执行
          $(function(){
              nowTime();
              setInterval("nowTime()", 1000);
          });
      </script>
</head>
<body>
        <div id="time"></div>
        <input type="button" value="提交">
</body>
</html>