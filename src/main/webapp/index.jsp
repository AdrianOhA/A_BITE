<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="ABite_App">
<head>
  <title>한입만 - A_BITE</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name ="google-signin-client_id" content="828033129621-ek46og45ctbgt5n1hgrq7q8pabt12mh4.apps.googleusercontent.com">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="../public/css/animate.min.css">  
  <link rel="stylesheet" href="../public/css/index.css">
  <link rel="icon" href="../public/images/favicon.ico">
  <script src="../public/js/jquery.min.js"></script>
  <script src="../public/js/kakao.min.js"></script>
  <script src="https://apis.google.com/js/platform.js"  ></script>
  <script src="../public/js/angular_1.6.9.min.js"></script>
  <script src="../public/js/index.js"></script>
</head>
<body ng-controller="mainCtrl" ng-init="init()">
	<div class="bg_wrap">
		<div class="top_wrap"></div>
		<div class="panel shadow1">
			<form class="login-form">
				<div class="panel-switch animated fadeIn">
					<button type="button" id="sign_up" class="active-button">Sign Up</button>
					<button type="button" id="log_in" class="" disabled>Log in</button>
				</div>
				<div class="top_wrapper">
					<h1 class="animated fadeInUp animate1" id="title-login">Welcome !</h1>
					<h1 class="animated fadeInUp animate1 hidden" id="title-signup">Welcome !</h1>
					<img class="animated fadeInUp animate1 hidden thumbnail" id="title-thumbnail" src="{{profile.img}}" onerror="this.src='../public/images/icon_user.png'" />
					<a id="reset_login" class="reset_login animate1 hidden">초기 화면</a>
				</div>
				<fieldset id="login-fieldset">
					<input class="login animated fadeInUp animate2" name="email" type="textbox" required placeholder="Email" value="" ng-model="login.email">
					<input class="login animated fadeInUp animate3" name="password" type="password" required placeholder="Password" value="" ng-model="login.password">
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
					  	<a id="kakao_btn"><img src="../public/images/kakao_login_medium_narrow.png"></a>
					  </div>
				</fieldset>
				<fieldset id="signup-fieldset" class="hidden animated fadeInUp animate2">
					<input class="signup animated fadeInUp animate3" name="email" type="textbox" required placeholder="Email" ng-value="profile.email" id="signup_email" ng-model="profile.email">
					<span id="checkid" style="display: none;" class="small_font"></span>
					<input class="signup animated fadeInUp animate3" name="nickname" type="textbox" required placeholder="NickName" ng-value="profile.name" id="signup_nick" ng-model="profile.name">
					<input class="signup animated fadeInUp animate3" name="password" type="password" required placeholder="Password" ng-value="profile.password" ng-model="profile.password">
					<input class="signup animated fadeInUp animate3" name="password_confirm" type="password" required placeholder="Password Confirm" ng-value="profile.passwordcf" ng-model="profile.passwordcf">
					<span id="checkpwd" style="display: none;color:red;"  class="small_font">비밀번호가 일치하지 않습니다.</span>
				</fieldset>
				<input type="button" id="login-form-submit" class="login_form button animated fadeInUp animate3" value="Log in">
				<input type="button" id="signup-form-submit" class="signup_form button animated fadeInUp animate5 hidden" value="Sign up">
			</form>
		</div>
	</div>
</body>
</html>