<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
    <meta http-equiv="description" content="This is my page" />

    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />

    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

    <script language="javascript">
        var i=0;
        function findAllCatelog()
        {
            if(i==0)
            {
                document.getElementById("indicator").style.display="block";
                loginService.catelogAll(callback);
                i=1;
            }

        }
        function callback(data)
        {
            document.getElementById("indicator").style.display="none";
            DWRUtil.addOptions("catelog_id",data,"id","name");
        }

        function check()
        {
            if(document.formAdd.catelogId.value==0)
            {
                alert("Please choose the subject of the book");
                return false;
            }
            return true;
        }
    </script>
</head>

<body leftmargin="2" topmargin="9">
<form action="<%=path %>/book?type=bookAdd" name="formAdd" method="post">
    <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#BBC9E8" style="margin-bottom:8px">
        <tr bgcolor="#EEF4EA">
            <td colspan="3"   class='title'><span>Search For Book</span></td>
        </tr>
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                Search Criterion:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <table border="0">
                    <tr>
                        <td>
                            <select name="criteria" id="criteria" onclick="findAllCatelog()">
                                <option value = "0">Please choose the one criteria </option>
                                <option value = "1">Title</option>
                                <option value = "2">Author</option>
                                <option value = "3">Publisher</option>
                                <option value = "4">Language</option>
                            </select>
                        </td>
                        <td><img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                Input box:
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="name" size="20"/>
            </td>
        </tr>

        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td width="25%" bgcolor="#FFFFFF" align="right">
                &nbsp;
            </td>
            <td width="75%" bgcolor="#FFFFFF" align="left">
                <input type="submit" value="Submit" onclick="return check()"/>&nbsp;
                <input type="reset" value="Reset"/>&nbsp;
            </td>
        </tr>
    </table>
</form>
</body>
</html>
