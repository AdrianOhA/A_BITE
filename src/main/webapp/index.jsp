<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html ng-app="ABite_App">
<head>
  <title>한입만 - A_BITE</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name ="google-signin-client_id" content="828033129621-ek46og45ctbgt5n1hgrq7q8pabt12mh4.apps.googleusercontent.com">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/animate.min.css">  
  <link rel="stylesheet" href="/css/index.css">
  <link rel="icon" href="/images/favicon.ico">
  <script src="/js/jquery.min.js"></script>
  <script src="/js/kakao.min.js"></script>
  <script src="https://apis.google.com/js/platform.js"  ></script>
  <script src="/js/angular_1.6.9.min.js"></script>
  <script src="/js/index.js"></script>
  <style>
  .dropdown_list:hover{
     opacity: 1;
     cursor: pointer;
     background: black;
  }
  </style>
</head>
<body ng-controller="mainCtrl" ng-init="init()">
	<div class="bg_wrap">
		<div class="top_wrap"></div>
		<div class="panel shadow1">
			<form class="login-form">
				<div class="panel-switch animated fadeIn">
					<button type="button" id="sign_up" class="active-button">회원 가입</button>
					<button type="button" id="log_in" class="" disabled>로그인</button>
				</div>
				<div class="top_wrapper">
					<h1 class="animated fadeInUp animate1" id="title-login">반가워요 !<br>음식쉐어 플랫폼<br>한입만</h1>
					<h1 class="animated fadeInUp animate1 hidden" id="title-signup">반가워요 !<br>음식쉐어 플랫폼<br>한입만</h1>
					<a id="reset_login" class="reset_login animate1 hidden">초기 화면</a>
				</div>
			
				<fieldset id="login-fieldset">
					<input class="login animated fadeInUp animate2" name="email" type="textbox" required placeholder="이메일" value="" ng-model="login.email">
					<input class="login animated fadeInUp animate3" name="password" type="password" required placeholder="비밀번호" value="" ng-model="login.password">
					<span id="login_msg" style="display: none;color:red;"  class="small_font"></span>
				</fieldset>
				<fieldset id="signup-fieldset-sns" class="hidden animated fadeInUp animate2">
					<div id="gSignInWrapper">
				    	<div class="customGPlusSignIn" id="google_btn">
				      		<span class="icon"></span>
				      		<span class="buttonText">Google로 시작하기</span>
				    	</div>
					  </div>
					  <div id="gSignInWrapper" style="margin-top: 15px;">
					  	<a id="kakao_btn"><img src="/images/kakao_login_medium_narrow.png"></a>
					  </div>
				</fieldset>
				<fieldset id="signup-fieldset" class="hidden animated fadeInUp animate2">
					<div class="img-container animated fadeInUp animate3 form-input">
					    <div class="avatar-upload">
					        <div class="avatar-edit">
					            <input type='file' id="title-thumbnail" accept=".png, .jpg, .jpeg"  />
					            <label for="title-thumbnail"></label>
					        </div>
					        <div class="avatar-preview">
					            <div id="imagePreview" style="background-image: url(/images/icon-user.png);" class="checkImgup"></div>
					        </div>
					    </div>
					</div>
					<input class="signup animated fadeInUp animate3" name="email" type="textbox" required placeholder="이메일" ng-value="profile.email" id="signup_email" ng-model="profile.email" style="width: 335px;height: 10px;padding-left: 10px;">
					<span id="checkid" style="display: none;" class="small_font"></span>
					<input class="signup animated fadeInUp animate3" name="nickname" type="textbox" required placeholder="이름" ng-value="profile.name" id="signup_nick" ng-model="profile.name" style="width: 335px;height: 10px;padding-left: 10px;">
					<input class="signup animated fadeInUp animate3" name="password" type="password" required placeholder="비밀번호" ng-value="profile.password" ng-model="profile.password" style="width: 335px;height: 10px;padding-left: 10px;">
					<input class="signup animated fadeInUp animate3" name="password_confirm" type="password" required placeholder="비밀번호 확인" ng-value="profile.passwordcf" ng-model="profile.passwordcf" style="width: 335px;height: 10px;padding-left: 10px;">
					<div class="animated fadeInUp animate3">
						<input type="text" ng-model="address" id="address" ng-keyup="search_address($event)"required placeholder="주소"  ng-model="profile.address" style="width: 200px !important;height: 10px;padding-left: 10px;float: left">
						<i class="fa fa-search search-bar input-group-append" aria-hidden="true" style="float: right;margin-top: 20px;cursor: pointer;" ng-click="search_address2()"></i>
					</div>
					<span id="checkpwd" style="display: none;color:red;"  class="small_font">비밀번호가 일치하지 않습니다.</span>
				</fieldset>
				<input type="button" id="login-form-submit" class="login_form button animated fadeInUp animate3" value="로그인">
				<input type="button" id="signup-form-submit" class="signup_form button animated fadeInUp animate5 hidden" value="가입하기">
			</form>
			<div class="input-group address-info" ng-show="addressList.length > 0">
			    <div style="background:#7B6341;" classs="drop_header">
				    <span class="title">주소</span>
					<input type="text" ng-model="address" required placeholder="주소" style="	padding-left: 10px;border: 1px solid #e6e6e6;border-radius: 5px;margin-bottom: 5px;margin-top: 5px;margin-bottom: 5px;" ng-keyup="search_address($event)">
					<i class="fa fa-search search-bar input-group-append" aria-hidden="true" ng-click="search_address2()" style="cursor:pointer;"></i>
				</div>
				<div class="dropdown-menu" id="address_list" style="">
				    <div ng-repeat="address in addressList" ng-click="selected_address(address.address, address.lat, address.lng )" class="dropdown_list">
				    	<a href="" tabindex="" class="ng-binding ng-scope" title="" style="color:#fff;"><strong>{{address.address}}</strong></a>
				    </div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
document.cookie = 'cross-site-cookie=bar; SameSite=None; Secure';
<% 
	Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO");
	if(user_info != null) {
		response.sendRedirect("/dev/main.do");  
	}
%>
</script>
</html>