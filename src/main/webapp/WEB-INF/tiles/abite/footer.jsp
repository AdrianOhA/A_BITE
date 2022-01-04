 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!-- ##### Footer Area Start ##### -->
 <%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

 
 <footer class="footer-area"  ng-controller="footerCtrl" ng-init="init()">
     <div class="container">
         <div class="row">
             <div class="col-12 col-sm-5">
                 <!-- Copywrite Text -->
                 <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
             </div>
	         <div class="footer_container">
			  <div class="cube shopping-cart"  id="followquick">
			    <div class="plus">
			      <div class="plus-horizontal"></div>
			      <div class="plus-vertical"></div>
			    </div>
			    <div class="quadrant">
			      <div class="quadrant__item" id="notice" >
			        <div class="quadrant__item__content">
						<svg height="30px" version="1.1" width="30px" height="30px" viewBox="0 0 28 28" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="arrow-left"><g id="🔍-Product-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="ic_fluent_alert_28_filled" fill="#ffffff" fill-rule="nonzero"><path d="M17.4656511,22.0023722 C17.2225412,23.6986589 15.7635335,25.0024884 14,25.0024884 C12.2364665,25.0024884 10.7774588,23.6986589 10.5343489,22.0023722 L17.4656511,22.0023722 Z M13.9999998,3 C18.6097416,3 22.362545,6.66898984 22.4974867,11.2460464 L22.4974867,11.501244 L22.5012438,11.501244 L22.501,15.613 L23.9150137,19.2573205 C23.9531988,19.3557443 23.9789872,19.4583221 23.9919367,19.5626921 L24.0016764,19.7202958 C24.0016764,20.3830375 23.4979968,20.9281385 22.852549,20.9936873 L22.7216764,21.0002958 L5.27478822,21.0002958 C5.11608079,21.0002958 4.95875738,20.9707807 4.81084204,20.913256 C4.19316669,20.67304 3.86769517,20.0060343 4.04055137,19.3807182 L4.08182805,19.2563496 L5.498,15.612 L5.49875581,11.501244 C5.49875581,6.80613658 9.3048924,3 13.9999998,3 Z" id="🎨-Color"></path></g></g></svg>
			        </div>
			      </div>
			      <div class="quadrant__item" id="chat" >
			        <div class="quadrant__item__content">
						<svg enable-background="new 0 0 58 58"height="26px" version="1.0" viewBox="0 0 58 58" width="26px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="arrow-up"><g><path fill="#fff" d="M53,3.293H5c-2.722,0-5,2.278-5,5v33c0,2.722,2.278,5,5,5h27.681l-4.439-5.161c-0.36-0.418-0.313-1.05,0.106-1.41c0.419-0.36,1.051-0.312,1.411,0.106l4.998,5.811L43,54.707v-8.414h2h6h2c2.722,0,5-2.278,5-5v-33C58,5.571,55.722,3.293,53,3.293z"/><path fill="#fff" d="M26,18.293H11c-0.553,0-1-0.448-1-1s0.447-1,1-1h15c0.553,0,1,0.448,1,1S26.553,18.293,26,18.293z"/><path style="fill:#000000;" d="M45,26.293H11c-0.553,0-1-0.448-1-1s0.447-1,1-1h34c0.553,0,1,0.448,1,1S45.553,26.293,45,26.293z"/><path style="fill:#000000;" d="M45,34.293H11c-0.553,0-1-0.448-1-1s0.447-1,1-1h34c0.553,0,1,0.448,1,1S45.553,34.293,45,34.293z"/></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
			        </div>
			      </div>
			      <div class="quadrant__item" id="write">
			        <div class="quadrant__item__content">
						<svg enable-background="new 0 0 24 24" height="30px"version="1.0" viewBox="0 0 24 24" width="30px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="arrow-right"><path d="M11 3H5C3.89543 3 3 3.89543 3 5V19C3 20.1046 3.89543 21 5 21H19C20.1046 21 21 20.1046 21 19V13" fill="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path fill="#7B6341" d="M9.5 11.5L17.5 3.5C18.3284 2.67157 19.6716 2.67157 20.5 3.5C21.3284 4.32843 21.3284 5.67157 20.5 6.5L12.5 14.5L8 16L9.5 11.5Z" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
			        </div>
			      </div>
			      <div class="quadrant__item"  id="settings">
			        <div class="quadrant__item__content">
						<svg baseProfile="tiny" height="30px" version="1.2" viewBox="0 0 489.802 489.802" width="30px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="arrow-down"><g><path fill="#fff"  d="M20.701,281.901l32.1,0.2c4.8,24.7,14.3,48.7,28.7,70.5l-22.8,22.6c-8.2,8.1-8.2,21.2-0.2,29.4l24.6,24.9c8.1,8.2,21.2,8.2,29.4,0.2l22.8-22.6c21.6,14.6,45.5,24.5,70.2,29.5l-0.2,32.1c-0.1,11.5,9.2,20.8,20.7,20.9l35,0.2c11.5,0.1,20.8-9.2,20.9-20.7l0.2-32.1c24.7-4.8,48.7-14.3,70.5-28.7l22.6,22.8c8.1,8.2,21.2,8.2,29.4,0.2l24.9-24.6c8.2-8.1,8.2-21.2,0.2-29.4l-22.6-22.8c14.6-21.6,24.5-45.5,29.5-70.2l32.1,0.2c11.5,0.1,20.8-9.2,20.9-20.7l0.2-35c0.1-11.5-9.2-20.8-20.7-20.9l-32.1-0.2c-4.8-24.7-14.3-48.7-28.7-70.5l22.8-22.6c8.2-8.1,8.2-21.2,0.2-29.4l-24.6-24.9c-8.1-8.2-21.2-8.2-29.4-0.2l-22.8,22.6c-21.6-14.6-45.5-24.5-70.2-29.5l0.2-32.1c0.1-11.5-9.2-20.8-20.7-20.9l-35-0.2c-11.5-0.1-20.8,9.2-20.9,20.7l-0.3,32.1c-24.8,4.8-48.8,14.3-70.5,28.7l-22.6-22.8c-8.1-8.2-21.2-8.2-29.4-0.2l-24.8,24.6c-8.2,8.1-8.2,21.2-0.2,29.4l22.6,22.8c-14.6,21.6-24.5,45.5-29.5,70.2l-32.1-0.2c-11.5-0.1-20.8,9.2-20.9,20.7l-0.2,35C-0.099,272.401,9.201,281.801,20.701,281.901z M179.301,178.601c36.6-36.2,95.5-35.9,131.7,0.7s35.9,95.5-0.7,131.7s-95.5,35.9-131.7-0.7S142.701,214.801,179.301,178.601z"/></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
         </div>
     </div>
