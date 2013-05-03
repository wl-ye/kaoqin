<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="io.loli.kaoqin.javabean.* ,java.util.*, io.loli.kaoqin.service.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/c" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<script>
function approveLeave(id){
	alert(id);
}
</script>
</head>
<fmt:setBundle basename="io.loli.kaoqin.prop.info"/>
<%
	LeaveService ls = new LeaveService();
	List<Leave> leaveList = ls.listByApproved(false);
	request.setAttribute("leaveList", leaveList);
%>
<table>
<tr>
<th><fmt:message key="leave.fromDate"></fmt:message></th>
<th><fmt:message key="leave.toDate"></fmt:message></th>
<th><fmt:message key="leave.tip"></fmt:message></th>
</tr>

<c:forEach var="leave" items="${leaveList}">
<tr>
<td><fmt:formatDate value="${leave.startDate}" pattern="yyyy-MM-dd"/>
<c:if test="${(leave.startMorning&&leave.startAfternoon)||(leave.startMorning==true&&leave.startAfternoon==false)}"><fmt:message key="leave.morning"></fmt:message></c:if>
<c:if test="${leave.startAfternoon&&!leave.startMorning}"><fmt:message key="leave.afternoon"></fmt:message></c:if>
</td>
<td><fmt:formatDate value="${leave.endDate}" pattern="yyyy-MM-dd"/>
<c:if test="${leave.endMorning&&!leave.endAfternoon}"><fmt:message key="leave.morning"></fmt:message></c:if>
<c:if test="${leave.endAfternoon&&leave.endMorning}"><fmt:message key="leave.afternoon"></fmt:message></c:if>
</td>
<td>
<c:out value="${leave.tip}"></c:out>
</td>
<td>
<input type="button" onclick="approveLeave(${leave.id});" value="<fmt:message key="leave.approve"/>">
</td>
<td>
<input type="button" onclick="refuseLeave(${leave.id});" value="<fmt:message key="leave.back"/>">
</td>
</tr>
</c:forEach>
</table>