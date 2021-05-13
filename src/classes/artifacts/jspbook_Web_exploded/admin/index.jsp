<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Book Management System</title>
<!-- CSSJS -->
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<frameset rows="75,*" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="<%=path %>/admin/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frameset COLS="220,*" cols="*" framespacing="0" frameborder="no" border="0"   name="btFrame" id="btFrame">
     <frame src="<%=path %>/admin/left.jsp" name="bottomFrame"  scrolling="yes"  noresize="noresize" id="bottomFrame" />
   <frame src="<%=path %>/admin/index/sysPro.jsp" name="I2" id="I2"  scrolling="yes" />
  </frameset>
</frameset>
<noframes>
	<body>
    </body>
	</noframes></html>