</footer>

<script type="text/javascript" src='/js/TimelineLite.min.js'></script>
<script type="text/javascript" src='/js/TweenMax.min.js'></script>
<script type="text/javascript" src="/js/footer.js"></script>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller("footerCtrl", function($scope){
	$scope.init = function(){
		$scope.setEvent();
		// sock 이 오픈 되어있을 경우.
		/* 
		if (sock.readyState == 1) {
			 $scope.init_socket();
		} */
    };
    $scope.setEvent = function(){
    	$(window).scroll(function(){
    		var _scrollTop = $(this).scrollTop();
    		if(($("#scrollUp").css('display') === 'none') || _scrollTop == 0) {
    			$("#scrollUp").hide();
    			$("#followquick").css({"right": "50px"});
    		} else {
    			$("#followquick").css({"right": "100px"});
    		}
    	});
    	
    	$("#notice").click(function(){
    		console.log("notice click");
    	});
    	
    	$("#chat").click(function(){
    		if($(".chat_container").css('display') === 'none') {
    			$(".chat_container").show();
    			
	    	} else {
	    		$(".chat_container").hide();
	    	}
    	});

    	$("#write").click(function(){
    		document.location = "/web/post.do";
    	});

    	$("#settings").click(function(){
    		document.location = "/web/setting.do";
    	});
    };
});
</script>