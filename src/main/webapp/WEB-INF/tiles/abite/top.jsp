<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<header class="header-area" ng-controller="headerCtrl" ng-init="init()">
    <!-- Top Header Area -->
    <div class="top-header-area bg-img bg-overlay" style="background-image: url(../public/images/header.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-between">
                <div class="col-12 col-sm-6 col-lg-5 col-xl-4">
                    <!-- Top Search Area -->
                    <div class="top-search-area">
                        <form action="#" method="post">
                            <input type="search" name="top-search" placeholder="Search">
                            <button type="button" class="btn" ng-click="search()"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Logo Area -->
    <div class="logo-area">
        <a href="/"><img src="../public/images/logo.png" alt=""></a>
    </div>

    <!-- Navbar Area -->
    <div class="bueno-main-menu" id="sticker">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="buenoNav">

                    <!-- Toggler -->
                    <div id="toggler"><img src="../public/images/ranking.png" alt="" style="width: 30px;height: 30px;"></div>

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
                        <div class="classynav">
                            <ul>
                                <li ng-repeat="menu in menuList" class="chk_after">
                                	<a href="{{menu.MENU_PATH}}">{{menu.MENU_NAME}}</a>
	                               	 <div ng-if="menu.SUB_MENU_LIST.length > 0" class="megamenu">
		                               	 <ul class="single-mega cn-col-4" ng-repeat="smenu in menu.SUB_MENU_LIST">
		                               	    <li><a href="{{smenu.MENU_PATH}}" style="text-align: center;"><img ng-src="{{smenu.MENU_THUMBNAIL}}" style="width: 200px;height: 130px" /><br><span>{{smenu.MENU_NAME}}</span></a></li>
		                                 </ul>
	                                 </div>
                                </li>
                            </ul>  
                        </div>
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