 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class='chat_container' ng-controller='chatCtrl' ng-cloak='true' ng-init="init()">
   <div class='inbox'>
     <aside>
       <ul>
         <div ng-repeat='chat in chats'>
           <li ng-click='uid(chat.id)'>
             <img class='avatar' ng-src='{{chat.avatar}}'> 
             <p class='username'>{{chat.username}}</p>
           </li>
         </div>
       </ul>
     </aside>
     <main ng-controller='chatCtrl as chat'>
       <div class='init'>
         <span class="close"></span>
         <i class='fa fa-inbox'></i>
         <h4>Choose a conversation from the left</h4>
       </div>
       <div class='loader'>
         <p></p>
         <h4>Loading</h4>
       </div>
       <!-- Set A Ng Repeat For Our Messages || Check To See If Our Value (Which Is Set Via Ng Click) Is Equal To The Id Of The Message List We Want To Show -->
       <div class='message-wrap' ng-repeat='message in chats' ng-show='value == message.id'>
         <!-- Repeat Each Item In The Array Seperately -->
         <div class='message' ng-repeat='i in message.messages track by $index'>
           <p>{{i}}</p>
           <img ng-src='{{message.avatar}}'>
         </div>
       </div>
       <footer>
         <form ng-submit='add()'>
           <input ng-model='text' placeholder='Enter a message' type='text'>
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
	var index = 0;
	$scope.init = function(){
		var sock = new SockJS("/dev/echo.do");
		sock.onmessage = function(e){
			$("#chat").append(e.data + "<br/>");
		}
		
		sock.onclose = function(){
			$("#chat").append("연결 종료");
		}
		$scope.chats = [{
			  id: 0,
			  username: "Leela",
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
			  var vlu = $scope.value;
			  if($scope.text) {
			    $scope.chats[vlu].messages.push(this.text);
			    $scope.text = '';
			    console.log(vlu);
			  }
			}

			// Setting The Value Scope Equal To The Chat.id Which Is Retrieved Via Ng Click - We Pass The Chat.id Through The Function
			$scope.value;
			$scope.uid = function(ix) {
			  console.log(ix);

			  function ixy() {
			    $rootScope.value = ix;
			  }
			  // Delay Our Scope Change To Create A Smoother Transition
			  $timeout(ixy, 750);
			}
		$scope.setEvent();	
	};
	$scope.setEvent = function(){
		$("input[type='submit']").click(function() {
		  scroll();
		});

		$("aside").find("li").click(function() {
		  initScroll();
		  $(".init").animate({
		    'opacity': '0'
		  }, 500);
		});

		$("aside").find("li").click(function() {
		  if (index == 1) {
		    index = 0;
		    $(".message-wrap").find(".message").css({
		      'opacity': '1'
		    });
		  } else {
		    index = 0;
		    $(".message-wrap").find(".message").css({
		      'opacity': '0'
		    });
		    $(".loader").delay(500).animate({
		      'opacity': '1'
		    });
		    setTimeout(function() {
		      index = 0;
		      $(".message-wrap").find(".message").css({
		        'opacity': '1'
		      });
		      $(".loader").animate({
		        'opacity': '0'
		      });
		    }, 3000)
		  }
		});
		
		$('.close').click(function () {
			$(".chat_container").hide();
		});
		
		$("#chatForm").submit(function(event){
			event.preventDefault();
			sock.send($("#message").val());
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