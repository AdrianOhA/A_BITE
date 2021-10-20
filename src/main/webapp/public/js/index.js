"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));

mainApp.controller("mainCtrl", function($scope) {
    $scope.init = function(msg) {
    	$scope.login = {
    		email : "",
    		password: ""
    	};
    	
        $scope.profile = {
           img: "../public/images/icon_user.png",
           name: "",
           email: "",
           sns: "",
           token: "",
           password: "",
           passwordcf: ""
        };
        $scope.confirm = false;
        $scope.auth2 = {};
        Kakao.init('9082202a7a69c9e010c8039829d23683');
        Kakao.isInitialized();
        $scope.google_init();
        $scope.getCode();
        $scope.setEvent();
    };
    
    $scope.setEvent = function() {
        $("button, a").click(function(event) {
            event.preventDefault();
        });

        $("#sign_up").click(function() {
        	if($scope.profile.sns != null && $scope.profile.sns != '') {
        		$scope.showSignUpForm($scope.profile);
        	} else {
        		 $("#title-thumbnail").toggleClass("hidden", true);
                 $(".reset_login").toggleClass("hidden", true);
                 $("#title-login").toggleClass("hidden", true);
                 $("#title-signup").toggleClass("hidden", false);
                 $("#login-fieldset").toggleClass("hidden", true);
                 $("#login-form-submit").toggleClass("hidden", true);
                 $("#lost-password-link").toggleClass("hidden", true);
                 $(".signup_form").css('margin-top', '85px');
                 $("#signup-fieldset").toggleClass("hidden", true);
                 $("#sign_up").toggleClass("active-button", false);
                 $("#log_in").removeAttr("disabled");
                 $("#title-signup").toggleClass("hidden", false);
                 $("#signup-fieldset-sns").toggleClass("hidden", false);
                 $("#signup-form-submit").toggleClass("hidden", false);
                 $("#log_in").toggleClass("active-button", true);
                 $("#sign_up").prop("disabled", true);
        	}
        });
        
        $("#signup_email").focusout(function(){
        	var _id = $("#signup_email").val() || "";
        	if (_id == "") return;
        	$.ajax({
                type: 'POST',
                url: '/Auth/isExistsForMember.json',
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify({email: _id}),
                async: true,
                success: function(res) {
                	if(res.COUNT == 0) {
                		$("#checkid").css('color', 'black');
                		$("#signup_email").removeClass('valid');
                		$("#checkid").text("사용 가능합니다.");
                		$("#checkid").show();
                	} else {
                		$("#checkid").css('color', 'red');
                		$("#checkid").text("이미 등록된 email 입니다.");
                		$("#checkid").show();
                	}
                },
            });	
        });

        $("#log_in").click(function() {
            // when click Log In button, hide the Sign Up elements, and display the Log In elements
            $("#title-thumbnail").toggleClass("hidden", true);
            $(".reset_login").toggleClass("hidden", true);
            $("#signup-fieldset-sns").toggleClass("hidden", true);
            $("#signup-fieldset").toggleClass("hidden", true);
            $("#title-login").toggleClass("hidden", false);
            $("#title-signup").toggleClass("hidden", true);
            $("#login-fieldset").toggleClass("hidden", false);
            $("#login-form-submit").toggleClass("hidden", false);
            $("#lost-password-link").toggleClass("hidden", false);
            $(".signup_form").css('margin-top', '85px');
            $("#sign_up").toggleClass("active-button", true);
            $("#log_in").prop("disabled", true);
            $("#title-signup").toggleClass("hidden", true);
            $("#signup-fieldset-sns").toggleClass("hidden", true);
            $("#signup-form-submit").toggleClass("hidden", true);
            $("#log_in").toggleClass("active-button", false);
            $("#sign_up").removeAttr("disabled");
        });

        $("#signup-form-submit").click(function() {
        	if(!$("#checkid").is(':visible') || "이미 등록된 email 입니다." == $("#checkid").text()) {
        		$("#signup_email").addClass('valid');
        		return;
        	}
        	
            if (!$("#title-thumbnail").is(':visible')) {
                $scope.showSignUpForm($scope.profile);
            } else {
            	if(checkValidation("signup")){
            		if(checkPasswordValidation()){
            			$("#checkpwd").show();
            			return;
            		}
            		$("#checkpwd").hide();
            		$.ajax({
                        type: 'POST',
                        url: '/Auth/signup.json',
                        contentType: "application/json; charset=UTF-8",
                        data: JSON.stringify($scope.profile),
                        async: true,
                        success: function(res) {
                        	if (res.COUNT == 1) {
                        		$scope.login.email = $scope.profile.email;
                        		$scope.$apply();
                        		$("#log_in").click();
                        	}
                        },
                    });	
            	}
            }
        });

        $("#login-form-submit").click(function() {
        	if(checkValidation("login")){
        		
        	}
            /*$.ajax({
                type: 'POST',
                url: '/web/main/loginPage.do',
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify({
                    TEST: "TEST"
                }),
                async: true,
                success: function(res) {

                },
            });*/
        });
        
        $(".signup, .login").keyup(function(){
        	var _val = $(this).val || "";
        	if (_val != "") {
        		$(this).removeClass('valid');
        	}
        });
        
        $("#kakao_btn").click(function() {
            Kakao.Auth.authorize({
                redirectUri: encodeURI(location.href)
            });
        });

        $("#reset_login").click(function() {
        	if ($scope.profile.sns == "kakao") {
                location.href = "https://kauth.kakao.com/oauth/logout?client_id=5f85b8bbdad232cf4d9c4fb2bd07dad9&logout_redirect_uri=http://localhost:8080/"
            } else if($scope.profile.sns == "google"){
            	$scope.auth2 = gapi.auth2.getAuthInstance();
            	$scope.auth2.signOut().then(function() {
            		
            	});
            	$scope.auth2.disconnect();
        		location.reload();
            } else {
            	$("#sign_up").click();
            }
        });
    };
    
    $scope.login = function() {
        /*  $scope.loginForm = {
              USER_ID : $("#USER_ID").val() || '',
              PASSWORD : $("#PASSWORD").val() || ''
          }
          if(checkValidation($scope.loginForm)) {
              for(let key in $scope.loginForm) {
                  if ($scope.loginForm[key] == ''){
                      $("#" + key).css('border', '1px solid red');
                  } else {
                      $("#" + key).css('border', '0');
                  }
              }
              return false;
          }   
          $.ajax({
              type: "post",
              url: "/login.json",
              data : $scope.loginForm,
              success : function(result){
                  if (result.msg == "OK"){
                     location.href = '/chat.do';
                 }
              }
          });*/
    };

    $scope.getCode = function(){
        const code = $scope.getParameterByName("code");
        if (code) {
            $.ajax({
                type: 'POST',
                url: '/Auth/getAutoLoginForKakao.json',
                data: JSON.stringify({
                    code: code
                }),
                contentType: "application/json; charset=UTF-8",
                async: true,
                success: function(res) {
                	if (res.RESULT_CODE == 'E') {
                		 history.replaceState({}, null, location.pathname);
                	} else {
                		var customer = res.customer_info || {};
                        $scope.profile.img = customer.kakao_account.profile.thumbnail_image_url;
                        $scope.profile.name = customer.kakao_account.profile.nickname;
                        $scope.profile.email = customer.kakao_account.email;
                        $scope.profile.sns = "kakao";
                        $scope.profile.token = customer.token;
                        $scope.showSignUpForm($scope.profile);	
                	}
                },
            });
        }
    };

    $scope.getParameterByName = function(name){
    	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    };

    $scope.showSignUpForm = function(profile){	
        $(".signup_form").css('margin-top', '15px');
    	
    	$("#login-fieldset").toggleClass("hidden", true);
        $("#login-form-submit").toggleClass("hidden", true);
        $("#lost-password-link").toggleClass("hidden", true);
        $("#sign_up").toggleClass("active-button", false);
        $("#title-signup").toggleClass("hidden", true);
        $("#log_in").removeAttr("disabled");
        $("#log_in").toggleClass("active-button", true);
        $("#sign_up").prop("disabled", true);
        $(".reset_login").toggleClass("hidden", false);
        $("#title-login").toggleClass("hidden", true);
        $("#title-signup").toggleClass("hidden", true);
        $("#signup-fieldset-sns").toggleClass("hidden", true);
        $("#signup-fieldset").toggleClass("hidden", false);
        $("#signup-form-submit").toggleClass("hidden", false);
        $("#title-thumbnail").toggleClass("hidden", false);
        
        $scope.$apply();
    };


    //google oauth
    $scope.google_init = function(){
        gapi.load('auth2', function() {
        	$scope.auth2 = gapi.auth2.init({
                "ux_mode": "redirect"
            });
            $scope.attachSignin(document.getElementById('google_btn'));

            $scope.auth2.currentUser.listen(function(googleUser) {
            	var gProfile = {};
                if (googleUser && (gProfile = googleUser.getBasicProfile())) {
                    $scope.profile.email = gProfile.getEmail();
                    $scope.profile.name = gProfile.getName();
                    $scope.profile.img = gProfile.getImageUrl();
                    $scope.profile.sns = "google";
                    $scope.callbackSignupComponent($scope.profile);
                }
            });
        });
    };

    $scope.attachSignin = function(element){
    	$scope.auth2.attachClickHandler(element, {});
    };

    $scope.callbackSignupComponent = function(profile){
        $scope.showSignUpForm(profile);
    };
    
    function checkValidation(form){
    	var _flag = true;
    	if (form == "signup") {
    		$("#signup-fieldset .signup").each(function(){
    			var _val = $(this).val() || "";
    			if (_val == "") {
    				$(this).addClass('valid');
    				_flag = false;
    			}
    		});
    		
    	} else {
    		$("#login-fieldset .login").each(function(){
    			var _val = $(this).val() || "";
    			if (_val == "") {
    				$(this).addClass('valid');
    				_flag = false;
    			}
    		});
    	}
    	return _flag;
    }
    
    function checkPasswordValidation(){
    	var _flag = false;
    	if(($scope.profile.password != "" && $scope.profile.passwordcf != "") && $scope.profile.password !=  $scope.profile.passwordcf){
    		_flag = true;
    	} 
    	return _flag;
    }
});