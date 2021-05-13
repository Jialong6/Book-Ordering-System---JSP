<%@ page language="java" pageEncoding="UTF-8" %>
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

    <script language="javascript">
        function StringBuffer() {
            this._strs = new Array;
        }

        StringBuffer.prototype.append = function (str) {
            this._strs.push(str); //Add
        }
        StringBuffer.prototype.pop = function (str) {
            this._strs.pop(str); //Delete the last one
        }
        StringBuffer.prototype.toString = function () {
            return this._strs.join(",");
        }

        function queding() {

            const selects = document.getElementsByName("user_id");
            const userNames = document.getElementsByClassName("user_name");
            for (let i = 0; i < selects.length; i++) {
                if (selects[i].checked == true) {
                    window.opener.setUserId(selects[i].value, userNames[i].innerHTML)
                }
            }

            window.close();
        }
    </script>
</head>

<body leftmargin="2" topmargin="2">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#BBC9E8" align="center" style="margin-top:8px">
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="100" class='title'>&nbsp;Select the reader&nbsp;</td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF" height="22">
        <td width="12%">Identification number</td>
        <td width="12%">Name</td>
        <td width="12%">Sex</td>
        <td width="12%">Age</td>
        <td width="16%">Address</td>
        <td width="12%">Phone number</td>
        <td width="12%">E-mail</td>
        <td width="12%">Operation</td>
    </tr>
    <c:forEach items="${requestScope.userList}" var="user">
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td bgcolor="#FFFFFF" align="center">
                    ${user.id_code }
            </td>
            <td bgcolor="#FFFFFF" align="center" class="user_name">
                    ${user.name }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${user.sex }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${user.age }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${user.address }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${user.tel }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                    ${user.email }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <input style="border: 0" type="radio" name="user_id" value="${user.id}"/>
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
