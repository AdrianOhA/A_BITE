<!DOCTYPE html>
<html ng-app="ABite_App" ng-cloak lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><tiles:insertAttribute name="title" /></title>
<%@ include file="/WEB-INF/views/common/common_include_css.include" %>
<%@ include file="/WEB-INF/views/common/common_include_script.include" %>
<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

</head>
<script>
var sock = new SockJS("/dev/echo.do");
function load(){
	var msg = {
		type: "register",
		userid : "<%= user_info.get("USER_ID") %>"
	}
	sock.send(JSON.stringify(msg));
}
</script>

<body onload="load()"> 
	<c:if test="${USER_INFO != null}">
		<tiles:insertAttribute name="preload" flush="false" ignore="false" />
	</c:if>
	<c:if test="${USER_INFO != null}">
	<tiles:insertAttribute name="top" flush="false" ignore="false" />
	</c:if>
	<tiles:insertAttribute name="middle" flush="false" ignore="false" />
	<c:if test="${USER_INFO != null}">
	<tiles:insertAttribute name="chat" flush="false" ignore="false" />
	</c:if>
	<c:if test="${USER_INFO != null}">
	<tiles:insertAttribute name="footer" flush="false" ignore="false" />
	</c:if>
</body>
</html>
