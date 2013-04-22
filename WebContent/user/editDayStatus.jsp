<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat,java.util.*,io.loli.kaoqin.service.*,io.loli.kaoqin.javabean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="io.loli.kaoqin.prop.info" />
<style> 
body{font-size:12px;font-family:Verdana,Arial,"宋体";}
a:link {color:#464646;text-decoration:none;}
a:visited {color:#464646;text-decoration:none;}
a:hover{color:#ed145b;text-decoration:underline;}
a:active{color:#ed145b;text-decoration:underline;}
td{font-size:12px}
</style>
<script type="text/javascript">
var ie =navigator.appName=="Microsoft Internet Explorer"?true:false;
function $(objID){
return document.getElementById(objID);
}
</script>
<h2>修改</h2>
<% 
	int id = Integer.parseInt(request.getParameter("id"));
	DayStatus ds = new DayStatusService().findById(id);
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
	request.setAttribute("ds",ds);
%>
<script type="text/javascript" src="calendar.js"></script>
<form action="addDayStatus" method="post">
<input type="hidden" name="action" value="update">
<input type="hidden" name="id" value="${ds.id}">
<table>
<tr><td><fmt:message key="list.date"></fmt:message></td><td><input size="16" value="<%=sdf1.format(ds.getDate())%>" name="date" style="border:1px solid #666"  type="text" readonly="readonly" onclick="showcalendar(event, this);" onfocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''"></td></tr>
<tr><td>上班时间:</td><td><input type="text" value="<%=ds.getStartTime().getHours()%>" size="2" name="starttimehour">时<input value="<%=ds.getStartTime().getMinutes()%>" type="text" size="3" name="starttimemin">分</td></tr>
<tr><td>下班时间:</td><td><input type="text" value="<%=ds.getEndTime().getHours()%>" size="2" name="endtimehour">时<input value="<%=ds.getEndTime().getMinutes()%>" type="text" size="3" name="endtimemin">分</td></tr>
<tr><td>工作小时数:</td><td><input value="${ds.workHours}" type="text" size="2" name="workhours"></td></tr>
<tr><td>休息小时数:</td><td><input value="${ds.breakHours}" type="text" size="2" name="breakhours"></td></tr>
<tr><td>加班小时数:</td><td><input value="${ds.extraHours}" type="text" size="2" name="extrahours"></td></tr>
<tr><td>工作内容:</td><td><input value="${ds.tip}" type="text" size="30" name="tip"></td></tr>
<tr><td><input type="submit" value="提交"></td></tr>
</table>
</form>
