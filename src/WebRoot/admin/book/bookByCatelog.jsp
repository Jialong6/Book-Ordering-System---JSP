<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
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
							${book.lang }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="book_id" style="border: 0" value="${book.id}"/>
					</td>
				</tr>
				</c:forEach>
	    </table>
  </body>
</html>
