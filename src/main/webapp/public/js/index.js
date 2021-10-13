$(document).ready(function () {
	//--------- change color value of the form text/password inputs -----
	displayToken();
	const textInputs = $("input[type='textbox']");
	const passwordsInputs = $("input[type='password']");
	//--------- Login screen swicth -----

	$("button").click(function (event) {
		//  prevent buttons in form to reload
		event.preventDefault();
	});

	$("a").click(function (event) {
		//  prevent 'a' links in form to reload
		event.preventDefault();
	});

	$("#sign_up").click(function () {
		// when click Sign Up button, hide the Log In elements, and display the Sign Up elements
		$("#title-login").toggleClass("hidden", true);
		$("#login-fieldset").toggleClass("hidden", true);
		$("#login-form-submit").toggleClass("hidden", true);
		$("#lost-password-link").toggleClass("hidden", true);
		$("#sign_up").toggleClass("active-button", false);
		$("#log_in").removeAttr("disabled");

		$("#title-signup").toggleClass("hidden", false);
		$("#signup-fieldset").toggleClass("hidden", false);
		$("#signup-form-submit").toggleClass("hidden", false);
		$("#log_in").toggleClass("active-button", true);
		$("#sign_up").prop("disabled", true);
	});

	$("#log_in").click(function () {
		// when click Log In button, hide the Sign Up elements, and display the Log In elements
		$("#title-login").toggleClass("hidden", false);
		$("#login-fieldset").toggleClass("hidden", false);
		$("#login-form-submit").toggleClass("hidden", false);
		$("#lost-password-link").toggleClass("hidden", false);
		$("#sign_up").toggleClass("active-button", true);
		$("#log_in").prop("disabled", true);

		$("#title-signup").toggleClass("hidden", true);
		$("#signup-fieldset").toggleClass("hidden", true);
		$("#signup-form-submit").toggleClass("hidden", true);
		$("#log_in").toggleClass("active-button", false);
		$("#sign_up").removeAttr("disabled");
		
	});
	
	$("#login-form-submit").click(function(){
		$.ajax({
			type: 'POST',
			url: '/web/main/loginPage.do'  , 
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify( {TEST: "TEST"}),
			async : true,
			success: function(res){
				console.log(res);
			},
		});
	})
	$("#custom-login-btn").click(loginWithKakao);
	
	function loginWithKakao() {
	  Kakao.Auth.authorize({
	      redirectUri: 'localhost:8080'
	  })
	}
	  // 아래는 데모를 위한 UI 코드입니다.
	  
	function displayToken() {
	  const token = getCookie('authorize-access-token')
	  if(token) {
	    Kakao.Auth.setAccessToken(token)
	    Kakao.Auth.getStatusInfo(({ status }) => {
	      if(status === 'connected') {
	        document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
	      } else {
	        Kakao.Auth.setAccessToken(null)
	      }
	    })
	  }
	}
	  function getCookie(name) {
	    const value = "; " + document.cookie;
	    const parts = value.split("; " + name + "=");
	    if (parts.length === 2) return parts.pop().split(";").shift();
	  }
});
