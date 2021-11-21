<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>


<header class="header-area" ng-controller="headerCtrl" ng-init="init()">
    <!-- Top Header Area -->
    <div class="top-header-area bg-img bg-overlay" style="background-image: url(/images/header.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-between">
                <div class="col-12 col-sm-6 col-lg-5 col-xl-4">
                    <!-- Top Search Area -->
                    <div class="top-search-area">
                        <form action="#" method="post">
                            <input type="search" name="top-search" placeholder="Search">
                            <button type="button" class="btn" ng-click="search()" id="btn"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Logo Area -->
    <div class="logo-area">
        <a href="/"><img src="/images/logo.png" alt=""></a>
    </div>

    <!-- Navbar Area -->
    <div class="bueno-main-menu" id="sticker">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between navbar-expand-lg" id="buenoNav">

                    <!-- Toggler -->
                    <div id="toggler"><img src="/images/ranking.png" alt="" style="width: 30px;height: 30px;"></div>

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
                                	<a href="{{menu.MENU_PATH}}" data-text="{{menu.MENU_NAME}}">
                                	 <i class="fa fa-search" aria-hidden="true" ng-show="menu.MENU_NAME == '종류별'"></i>
                                	  <i class="fa fa-compass" aria-hidden="true" ng-show="menu.MENU_NAME == '거리별'"></i>
                                	  <i class="fa fa-plus-square" aria-hidden="true" ng-show="menu.MENU_NAME == '등록하기'"></i> 
                                	  <i class="fa fa-github" aria-hidden="true" ng-show="menu.MENU_NAME == 'Github'"></i>{{menu.MENU_NAME}}</a>
                                	 <div ng-if="menu.SUB_MENU_LIST.length > 0" style="padding-left:20px;padding-right:20px;">
		                               	 <div class="megamenu">
 			                               	  <ul class="single-mega cn-col-4" ng-repeat="smenu in menu.SUB_MENU_LIST">
			                               	    <li class="image_hover"><a href="{{smenu.MENU_PATH}}" style="text-align: center;" ><img ng-src="{{smenu.MENU_THUMBNAIL}}" style="width: 200px;height: 130px;-webkit-filter: grayscale(50%);-moz-filter: grayscale(50%);-o-filter: grayscale(50%);-ms-filter: grayscale(50%);filter: grayscale(50%);" /><br><span class="title">{{smenu.MENU_NAME}}</span></a></li>
			                                 </ul> 	     
			                             </div>    
	                                 </div>
                                </li>
                            </ul>
                        </div>
 					</div>
 					<div class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#pk" role="button" aria-haspopup="true" aria-expanded="false"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i></a>
	                    <ul class="dropdown-menu dropdown-menu-right dropdown-danger">
	                      <li class="dropdown-header" href="#pk"><%= user_info.get("USER_NAME") %></li>
	                      <a class="dropdown-item" href="#pk">프로필</a>
	                      <a class="dropdown-item" href="#pk">Settings</a>
	                      <div class="dropdown-divider"></div>
	                      <a class="dropdown-item" href="#pk">로그아웃</a>
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
mainApp.controller("headerCtrl", function($scope){
	$scope.init = function(){
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
            	$(".chk_after").each(function(){
            	 	var sub_menu_length = $(this).find('div').find('ul').length;
            		if(sub_menu_length == 0) {
            			$(this).removeClass('megamenu-item');
            		}
            	});            	
            },
        });	
    };
});
</script>