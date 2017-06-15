<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.form.js"></script>
<script type="text/javascript">
	function upset() {

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/book/qcy2',
			data : $('#form1').serialize(),
			/* contentType : "application/x-www-form-urlencoded", */

			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				alert("Success");
				var str = "";
				$.each(data, function(index, element) {

					str = str + index + ":" + element + " ";
				});
				$("#cont").html(str);
				alert(data);
			}

		});
	}

	function upset1() {

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/book/qcy3',

			async : true,
			/* contentType : "application/x-www-form-urlencoded", */

			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {

				var str = "";
				$.each(data, function(index, element) {

					str = str + element;
				});
				$("#cont").html(str);
				alert(data);
			}

		});
	}
//从服务器端获取时间
	function gettime() {
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/book/qcy4',
			success : function(data) {
				
				document.getElementById("time1").innerHTML = data;
				setInterval("gettime()", 5000);//递归调用  
			}

		});

	}
//从本地获取时间
	var myVar =setInterval(function() {myTimer()}, 0);
	
	function myTimer() {
		var d = new Date();
		var t = d.toLocaleTimeString();

		document.getElementById("demo").innerHTML = t;
		clearInterval(myVar);
		setTimeout("myTimer()", 1000)
	}
	
	gettime();
</script>
</head>
<body>

	<!-- <body onload="myTimer()"> -->
	<form id="form1">
		<input value="${book.bookId}" name="bookId" /> <input
			value="${book.name}" name="name" /> <input value="${book.number}"
			name="number" /> <input type="button" value="提交" onclick="upset1();">
	</form>
	<br>

	<form action="${pageContext.request.contextPath}/book/qcy2"
		method="post">
		<input type="text" value="${book.bookId}" name="bookId" id="bookId" />
		<input type="text" value="${book.name}" name="name" id="name" /> <input
			type="text" value="${book.number}" name="number" id="number" /> <input
			type="submit" value="提交">
	</form>

	<div id="cont"></div>
	<div id="time1"></div>
	<div id="time2"></div>
	<p id="demo"></p>
	<input type="button" onclick="myTimer();" value="点击">
</body>
</html>