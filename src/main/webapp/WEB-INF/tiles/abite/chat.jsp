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
             <span ng-show='chat.not_read_cnt > 0' class="circle">{{chat.not_read_cnt > 99 ? '99+' : chat.not_read_cnt}}</span>
           </li>
         </div>
       </ul>
     </aside>
     <main>
       <span class="close"></span>
       <div class='init'>
         <i class='fa fa-inbox'></i>
         <h4 id="chat_result">채팅방을 선택해주세요.</h4>
       </div>
       <div class='loader'>
         <p></p>
         <h4>Loading</h4>
       </div>
       <div class='message-wrap' ng-repeat='chat in chats' ng-show='checkID == chat.id'>
         <div style="line-height: 1.2em;display: block;width: 100%;height: 30px !important;position: fixed;color: #fff;font-size: 11px;border-top: 1px solid rgba(255, 255, 255, 0.1);text-align: left;background: #9a9a9a;z-index:999;">
         	{{chat.title}}
         	<div>가격: {{chat.sellPay}}원/남은 수량: {{chat.sellCnt}}</div>
         </div>
       	 <div ng-repeat='i in chat.messages'>
	         <div ng-class="i.writer != '<%= user_info.get("USER_ID") %>' ? 'message target': 'message' ">
	           <span style="display: none;" ng-model="message.target"></span>
	           <img class='avatar' ng-src={{i.target_img}} ng-show="i.writer != '<%= user_info.get("USER_ID") %>'"/>
	           <span ng-show="i.writer != '<%= user_info.get("USER_ID") %>'" style="font-size: 0.5rem;color: #a2feff;">{{i.targetname}}</span>
	           <p>{{i.msg}}</p><span style="color:#fff;float: right;margin-right: -10px;font-size: 11px;">{{i.time}}</span>
	         </div>
	         <span ng-class="i.writer != '<%= user_info.get("USER_ID") %>' ? 't-checked': 'checked' ">
		           <svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="15px" viewBox="0 0 24 24" width="15px" fill="#3DB7CC" ng-show="i.readYN == 'N'">
						<g><rect fill="none" height="24" width="24"/></g>
						<g><path d="M12,2C6.47,2,2,6.47,2,12c0,5.53,4.47,10,10,10s10-4.47,10-10C22,6.47,17.53,2,12,2z M12,20c-4.42,0-8-3.58-8-8 c0-4.42,3.58-8,8-8s8,3.58,8,8C20,16.42,16.42,20,12,20z"/></g>
	  			   </svg>
		           <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 0 24 24" width="15px" fill="#3DB7CC"  ng-show="i.readYN == 'Y'">
						<path d="M0 0h24v24H0V0z" fill="none"/>
					    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm4.59-12.42L10 14.17l-2.59-2.58L6 13l4 4 8-8z"/>
	  			   </svg>
  			  </span>
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
<div id="notifications" style="position: fixed;width: 15%;z-index: 999;right: 0;bottom: -15px;display: none;">
	<div class="alert alert-warning alert-with-icon" data-notify="container">
		<div class="container">
    		<div class="alert-wrapper">
	      		<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="top: 8px;" id="noti_close"></button>
        		<div class="message"><i class="nc-icon nc-bell-55"></i> 메세지 왔어요~ <span id="total_notread"></span></div>
    	    </div>
        </div>
    </div>
