<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>한입만 - A_BITE</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link rel="stylesheet" href="../public/css/animate.min.css">  
  <link rel="stylesheet" href="../public/css/index.css">
  <link rel="icon" href="../public/images/favicon.ico">
  <script src="../public/js/kakao.min.js"></script>
  <script src="../public/js/jquery.min.js"></script>
  <script src="../public/js/index.js"></script>
</head>

<body>
	<div class="bg_wrap">
		<div class="top_wrap"></div>
		<div class="panel shadow1">
			<form class="login-form">
				<div class="panel-switch animated fadeIn">
					<button type="button" id="sign_up" class="active-button">Sign Up</button>
					<button type="button" id="log_in" class="" disabled>Log in</button>
				</div>
				<h1 class="animated fadeInUp animate1" id="title-login">Welcome !</h1>
				<h1 class="animated fadeInUp animate1 hidden" id="title-signup">Welcome !</h1>
				<fieldset id="login-fieldset">
					<input class="login animated fadeInUp animate2" name="username" type="textbox" required placeholder="Username" value="">
					<input class="login animated fadeInUp animate3" name="password" type="password" required placeholder="Password" value="">
				</fieldset>
				<fieldset id="signup-fieldset" class="hidden">
					<a id="custom-login-btn">
					  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
					</a>
					<p id="token-result"></p>
				</fieldset>
				<input type="button" id="login-form-submit" class="login_form button animated fadeInUp animate4" value="Log in">
				<input type="submit" id="signup-form-submit" class="login_form button animated fadeInUp animate4 hidden" value="Sign up">
				<p><a id="lost-password-link" href="" class="animated fadeIn animate5">I forgot my login or password (!)</a></p>
			</form>
		</div>
	</div>
</body>

</html>