<%@ page	language="java" contentType="text/html; charset=UTF-8" buffer="500kb" autoFlush="false" %>
<!DOCTYPE html>

<html lang="ko" ng-app="ABite_App" ng-cloak>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/views/common/common_include_css.include" %>
<%@ include file="/WEB-INF/views/common/common_include_script.include" %>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><tiles:insertAttribute name="title" /></title>
</head>

<body> 
	<c:if test="${USER_INFO != null}">
	<tiles:insertAttribute name="top" flush="false" ignore="false" />
	</c:if>
	<tiles:insertAttribute name="middle" flush="false" ignore="false" />
	
	<c:if test="${USER_INFO != null}">
	<tiles:insertAttribute name="footer" flush="false" ignore="false" />
	</c:if>
	<c:if test="${USER_INFO != null}">
		<tiles:insertAttribute name="bottom" flush="false" ignore="false" />
	</c:if>
</body>
</html>