</div>
<!-- <iframe src="/css/silence.mp3" allow="autoplay" id="audio" style="display: none" muted="muted"></iframe> -->
<audio id='audio_play' src='/css/alerting.mp3'></audio>
<script> 
 "use strict";
 var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
 mainApp.controller("chatCtrl", function($scope, delivery, $timeout){
	$scope.checkID = null;
	$scope.chats = [];
	$scope.total_notread = 0;
	var _curr_id = "<%= user_info.get("USER_ID") %>";
	sock.onmessage = function(e){
		var _obj = JSON.parse(e.data);
		var idx = $scope.findIdx( _obj.id);
		
		if(_obj.type == "read") {
			if (idx != null ){
				$scope.chats[idx].messages.filter(function(obj){ obj.readYN = "Y";});	
			}
		} else {
			var target_img = "";
			if($scope.chats[idx].messages != null && $scope.chats[idx].messages.length > 0){
				for(var i = 0; i < $scope.chats[idx].messages.length; i++) {
					var msg = $scope.chats[idx].messages[i]
					if (msg.target_img) {
						target_img = msg.target_img;
						break;
					}
				}
			} else {
				var target = $scope.searchTarget(_obj.writer);
				target_img = target.USER_IMAGE;
			}
			
			$scope.chats[idx].messages.push({"msg": _obj.msg, "time" : func_get_now_yyyymmddhhiiss(_obj.time), "writer": _obj.writer, "readYN" : "Y", "target_img": target_img});		
			if($scope.checkID != _obj.id) {
				$scope.chats[idx].not_read_cnt += 1;
				$scope.total_notread = 0;
				for(var i=0; i < $scope.chats.length; i++) {
					$scope.total_notread += $scope.chats[i].not_read_cnt;	
				}
				$("#total_notread").text($scope.total_notread);
				$("#notifications").show();
				play();
			} else {
				sock.send(JSON.stringify({type:"read", target: $scope.chats[idx].target, recipeNo: $scope.chats[idx].recipeNo, id: _obj.recipeNo} ));
			}
			scroll();	
		}
		$scope.$apply();
	};
	sock.onclose = function(){
		/* $("#chat_result").append("연결 종료"); */
	};
	
	$scope.init = function(){
		$scope.setEvent();
		$scope.search_chatList();
		$scope.text;
		
	};
	$scope.add = function() {
	  if($scope.text && $scope.checkID != null) {
		var idx = $scope.findIdx($scope.checkID );
		$scope.chats[idx].messages.push({"msg": this.text, "writer": _curr_id, "time" : func_get_now_yyyymmddhhiiss(), "readYN": "N"});
		$scope.text = '';
	  } else {
		  $scope.text = '';
	  }
	};
	$scope.$watch(
		function () { 
			return delivery.getParams();
		},
		function (params) {
			if(params && params.target != _curr_id) {
				var flag = true;
				for(var i = 0 ; i < $scope.chats.length; i++) {
					if(params.recipeNo == $scope.chats[i].recipeNo){
						flag = false;
					}
				}
				if(flag == true){
					$('.shopping-cart').effect("shake", {times: 2 }, 200);
					params.id = params.recipeNo;
					var _recipe = $scope.getRecipe(params.recipeNo);
					params.avatar = _recipe.THUMBNAIL;
					params.username = _recipe.TITLE;
					$scope.chats.push(params);
				}
			}
		}
	);

	$scope.click_profile = function(ix) {
	  $scope.checkID = ix;
	  var _recipeNo = ix;
	  var idx = $scope.findIdx($scope.checkID );
	  var _target = $scope.chats[idx].target;
	  sock.send(JSON.stringify({type:"read", target: _target, recipeNo : _recipeNo , id : $scope.checkID} ));
	  $("#notifications").hide();
	  $(".init").show();
	  $(".loader").show();
	  $(".init").css({ 'opacity': '0'});
	  $(".loader").delay(300).animate({'opacity': '1'});
	  $(".message-wrap").css({'opacity': '0'});
	  $scope.chats[idx].not_read_cnt = 0;
	  $scope.total_notread -= $scope.chats[idx].not_read_cnt;
	  $timeout(ixy, 1500);
    };
    
	$scope.setEvent = function(){
		$("input[type='submit']").click(function() {
			scroll();
		});
		$('.close').click(function () {
			$scope.checkID = null;
  		    $(".init").css({ 'opacity': '1'});
  		    $(".init").show();
		    $(".loader").css({'opacity': '0'});
		    $(".message-wrap").css({'opacity': '0'});
		    $(".chat_container").hide();
		});
		$("#chatForm").submit(function(event){
			if ($scope.checkID != null && $("#message").val() != ''){
				event.preventDefault();
				var idx = $scope.findIdx($scope.checkID);
				sock.send(JSON.stringify({type:"chat", target: $scope.chats[idx].target, msg:$("#message").val(), recipeNo: $scope.chats[idx].recipeNo, id: $scope.chats[idx].recipeNo} ));
				$("#message").val('').focus();	
			}
		});
		
		$("#noti_close").click(function(){
			$("#notifications").hide();
		});
		
		$("#notifications").click(function(){
			if($(".chat_container").css('display') === 'none') {
    			$(".chat_container").show();
    			
	    	} else {
	    		$(".chat_container").hide();
	    	}
		});
	};
	
	$scope.search_chatList = function(){
		$.ajax({
            type: 'POST',
            url: '/dev/chatList.json',
            contentType: "application/json; charset=UTF-8",
            async: false,
            success: function(res) {
            	if (res.msgList) {
            		res.msgList.forEach(function(obj, idx){
            			var _recipeNo = obj.target.split("_")[1];
            			var _target = obj.target.split('_')[0];
            			
            			var _msgList = obj.chatList;
            			$scope.set_chat_list(_target, _recipeNo, _msgList);
            			if($scope.total_notread > 0) {
            				$("#total_notread").text($scope.total_notread);
            				$("#notifications").show();	
            				play();
            			}
            			return $scope.chats;
	            	});
            	}
            },
        });	
	}

	$scope.getRecipe = function(recipeNo){
		var _recipe_info = {};
		$.ajax({
            type: 'POST',
            url: '/web/getRecipe.json',
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({"recipeNo" : recipeNo}),
            async: false,
            success: function(res) {
            	_recipe_info = res.RECIPE;
            },
        });	
		return _recipe_info;
	}
	
	$scope.setTime = function(_msg){
		for(var i = 0; i < _msg.length; i++) {
			var _obj = _msg[i];
			_obj.time = func_get_now_yyyymmddhhiiss(_obj.time);
		}
	}
	
	$scope.findIdx = function(checkID){
		var idx = null;
		for(var i = 0; i < $scope.chats.length; i++) {
			if ($scope.chats[i].id == checkID) {
				idx = i;
			}
		}
		return idx;
	}
	
	$scope.set_chat_list = function(_target, _recipeNo, _msgList){
		_msgList = _msgList.sort(function(a, b) {
			return a.time < b.time ? -1 : a.time > b.time ? 1 : 0;
		});
		$scope.setTime(_msgList);
		
		var not_reads = _msgList.filter(function(obj){
			return obj.readYN == 'N' && obj.writer != _curr_id;
		});
		
		var _targetInfo= $scope.searchTarget(_target);
		
		_msgList.filter(function(msg){
			if(msg.writer != _curr_id) {
				msg.target_img = _targetInfo.USER_IMAGE; 
			}
			msg.targetname = _targetInfo.USER_NAME;
		});
		
		var recipe_info = $scope.getRecipe(_recipeNo);
		
		var _obj = {
			id : _recipeNo,
			target: _target,
			recipeNo : _recipeNo,
			messages : _msgList,
			not_read_cnt: not_reads.length 
		}
		
		if(recipe_info) {
			_obj.username = recipe_info.TITLE;
			_obj.avatar = recipe_info.THUMBNAIL;	
			_obj.sellPay = recipe_info.SELL_PAY;
			_obj.sellCnt = recipe_info.SELL_CNT;
			_obj.title = recipe_info.TITLE;
		}
		$scope.chats.push(_obj);
		
		$scope.total_notread = 0;
		for(var i=0; i < $scope.chats.length; i++) {
			$scope.total_notread += $scope.chats[i].not_read_cnt;	
		}	
	}
	

	$scope.searchTarget = function(target) {
		var _targetInfo = {}; 
		$.ajax({
	       type: 'POST',
	       url: '/Auth/getMember.json',
	       data: JSON.stringify({"email" : target}),
	       async: false,
	       contentType: "application/json; charset=UTF-8",
	       success: function(res) {
	    	   _targetInfo = res.userInfo;
		   }
	    });	
		return _targetInfo;
	};
	
	function ixy() {
	    $(".message-wrap").css({
		  'opacity': '1'
	    });
		$(".message-wrap").find(".message").css({
	  	   'opacity': '1'
	    });
		$(".init").hide();
		$(".loader").hide();
		scroll();
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
	
	function func_get_now_yyyymmddhhiiss(time){
		if(!time) {
			time = (new Date()).getTime();
		}
		var date = new Date(time);
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		var hour = date.getHours(); 
		var minute = date.getMinutes(); 
		var second = date.getSeconds(); 
		if(month.length == 1){
		  month = "0" + month;
		}
		if(day.length == 1){
		  day = "0" + day;
		}
		if(hour.length == 1){
			hour = "0" + hour;
		}
		if(minute.length == 1){
			minute = "0" + minute;
		}
		if(second.length == 1){
			second = "0" + second;
		}
		return year+"/"+month+"/"+day+"/"+hour+":"+minute+":"+second;
	}
	
	function play() { 
	    var audio = document.getElementById('audio_play'); 
	    if (audio.paused) { 
	        audio.play(); 
	    }else{ 
	        audio.pause(); 
	        audio.currentTime = 0 
	    } 
	} 
 });
 </script>