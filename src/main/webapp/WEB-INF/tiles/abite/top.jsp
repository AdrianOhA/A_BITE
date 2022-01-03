<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

<div class="treading-post-area" id="treadingPost">
		<div class="close-icon">
			<i class="fa fa-times"></i>
		</div>

		<h4>Treading Post</h4>

		<!-- Single Blog Post -->
		<div class="single-blog-post style-1 d-flex flex-wrap mb-30">
			<!-- Blog Thumbnail -->
			<div class="blog-thumbnail">
				<img src="/images/9.jpg" alt="" />
			</div>
			<!-- Blog Content -->
			<div class="blog-content">
				<a href="#" class="post-tag">The Best</a> <a href="#"
					class="post-title">Friend eggs with ham</a>
				<div class="post-meta">
					<a href="#" class="post-date">July 11, 2018</a> <a href="#"
						class="post-author">By Julia Stiles</a>
				</div>
			</div>
		</div>

		<!-- Single Blog Post -->
		<div class="single-blog-post style-1 d-flex flex-wrap mb-30">
			<!-- Blog Thumbnail -->
			<div class="blog-thumbnail">
				<img src="/images/10.jpg" alt="" />
			</div>
			<!-- Blog Content -->
			<div class="blog-content">
				<a href="#" class="post-tag">The Best</a> <a href="#"
					class="post-title">Mushrooms with pork chop</a>
				<div class="post-meta">
					<a href="#" class="post-date">July 11, 2018</a> <a href="#"
						class="post-author">By Julia Stiles</a>
				</div>
			</div>
		</div>

		<!-- Single Blog Post -->
		<div class="single-blog-post style-1 d-flex flex-wrap mb-30">
			<!-- Blog Thumbnail -->
			<div class="blog-thumbnail">
				<img src="/images/11.jpg" alt="" />
			</div>
			<!-- Blog Content -->
			<div class="blog-content">
				<a href="#" class="post-tag">The Best</a> <a href="#"
					class="post-title">Birthday cake with chocolate</a>
				<div class="post-meta">
					<a href="#" class="post-date">July 11, 2018</a> <a href="#"
						class="post-author">By Julia Stiles</a>
				</div>
			</div>
		</div>

		<!-- Single Blog Post -->
		<div class="single-blog-post style-1 d-flex flex-wrap mb-30">
			<!-- Blog Thumbnail -->
			<div class="blog-thumbnail">
				<img src="/images/9.jpg" alt="" />
			</div>
			<!-- Blog Content -->
			<div class="blog-content">
				<a href="#" class="post-tag">The Best</a> <a href="#"
					class="post-title">Friend eggs with ham</a>
				<div class="post-meta">
					<a href="#" class="post-date">July 11, 2018</a> <a href="#"
						class="post-author">By Julia Stiles</a>
				</div>
			</div>
		</div>

		<!-- Single Blog Post -->
		<div class="single-blog-post style-1 d-flex flex-wrap mb-30">
			<!-- Blog Thumbnail -->
			<div class="blog-thumbnail">
				<img src="/images/10.jpg" alt="" />
			</div>
			<!-- Blog Content -->
			<div class="blog-content">
				<a href="#" class="post-tag">The Best</a> <a href="#"
					class="post-title">Mushrooms with pork chop</a>
				<div class="post-meta">
					<a href="#" class="post-date">July 11, 2018</a> <a href="#"
						class="post-author">By Julia Stiles</a>
				</div>
			</div>
		</div>

		<!-- Single Blog Post -->
		<div class="single-blog-post style-1 d-flex flex-wrap mb-30">
			<!-- Blog Thumbnail -->
			<div class="blog-thumbnail">
				<img src="/images/11.jpg" alt="" />
			</div>
			<!-- Blog Content -->
			<div class="blog-content">
				<a href="#" class="post-tag">The Best</a> <a href="#"
					class="post-title">Birthday cake with chocolate</a>
				<div class="post-meta">
					<a href="#" class="post-date">July 11, 2018</a> <a href="#"
						class="post-author">By Julia Stiles</a>
				</div>
			</div>
		</div>
	</div>
