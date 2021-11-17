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
         <h4 id="chat_result">Choose a conversation from the left</h4>
       </div>
       <div class='loader'>
         <p></p>
         <h4>Loading</h4>
       </div>
       <div class='message-wrap' ng-repeat='chat in chats' ng-show='checkID == chat.id'>
         <span>{{chat.recipeNo}}</span>
       	 <div ng-repeat='i in chat.messages'>
	         <div ng-class="i.writer != '<%= user_info.get("USER_ID") %>' ? 'message target': 'message' ">
	           <span style="display: none;" ng-model="message.target"></span>
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
  			  </span
  			  >
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
	$scope.checkID = null;
	$scope.chats = [];
	var _curr_id = "<%= user_info.get("USER_ID") %>";
	sock.onmessage = function(e){
		var _obj = JSON.parse(e.data);
		if(_obj.type == "read") {
			$scope.chats[_obj.id].messages.filter(function(obj){
				obj.readYN = "Y";
			});
		} else {
			$scope.chats[_obj.id].messages.push({"msg": _obj.msg, "time" : func_get_now_yyyymmddhhiiss(_obj.time), "writer": _obj.writer, "readYN" : "Y"});
			if($scope.checkID != _obj.id) {
				$scope.chats[_obj.id].not_read_cnt += 1;	
			} else {
				sock.send(JSON.stringify({type:"read", target: $scope.chats[_obj.id].target, recipeNo : $scope.chats[_obj.id].recipeNo , id : _obj.id} ));
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
	    $scope.chats[$scope.checkID].messages.push({"msg": this.text, "writer": _curr_id, "time" : func_get_now_yyyymmddhhiiss(), "readYN": "N"});
	    $scope.text = '';
	  } else {
		  $scope.text = '';
	  }
	};
	
	$scope.click_profile = function(ix) {
	  $scope.checkID = ix;
	  sock.send(JSON.stringify({type:"read", target: $scope.chats[$scope.checkID].target, recipeNo : $scope.chats[$scope.checkID].recipeNo , id : $scope.checkID} ));
	  $(".init").show();
	  $(".loader").show();
	  $(".init").css({ 'opacity': '0'});
	  $(".loader").delay(300).animate({'opacity': '1'});
	  $(".message-wrap").css({'opacity': '0'});
	  $scope.chats[$scope.checkID].not_read_cnt = 0;
	  $timeout(ixy, 1500);
    };
    
	$scope.setEvent = function(){
		$("input[type='submit']").click(function() {
			scroll();
		});
		$('.close').click(function () {
			$(".chat_container").hide();
		});
		$("#chatForm").submit(function(event){
			if ($scope.checkID != null){
				event.preventDefault();
				sock.send(JSON.stringify({type:"chat", target: $scope.chats[$scope.checkID].target, msg:$("#message").val() , recipeNo : $scope.chats[$scope.checkID].recipeNo , id : $scope.checkID} ));
				$("#message").val('').focus();	
			}
		});
	};
	
	$scope.search_chatList = function(){
		$.ajax({
            type: 'POST',
            url: '/dev/chatList.json',
            contentType: "application/json; charset=UTF-8",
            async: true,
            success: function(res) {
            	if (res.TARGET_LIST) {
            		res.TARGET_LIST.forEach(function(obj, idx){
            			var _recipeNo = obj.split('_')[1];
            			var _target = obj.split('_')[0];
            			var _msgList = res.CHAT_LIST[idx];
            			$scope.set_chat_list(_target, _recipeNo, _msgList, idx);
	            	});
            	}
            },
        });	
	}
	
	$scope.getMember = function(id){
		var _user_info = {};
		$.ajax({
            type: 'POST',
            url: '/Auth/getMember.json',
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({"email" : id}),
            async: false,
            success: function(res) {
            	_user_info = res.userInfo;
            },
        });	
		return _user_info;
	};
	
	$scope.setTime = function(_msg){
		for(var i = 0; i < _msg.length; i++) {
			var _obj = _msg[i];
			_obj.time = func_get_now_yyyymmddhhiiss(_obj.time);
		}
	}
	
	$scope.set_chat_list = function(_target, _recipeNo, _msgList, __idx){
		_msgList = _msgList.sort(function(a, b) {
			return a.time < b.time ? -1 : a.time > b.time ? 1 : 0;
		});
		$scope.setTime(_msgList);
		
		var not_reads = _msgList.filter(function(obj){
			return obj.readYN == 'N' && obj.writer != _curr_id;
		});
		
		var _obj = {
			id : __idx,
			target: _target,
			recipeNo : _recipeNo,
			messages : _msgList,
			not_read_cnt: not_reads.length 
		}
		
		var user_info = $scope.getMember(_target);
		_obj.username = user_info.USER_NAME;
		_obj.avatar = user_info.USER_IMAGE;
		$scope.chats.push(_obj);
		$scope.$apply();	
	}
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
 });
 </script>