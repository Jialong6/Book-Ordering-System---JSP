<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Management page</title>
<!-- calling CSS，JS -->
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "Times New Roman";
	font-size: 12px;
	color: #333333;	background-color: #2286C2;

}
-->
</style>
	<link rel="StyleSheet" href="<%=path %>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=path %>/js/dtree.js"></script>
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="10" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF" height="600PX"  style="padding-left:10px; padding-top:10px">
    
    
    
   <script type="text/javascript">
							<c:if test="${sessionScope.userType==0}">
											    
														d = new dTree('d');
										        d.add(0,-1,'Functionality Menu');
												
												d.add(1,0,'Basic Operation','#');
												d.add(11,1,'Change Password','<%=path %>/admin/userinfo/userPw.jsp','','I2');
												d.add(12,1,'Manage Admin','<%=path %>/admin?type=adminMana','','I2');
												
												d.add(2,0,'Book Subject manage','#');
												        d.add(21,2,'Add Subject','<%=path %>/admin/catelog/catelogAdd.jsp','','I2');
												        d.add(22,2,'Manage Subject','<%=path %>/catelog?type=catelogMana','','I2');
												
												
												d.add(3,0,'Book Management','#');
														d.add(31,3,'Add Book','<%=path %>/admin/book/bookAdd.jsp','','I2');
														d.add(32,3,'Manage Book','<%=path %>/book?type=bookMana','','I2');
												
												d.add(4,0,'User Management','#');
												        d.add(41,4,'Add User','<%=path %>/admin/user/userAdd.jsp','','I2');
												        d.add(42,4,'Manage User','<%=path %>/user?type=userMana','','I2');
											
											
											
												d.add(5,0,'Order Management','#');
												        d.add(51,5,'Make Order','<%=path %>/admin/order/orderAdd.jsp','','I2');
												        d.add(52,5,'Order Manage','<%=path %>/order?type=orderMana','','I2');
												document.write(d);
      	 </c:if>	
				
				
							<c:if test="${sessionScope.userType==1}">
											    
														d = new dTree('d');
										        d.add(0,-1,'Functionality Menu');
												
												d.add(1,0,'Basic Operation','#');
												d.add(11,1,'Change Password','<%=path %>/admin/userinfo/userPw.jsp','','I2');
												
												d.add(2,0,'User Management','#');
												        d.add(21,2,'Add User','<%=path %>/admin/user/userAdd.jsp','','I2');
												        d.add(22,2,'Manage User','<%=path %>/user?type=userMana','','I2');
											
											
											
												d.add(3,0,'Order Management','#');
												        d.add(31,3,'Make Order','<%=path %>/admin/order/orderAdd.jsp','','I2');
												        d.add(32,3,'Order Manage','<%=path %>/order?type=orderMana','','I2');
												document.write(d);
      	 </c:if>	
										   </script>
    </td>
  </tr>
</table>
		
	</body>
</html>