<header class="header-area" ng-controller="headerCtrl" ng-init="init()">
    <!-- Logo Area -->
    <div class="logo-area">
        <a href="/"><img src="/images/logo.png" alt=""></a>
    </div>

    <!-- Navbar Area -->
    <div class="bueno-main-menu" id="sticker" style="z-index: 9999">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between navbar-expand-lg" id="buenoNav">
    				     <!-- Toggler -->
 			    	<div id="toggler"> <i class="fa fa-trophy" aria-hidden="true"></i></div>
 		
                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>
        		
                    <!-- Menu -->
                    <div class="classy-menu">
                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>
                        <!-- Nav Start -->
                        <div class="classynav navbar-collapse">
                       	    <ul  class="navbar-nav ml-auto">
                                <li ng-repeat="menu in menuList" class="chk_after nav-itemr">
                                	<a ng-click="link(menu.MENU_PATH)" data-text="{{menu.MENU_NAME}}" style="cursor: pointer;">
                                	  <i class="fa fa-search search-bar" aria-hidden="true" ng-show="menu.MENU_NAME == '조회하기'" id="search_btn"></i>
                                	  <i class="fa fa-sticky-note" aria-hidden="true" ng-show="menu.MENU_NAME == 'About'"></i>
									  <i class="fa fa-plus-square" aria-hidden="true" ng-show="menu.MENU_NAME == '등록하기'"></i> 
                                	  <i class="fa fa-github" aria-hidden="true" ng-show="menu.MENU_NAME == 'Github'"></i>
                                	  {{menu.MENU_NAME}}
                                	</a>
                                </li>
                            </ul>
                        </div>
		                <div class="col-12 col-sm-6 col-lg-5 col-xl-10"  id="search_form" style="display: none;">
		                    <!-- Top Search Area -->
		                    <div class="top-search-area">
		                        <form action="javascript:" class="search-bar input-group">
									<input type="search" name="search" pattern=".*\S.*" required style="border: 1px solid #e6e6e6;" ng-model="param.condition"  placeholder="검색">
									<i class="fa fa-search search-bar input-group-append" aria-hidden="true" style="background: #7B6341;color:#fff;padding-top: 3px;border: 1px solid #e6e6e6;cursor: pointer;"  ng-click="search_all()"></i>
								</form>
		                    </div>
		                </div>
 					</div>
 			   	<div class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#pk" role="button" aria-haspopup="true" aria-expanded="false"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i></a>
	                    <ul class="dropdown-menu dropdown-menu-right dropdown-danger">
	                      <li class="dropdown-header" href="#pk"><img src="<%= user_info.get("USER_IMAGE") %>" style="height: 30px;width: 30px;border-radius: 50%;vertical-align: middle;"> <%= user_info.get("USER_NAME") %> </li>
	                      <a class="dropdown-item" href="/web/setting.do">설정</a>
	                      <div class="dropdown-divider"></div>
	                      <a class="dropdown-item" ng-click="logout()">로그아웃</a>
	                    </ul>
	                
           			</div>  		
                 </nav>
            </div>
        </div>
    </div>
</header>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.factory('delivery', function(){
	var params = null;
	function getParams(){
		return params;
	}
	function setParams(newParams) {
		params = newParams;
	}
	return {
		getParams: getParams,
		setParams: setParams
	}
});

mainApp.controller("headerCtrl", function($scope){
	$scope.init = function(){
		$scope.param = {
			condition : ""	
		};
		$scope.menuList = [];
    	$scope.search_menu();
        $scope.setEvent();
    };
    $scope.setEvent = function(){
   		$(document).on('mouseenter', 'li.image_hover', function(){
   			$(this).find('img').css({
   				"filter": "grayscale(0)",
	   			"-webkit-filter": "grayscale(0)",
	   			"-moz-filter": "grayscale(0)",
	   			"-o-filter": "grayscale(0)",
	   			"-ms-filter":"grayscale(0)"
   			});
   		});
   		$(document).on('mouseleave', 'li.image_hover', function(){
   			$(this).find('img').css({
   				"filter": "grayscale(50%)",
   				"-webkit-filter": "grayscale(50%)",
   				"-moz-filter": "grayscale(50%)",
   				"-o-filter": "grayscale(50%)",
   				"-ms-filter":"grayscale(50%)"
   			})
   		});
   		
   		$("input[name='search']").keyup(function(){
   			if ($scope.param.condition != "") {
   				$("input[name='search']").removeClass('valid');
   			}
   		});
   		
   		
    };
    $scope.search_menu = function(){
    	$.ajax({
            type: 'POST',
            url: '/dev/getMenuList.json',
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({DEVICE: "WEB"}),
            async: true,
            success: function(res) {
            	$scope.menuList = res.MENU_LIST;
            	$scope.$apply();
            },
        });	
    };
    $scope.logout = function(){
    	$.ajax({
            type: 'POST',
            url: '/Auth/logout.json',
            contentType: "application/json; charset=UTF-8",
            async: true,
            success: function(res) {
            	location.href = res.RECIRECT_URL;          	
            },
        });	
    };
    $scope.link = function(path) {
    	if(path == '#') {
    		if($("#search_form").is(":visible")) {
    			$("#search_form").fadeOut(1000);
    		} else {
    			$("#search_form").fadeIn(1000);
    		}
    	} else {
    		location.href = path;
    	}
    };
    $scope.search_all = function(){
    	if($scope.param.condition == "" || !$scope.param.condition) {
    		$("input[name='search']").addClass('valid');
    	} else {
    		location.href = "/web/search.do?param='"+ $scope.param.condition +"'";
    	}
    }
});
</script>