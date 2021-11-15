 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

<div class='chat_container' ng-controller='chatCtrl' ng-init="init()">
   <div class='inbox'>
     <aside>
       <ul>
         <div ng-repeat='chat in chats'>
           <li ng-click='click_profile(chat.id)'>
             <img class='avatar' ng-src='{{chat.avatar}}'> 
             <p class='username'>{{chat.username}}</p>
           </li>
         </div>
       </ul>
     </aside>
     <main>
       <span class="close"></span>
       <div class='init'>
         <i class='fa fa-inbox'></i>
         <h4 id="chat_result">Choose a conversation from the left</h4>
       </div>
       <div class='loader'>
         <p></p>
         <h4>Loading</h4>
       </div>
       <!-- Set A Ng Repeat For Our Messages || Check To See If Our Value (Which Is Set Via Ng Click) Is Equal To The Id Of The Message List We Want To Show -->
       <div class='message-wrap' ng-repeat='message in chats' ng-show='checkID == message.id'>
         <!-- Repeat Each Item In The Array Seperately -->
         <div class='message' ng-repeat='i in message.messages track by $index'>
           <p>{{i}}</p>
           <img ng-src='{{message.avatar}}'>
         </div>
       </div>
       <footer>
         <form ng-submit='add()' id="chatForm">
           <input ng-model='text' placeholder='Enter a message' type='text' id="message">
           <input type='submit' value='Send'>
         </form>
       </footer>
     </main>
   </div>
 </div>
 <script>
 "use strict";
 var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
 mainApp.controller("chatCtrl", function($scope, $timeout){
	var sock = new SockJS("/dev/echo.do");
	$scope.checkID = null;
	sock.onmessage = function(e){
		alert(e.data );
		$("#chat_result").append(e.data + "<br/>");
	}
	sock.onclose = function(){
		$("#chat_result").append("연결 종료");
	}
	$scope.init = function(){
		// Setting The Value Scope Equal To The Chat.id Which Is Retrieved Via Ng Click - We Pass The Chat.id Through The Function
		$scope.setEvent();
		$scope.chats = [{
			  id: 0,
			  username: "크라운",
			  avatar: "https://imgflip.com/s/meme/Futurama-Leela.jpg",
			  messages: [
			    "I can explain. It's very valuable. You won't have time for sleeping, soldier, not with all the bed making you'll be doing",
			    "Who am I making this out to? We'll go deliver this crate like professionals, and then we'll go home",
			    "No! The cat shelter's on to me. I never loved you",
			    "Oh Leela! You're the only person I could turn to",
			    "Um, is this the boring, peaceful kind of taking to the streets",
			    "That's right, baby. I ain't your loverboy Flexo, the guy you love so much. You even love anyone pretending to be him!"
			  ]
			}, {
			  id: 1,
			  username: "Bender",
			  avatar: "http://orig02.deviantart.net/9689/f/2012/027/9/c/mr_bender______classy__by_sgtconker1r-d4nqpzu.png",
			  messages: [
			    "Stop! Don't shoot fire stick in space canoe! Cause explosive decompression!",
			    "Fry! Stay back! He's too powerful! You guys aren't Santa!",
			    "Hi, I'm a naughty nurse, and I really need someone to talk to. $9.95 a minute",
			    "Who are you, my warranty?!",
			    "I will destroy you"
			  ]
			}, {
			  id: 2,
			  username: "Fry",
			  avatar: "http://www.wallpaperno.com/thumbnails/detail/20121027/futurama%20fry%201920x1080%20wallpaper_www.wallpaperno.com_68.jpg",
			  messages: [
			    "Ooh, name it after me! But I've never been to the moon!",
			    "You don't know how to do any of those",
			    "The key to victory is discipline, and that means a well made bed",
			    "Stop bickering or I'm going to come back there and change your opinions manually",
			    "Can we have Bender Burgers again"
			  ]
			}, {
			  id: 3,
			  username: 'Zoidberg',
			  avatar: "http://images2.fanpop.com/images/photos/3300000/Zoidberg-futurama-3305418-1024-768.jpg",
			  messages: [
			    "All I want is to be a monkey of moderate intelligence who wears a suit",
			    "Oh, I don't have time for this",
			    "No! The kind with looting and maybe starting a few fires!",
			    "Now, now. Perfectly symmetrical violence never solved anything",
			    "Dissect its brain"
			  ]
		}];

		// Assign Pushed Messages To A User
		$scope.text;
		$scope.add = function() {
		  var vlu = $scope.checkID;
		  if($scope.text) {
		    $scope.chats[vlu].messages.push(this.text);
		    $scope.text = '';
		    console.log(vlu);
		  }
		}

		$scope.click_profile = function(ix) {
		  $scope.checkID = ix;
		  $(".init").show();
		  $(".loader").show();
		  $(".init").css({
			 'opacity': '0'
		  });
		  $(".loader").delay(300).animate({
			'opacity': '1'
		  });
		  $(".message-wrap").css({
			  'opacity': '0'
		  });
		  function ixy() {
		    $(".message-wrap").css({
			  'opacity': '1'
		    });
			$(".message-wrap").find(".message").css({
		  	   'opacity': '1'
		    });
			$(".init").hide();
			$(".loader").hide();
			$scope.$apply();
		  }
		  $timeout(ixy, 1500);
		  
		  var msg = {
			type: "register",
			userid : "<%= user_info.get("USER_ID") %>"
		  }
		  
		  sock.send(JSON.stringify(msg));
	    };
	};
	$scope.setEvent = function(){
		$("input[type='submit']").click(function() {
			scroll();
		});
		$('.close').click(function () {
			$(".chat_container").hide();
		});
		$("#chatForm").submit(function(event){
			event.preventDefault();
			sock.send(JSON.stringify({type:"chat", target: "osm0771@gmail.com", msg:$("#message").val() } ));
			$("#message").val('').focus();
		});
	};
	function initScroll() {
	  $(".message-wrap").animate({ 
	    scrollTop: $("main").height() 
	  }, 1000);
	}

	function scroll() {
	  $(".message-wrap").animate({
	    scrollTop: 9000
	  }, 1000);
	}
 });
 </script>