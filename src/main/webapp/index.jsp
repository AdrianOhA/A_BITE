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
		<div class="panel shadow1 form_center">
			<div class="panel-switch animated fadeIn  tabs">
				<input type="radio" name="tabs" id="sign_up"> 
				<label  for="sign_up" class=""><img src="/images/add_user.png" style="width: 20px;height: 20px;">회원가입</label>
				<input type="radio" name="tabs" id="log_in" checked="checked">
				<label  for="log_in" class=""><img src="/images/sign-in.png" style="width: 22px;height: 21px;">로그인</label>
			</div>
			<form class="login-form">
				<div class="top_wrapper">
					<img src="/images/logo_w.png" id="title_logo" />
					<h1 class="animated fadeInUp animate1" id="title-login">반가워요 !<br>음식쉐어 플랫폼<br>한입만</h1>
					<h1 class="animated fadeInUp animate1 hidden" id="title-signup">반가워요 !<br>음식쉐어 플랫폼<br>한입만</h1>
				</div>
				<fieldset id="login-fieldset">
					<div class="login-box">
					    <div class="user-box">
					      <input type="text" name="email" required class="login animated fadeInUp animate2" value="" ng-model="loginForm.email">
					      <label class="animated fadeInUp animate2">Email</label>
					    </div>
					    <div class="user-box">
					      <input type="password" name="password" required class="login animated fadeInUp animate3" value="" ng-model="loginForm.password" ng-keyup="login2($event,true)" >
					      <label class="animated fadeInUp animate2">비밀번호</label>
					    </div>
					    <a href="#"  id="login-form-submit" class="button animated fadeInUp animate3" >
					      <span></span>
					      <span></span>
					      <span></span>
					      <span></span>
					      <img src="/images/sign-in.png" style="width: 21px;height: 21px;vertical-align: sub;">로그인
					    </a>
					</div>   
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
					  <div id="gSignInWrapper" style="margin-top: 15px;">
					  	<div class="customGPlusSignIn" ng-click="showSignUpForm()">
					  		<a id=""><img src="/images/signup_btn.png" style="border: thin solid #e5e5e5;border-radius: 0.3rem;width: 183px;"></a>
				    	</div>
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
					
					<div class="login-box">
					    <div class="user-box">
					      <input class="signup animated fadeInUp animate3" name="email" type="text" required ng-value="profile.email" id="signup_email" ng-model="profile.email">
					      <label class="animated fadeInUp animate3">Email</label>
					      <span id="checkid" style="display: none;" class="small_font"></span>
					    </div>
					    <div class="user-box">
					      <input class="signup animated fadeInUp animate3" name="nickname" type="text" required ng-value="profile.name" id="signup_nick" ng-model="profile.name">
					      <label class="animated fadeInUp animate3">이름</label>
					    </div>
					    <div class="user-box">
					      <input class="signup animated fadeInUp animate3" name="password" type="password" required ng-value="profile.password" ng-model="profile.password">
					      <label class="animated fadeInUp animate3">비밀번호</label>
					    </div>
					    <div class="user-box">
					      <input class="signup animated fadeInUp animate3" name="password_confirm" type="password" required ng-value="profile.passwordcf" ng-model="profile.passwordcf">
					      <label class="animated fadeInUp animate3">비밀번호 확인</label>
					    </div>
					    <div class="user-box">
					    	<span id="checkpwd" style="display: none;color:red;"  class="small_font">비밀번호가 일치하지 않습니다.</span>
					    </div>
					    <div class="user-box">
					      <input type="text" class="signup animated fadeInUp animate3" ng-model="address" id="address" style="width: 95%;" ng-keyup="search_address($event)" required  ng-model="profile.address">
						  <i class="fa fa-search search-bar input-group-append" aria-hidden="true" style="float: right;margin-top: 25px;cursor: pointer;" ng-click="search_address2()"></i>
					      <label class="animated fadeInUp animate3">주소</label>
					    </div>
					    
					    <a href="#" ng-click="signup(true)" class="button animated fadeInUp animate3" >
					      <span></span>
					      <span></span>
					      <span></span>
					      <span></span>
					      <img src="/images/add_user.png" style="width: 20px;height: 20px;vertical-align: sub;">가입하기
					    </a>
					     <a href="#"  id="reset_login" class="button animated fadeInUp animate3" >
					      <span></span>
					      <span></span>
					      <span></span>
					      <span></span>
					       <img src="/images/prev.png" style="width: 25px;height: 20px;vertical-align: sub;">돌아가기
					    </a>
					</div>  
				</fieldset>
			</form>
		</div>
	</div>
	<div class="address-info" ng-show="addressList.length > 0">
	    <div classs="drop_header">
		    <span class="title">주소</span>
			<input type="text" ng-model="address" required placeholder="주소" ng-keyup="search_address($event)">
			<i class="fa fa-search search-bar input-group-append" aria-hidden="true" ng-click="search_address2()" style="cursor:pointer;"></i>
		</div>
		<div class="dropdown-menu" id="address_list" style="">
		    <div ng-repeat="address in addressList" ng-click="selected_address(address.address, address.lat, address.lng )" class="dropdown_list">
		    	<a href="" tabindex="" class="ng-binding ng-scope" title="" style="color:#fff;height:40px;"><strong>{{address.address}}</strong></a>
		    </div>
		</div>
	</div>
	<div class="loading_bg" id="loadding_mask" style="display: none;">
	  <div class="loadBody">
	    <div class="logoSlot"></div>
	    <div class="loadTxt">처리중입니다......</div>
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