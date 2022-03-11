"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller("mainCtrl", function($scope) {
    $scope.init = function(msg) {
    	$scope.loginForm = {
    		email : "",
    		password: ""
    	};
    	$scope.addressList = [];
    	
        $scope.profile = {
           img: "/images/icon_user.png",
           name: "",
           email: "",
           sns: "",
           token: "",
           password: "",
           passwordcf: "",
           address: "",
           lat: 0,
           lng: 0
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
        		 $scope.loginForm = {
        			email : "",
        		    password: ""
        		 };
        		 
        		 $("#title-thumbnail").toggleClass("hidden", true);
                 $(".reset_login").toggleClass("hidden", true);
                 $("#title-login").toggleClass("hidden", true);
                 $("#title-signup").toggleClass("hidden", false);
                 $("#title_logo").toggleClass("hidden", false);
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
        	checkEmail(_id);
        });
        
        $(".login").focusout(function(){
        	$("#login_msg").hide();
        });
        
        $("#log_in").click(function() {
        	// when click Log In button, hide the Sign Up elements, and display the Log In elements
        	$scope.profile = {
        		img: "/images/icon_user.png",
        	    name: "",
        	    email: "",
        	    sns: "DEFAULT",
        	    token: "",
        	    password: "",
        	    passwordcf: "",
        	    address: "",
        	    lat: 0,
        	    lng: 0
        	};
        	$("#title-thumbnail").toggleClass("hidden", true);
            $(".reset_login").toggleClass("hidden", true);
            $("#signup-fieldset-sns").toggleClass("hidden", true);
            $("#signup-fieldset").toggleClass("hidden", true);
            $("#title-login").toggleClass("hidden", false);
            $("#title-signup").toggleClass("hidden", true);
            $("#title_logo").toggleClass("hidden", false);
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
        	$scope.signup();
        });

        $("#login-form-submit").click(function() {
        	$scope.login(true);
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
            		$scope.auth2.disconnect();
            		location.reload();
            	});
            } else {
            	$("#sign_up").click();
            }
        });
        $("#title-thumbnail").change(function() {
        	readURL(this);
        });
        
        $(document).keypress(function(e){
        	if($scope.profile.address != "" && e.keyCode == 13) {
        		if($("#sign_up").attr('disabled') == "disabled") {
        			if($("#signup-fieldset-sns").is(":visible") == false) {
        				$scope.signup();
        			}
        		} else {
        			if($("#login-fieldset").is(":visible") == true) {
        				$scope.login(true);
        			}
        		}
        	}
        });
    };
	$scope.search_address = function(event){
		if(event.keyCode == 13) {
		   $scope.addressList = [];
		   var _address = $scope.address || "";
	       if (_address != null && _address != "") {
	    	   $("#loadding_mask").show();
	    	   
			   $.ajax({
	   			type : 'POST',
	   			url : '/web/searchAddress.json',
	   			contentType : "application/json; charset=UTF-8",
	   			async: false,
	   			data : JSON.stringify({address: _address}),
	   			success : function(res) {
	   				setInterval(() => {
	   					$("#loadding_mask").hide();	
					}, 1);
	   				if(res.response && res.response.result) {
		   				$scope.addressList = setAddress(res.response.result.items);
	   				}
	   			},
	   		});
	      }   
	   }	
	}
	$scope.search_address2 = function(event){
		   $scope.addressList = [];
		   var _address = $scope.address || "";
	       if (_address != null && _address != "") {
	    	   $("#loadding_mask").show();
	    	   $.ajax({
	   			type : 'POST',
	   			url : '/web/searchAddress.json',
	   			contentType : "application/json; charset=UTF-8",
	   			async: false,
	   			data : JSON.stringify({address: _address}),
	   			success : function(res) {
	   				setInterval(() => {
	   					$("#loadding_mask").hide();	
					}, 1);
	   				if(res.response && res.response.result) {
		   				$scope.addressList = setAddress(res.response.result.items);
	   				}
	   			},
	   		});
	      } 
	}
	
    $scope.saveFileAndSignup = function(flag) {
    	$scope.profile.flag = flag;
    	if(flag) {
        	$.ajax({
                type: 'POST',
                url: '/File/fileUpload.json',
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify($scope.getfile()),
                async: false,
                success: function(res) {
                	$scope.profile.img = "/images/" + res.fileName;
                	$scope.profile.sns = "DEFAULT";
                	$.ajax({
                        type: 'POST',
                        url: '/Auth/signup.json',
                        contentType: "application/json; charset=UTF-8",
                        data: JSON.stringify($scope.profile),
                        async: false,
                        success: function(res) {
                        	if (res.COUNT == 1) {
                        		$scope.loginForm.email = $scope.profile.email;
                        		$scope.profile = {
                    	        		img: "/images/icon_user.png",
                    	        	    name: "",
                    	        	    email: "",
                    	        	    sns: "DEFAULT",
                    	        	    token: "",
                    	        	    password: "",
                    	        	    passwordcf: "",
                    	        	    address: "",
                    	        	    lat: 0,
                    	        	    lng: 0
                    	        };
                    			$("#log_in").click();	
                        	} else {
                        		if(res.RESULT_CODE == "E") {
                        			if(res.RESULT_MSG == "No Same Password") {
                        				$("input[name=password_confirm]").css('margin-bottom', '10px');
                        				$("#checkpwd").show();
                            			return;
                        			} else {
                        				checkEmail($scope.profile.email);
                        			}
                        		}
                        	}
                        },
                    });
                },
            });
    	} else{
    		console.log($scope.profile);
    		$.ajax({
                type: 'POST',
                url: '/Auth/signup.json',
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify($scope.profile),
                async: false,
                success: function(res) {
                	if (res.COUNT == 1) {
                		$("#reset_login").click();
                		location.href = res.REDIRECT_URL || "";
                	} else {
                		if(res.RESULT_CODE == "E") {
                			if(res.RESULT_MSG == "No Same Password") {
                				$("input[name=password_confirm]").css('margin-bottom', '10px');
                				$("#checkpwd").show();
                    			return;
                			} else {
                				checkEmail($scope.profile.email);
                			}
                		}
                	}
                },
            });
    	}
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
                		$("#imagePreview").css("background-image", 'url('+customer.kakao_account.profile.thumbnail_image_url+')');
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
        $("#title_logo").toggleClass("hidden", true);
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
        checkEmail($scope.profile.email);
    };
    $scope.selected_address = function(address, lat, lng) {
    	$("#address").removeClass('valid');
		$scope.profile.address = address;
		$scope.address = address; 
		$scope.profile.lat = lat;
		$scope.profile.lng = lng;
		$scope.addressList = [];
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
                    $("#imagePreview").css("background-image", 'url('+gProfile.getImageUrl()+')');
                    $scope.profile.sns = "google";
                    /*$scope.callbackSignupComponent($scope.profile);*/
                    $scope.signup(false);
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

    $scope.showPreview = function(event){
	  if(event.target.files.length > 0){
	    var src = URL.createObjectURL(event.target.files[0]);
	    var preview = document.getElementById("file-ip-1-preview");
	    preview.src = src;
	    preview.style.display = "block";
	  }
    }

    $scope.getfile = function(){
    	var images = $("#imagePreview").css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
    	
    	var ext = images.match(/^(data:image\/)(png|jpg|jpeg)/g)[0];
    	ext = ext.split("/")[1];
    	
    	var obj = {
    		encodedImg : images,
    		ext: ext,
    		target : "profile"
    	}
    	
    	return obj;
    }
    

    $scope.login2 = function(e, flag){
    	if(e.keyCode == 13) {
    	$scope.loginForm.flag = flag;
    	
    	if(checkValidation("login") || !flag){
   		 $.ajax({
                type: 'POST',
                url: '/Auth/login.json',
                data: JSON.stringify($scope.loginForm),
                contentType: "application/json; charset=UTF-8",
                async: true,
                success: function(res) {
                	if(res.RESULT_CODE == "E") {
                		$("#login_msg").text(res.RESULT_MSG);
                		$("#login_msg").show();
                	} else {
                		location.href = res.REDIRECT_URL || "";
                	}
                },
            });
   	   	 }
    	}
    }
    
    
    $scope.login = function(flag){
    	$scope.loginForm.flag = flag;
    	if(checkValidation("login") || !flag){
   		 $.ajax({
                type: 'POST',
                url: '/Auth/login.json',
                data: JSON.stringify($scope.loginForm),
                contentType: "application/json; charset=UTF-8",
                async: true,
                success: function(res) {
                	if(res.RESULT_CODE == "E") {
                		$("#login_msg").text(res.RESULT_MSG);
                		$("#login_msg").show();
                	} else {
                		location.href = res.REDIRECT_URL || "";
                	}
                },
            });
   	   }
    }
    
    $scope.signup = function(flag){
    	if($("#checkid").is(':visible') && "이미 등록된 email 입니다." == $("#checkid").text()) {
    		$("#signup_email").addClass('valid');
    		return;
    	}
    	if(flag) {
    		$scope.profile.sns = "DEFAULT"
    	}
    	if($scope.profile.sns == "DEFAULT") {
    		if(checkValidation("signup")){
        		if(checkPasswordValidation()){
        			$("input[name=password_confirm]").css('margin-bottom', '10px');
        			$("#checkpwd").show();
        			return;
        		}
        		$("input[name=password_confirm]").css('margin-bottom', '30px');
        		$("#checkpwd").hide();
        		$scope.saveFileAndSignup(flag);
        	}	
    	} else{
    		$scope.saveFileAndSignup(flag);
    	}
    }

	function setAddress(list) {
		var retList = [];
		for(var i = 0; i < list.length; i++) {
			var _item = list[i];
			var _obj = {
			  address : _item.address.road,
			  lat :  _item.point.x,
			  lng : _item.point.y 
			};
			
			retList.push(_obj);
		}
		return retList;
	}

    function checkValidation(form){
    	var _flag = true;
    	if (form == "signup") {
    		$("#signup-fieldset .signup").each(function(){
    			var _val = $(this).val() || "";
    			if (_val == "") {
    				if(_val2 == true) {
    				   $(".avatar-preview").addClass('valid');
    				} else {
    					$(this).addClass('valid');	
    				}
    				_flag = false;
    			}
    		});
    		var _val2 = $(".checkImgup").css('background-image').indexOf('/images/icon-user.png') > 0;
    		if(_val2 == true) {
				$(".avatar-preview").addClass('valid');
				_flag = false;
			} 
    		if($scope.profile.lng == 0 && $scope.profile.lat == 0) {
    			$("#address").addClass('valid');
    			_flag = false;
    		} else {
    			$("#address").removeClass('valid');
    		}
    	} else {
    		$("#login-fieldset .login").each(function(){
    			$(this).removeClass('valid');
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
    
    function checkEmail(_id){
    	if(_id) {
    		var regExp = /^[0-9a-zA-Z]([-.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장
        	if (_id.match(regExp) == null) {
        		$("#signup_email").css('margin-bottom', '10px');
        		$("#checkid").css('color', 'red');
        		$("#checkid").text("email 형식이 맞지 않아요!");
        		$("#checkid").show();
        		return;
        	}
        	
        	$.ajax({
                type: 'POST',
                url: '/Auth/isExistsForMember.json',
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify({email: _id}),
                async: true,
                success: function(res) {
                	if(res.COUNT == 0) {
                		$("#signup_email").css('margin-bottom', '10px');
                		$("#checkid").css('color', 'black');
                		$("#signup_email").removeClass('valid');
                		$("#checkid").text("사용 가능합니다.");
                		$("#checkid").show();
                	} else {
                		$("#signup_email").css('margin-bottom', '10px');
                		$("#checkid").css('color', 'red');
                		$("#checkid").text("이미 등록된 email 입니다.");
                		$("#checkid").show();
                	}
                },
            });	
    	}
    }
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#imagePreview').css('background-image', 'url('+e.target.result +')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(100);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
});