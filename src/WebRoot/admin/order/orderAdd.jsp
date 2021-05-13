<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>

    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css"/>

    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

    <script language="javascript">

        function setUserId(userId, userName) {
            document.getElementById("user_id").value = userId;
            document.getElementById("user_name").value = userName.trim();
        }

        function setBookId(bookId, bookName) {
            document.getElementById("book_id").value = bookId;
            document.getElementById("book_name").value = bookName.trim();
        }

        function userAll() {
            var strUrl = "<%=path %>/user?type=userAll";
            var ret = window.open(strUrl, "", "dialogWidth:800px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
        }

        function catelogAll() {
            var strUrl = "<%=path %>/catelog?type=catelogAll";
            var ret = window.open(strUrl, "", "dialogWidth:900px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
        }


        function check() {
            if (document.getElementById("user_id").value == "") {
                alert("Please choose the user");
                return false;
            }
            if (document.getElementById("book_id").value == "") {
                alert("Please choose the book");
                return false;
            }
            if (document.getElementById("order_num").value == "") {
                alert("Please enter the borrow quantity");
                return false;
            }
        }

    </script>
</head>

<body leftmargin="2" topmargin="9">
<form action="<%=path %>/order?type=orderAdd" name="formAdd" method="post">
    <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#BBC9E8"
           style="margin-bottom:8px">
        <tr bgcolor="#EEF4EA">
            <td colspan="3" class='title'><span>Book Order</span></td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                User Id:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="user_id" id="user_id" readonly/>
                <input type="button" value="Choose" onClick="userAll()"/>
            </td>
        </tr>

        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                User Name:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="user_id" id="user_name" readonly/>
            </td>
        </tr>

        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                Book Id:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="book_id" id="book_id" readonly/>
                <input type="button" value="Select" onClick="catelogAll()"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                Book Name:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="book_id" id="book_name" readonly/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                Order Quantity:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="order_num" id="order_num" onpropertychange="onchange1(this.value)"
                       onKeyUp="this.value=this.value.replace(/\D/g,'')"
                       onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                Order time:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input name="order_time" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"
                       type="text"/>
            </td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">&nbsp;

            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="hidden" name="userId" value="<%=request.getParameter("userId") %>"/>
                <input type="submit" value="Submit" onClick="return check()"/>&nbsp;
                <input type="reset" value="Reset"/>&nbsp;
            </td>
        </tr>
    </table>
</form>
</body>
</html>
