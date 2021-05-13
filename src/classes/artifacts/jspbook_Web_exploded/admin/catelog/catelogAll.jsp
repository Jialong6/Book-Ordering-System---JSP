<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base target="_self">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css"/>
    <link href="<%=path %>/css/dtree.css" rel="stylesheet" type="text/css">

    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>

    <title></title>
    <script type="text/javascript">

        function queding() {
            const selects = document.getElementsByName("book_id");
            const bookNames = document.getElementsByClassName("book_name");
            for (let i = 0; i < selects.length; i++) {
                if (selects[i].checked == true) {
                    window.opener.setBookId(selects[i].value, bookNames[i].innerHTML)
                }
            }
            window.close();
        }
    </script>
</head>

<body>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#BBC9E8" align="center" style="margin-top:8px">
    <tr align="center" bgcolor="#FFFFFF" height="22">
        <td width="15%">Book Name</td>
        <td width="15%">Author</td>
        <td width="15%">Publisher</td>
        <td width="15%">Publication Date</td>
        <td width="15%">ISBN</td>
        <td width="15%">Price</td>
        <td width="15%">Language</td>
        <td width="5%">Operation</td>
    </tr>
    <c:forEach items="${requestScope.bookList}" var="book">
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td bgcolor="#FFFFFF" align="center" class="book_name">
                    ${book.name }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${book.author }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${book.publisher }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${book.publication_time }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${book.isbn }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${book.price }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${book.language }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <input type="radio" name="book_id" style="border: 0" value="${book.id}"/>
            </td>
        </tr>
    </c:forEach>
</table>

<table width='98%' border='0' style="margin-top:8px;margin-left: 5px;">
    <tr>
        <td>
            <input type="button" value="Confirm" style="width: 80px;" onclick="queding()"/>
        </td>
    </tr>
</table>

</body>
</html>
