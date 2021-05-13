<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
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
		
        <script language="javascript">
           function bookDel(id)
           {
               if(confirm('Are you sure to delete?'))
               {
                   window.location.href="<%=path %>/book?type=bookDel&id="+id;
               }
           }

		   function bookStock(id)
		   {
			   if(confirm('What number will you set'))
			   {
				   window.location.href="<%=path %>/book?type=bookStock&id="+id;
			   }
		   }

           function bookAdd()
           {
                 var url="<%=path %>/admin/book/bookAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#BBC9E8" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10"  class='title'>&nbsp;Book Management&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF" height="22">
					<td width="10%">Book Title</td>
					<td width="10%">Author</td>
					<td width="10%">Publisher</td>
					<td width="10%">Publication Date</td>
					<td width="10%">ISBN</td>
					<td width="10%">Price</td>
					<td width="10%">Pages</td>
					<td width="10%">Stock</td>
					<td width="10%">Language</td>
					<td width="10%">Operation</td>
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
						${book.pages }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${book.stock }
					</td>
					<td bgcolor="#FFFFFF" align="center">
							${book.language}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="bookDel(${book.id })" class="pn-loperator">Delete</a>
						<a href="#" onclick="bookStock(${book.id })" class="pn-loperator">Change_Stock</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			 <TR align="right">
              <TD ><form action="" method="post" name="formpage">
                  <input type="hidden" name="pageCount" value="${requestScope.pagecount}" />
                  <!--//Pass value for javascript-->
                  <input type="hidden" name="page" value="${requestScope.page}" />
                  <input type="hidden" name="jumpurl" value="<%=path%>/book?type=bookMana&" />
                  <a href="#" onClick="PageTop()"><strong>Front Page</strong></a>&nbsp;&nbsp;&nbsp;
                  <a href="#" onClick='PagePre()'><strong>Back</strong></a>&nbsp;&nbsp;&nbsp;
                  ${requestScope.cou} records in total,
                  ${requestScope.pagecount} pages in total,
                  right now in page ${requestScope.page}&nbsp;&nbsp;&nbsp;
                  <a href="#" onClick="PageNext()"><strong>Next</strong></a>&nbsp;&nbsp;&nbsp;
                  <a href="#" onClick="PageLast()"><strong>Last</strong></a> No.
                  <input name="busjump" type="text" size="3" value="${requestScope.page}" style=" width:15px"/>
                  Page<a href="#" onClick="bjump()"><strong>Transfer</strong></a>&nbsp;&nbsp;&nbsp;
                </form>
                <script type="text/javascript" src="<%=path%>/js/page.js"></script></TD>
            </TR>
		    </table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="Add" style="width: 80px;" onclick="bookAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
