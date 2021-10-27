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
                                <li><a href="/">Home</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/">Home</a></li>
                                        <li><a href="catagory.do">Catagory</a></li>
                                        <li><a href="catagory-post.do">Catagory Post</a></li>
                                        <li><a href="single-post.do">Single Post</a></li>
                                        <li><a href="receipe.do">Recipe</a></li>
                                        <li><a href="contact.do">Contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Recipes</a>
                                    <div class="megamenu">
                                        <ul class="single-mega cn-col-4">
                                            <li><a href="#">- Recipe</a></li>
                                            <li><a href="#">- Bread</a></li>
                                            <li><a href="#">- Breakfast</a></li>
                                            <li><a href="#">- Meat</a></li>
                                            <li><a href="#">- Fastfood</a></li>
                                            <li><a href="#">- Salad</a></li>
                                            <li><a href="#">- Soup</a></li>
                                        </ul>
                                        <ul class="single-mega cn-col-4">
                                            <li><a href="#">- Recipe</a></li>
                                            <li><a href="#">- Bread</a></li>
                                            <li><a href="#">- Breakfast</a></li>
                                            <li><a href="#">- Meat</a></li>
                                            <li><a href="#">- Fastfood</a></li>
                                            <li><a href="#">- Salad</a></li>
                                            <li><a href="#">- Soup</a></li>
                                        </ul>
                                        <ul class="single-mega cn-col-4">
                                            <li><a href="#">- Recipe</a></li>
                                            <li><a href="#">- Bread</a></li>
                                            <li><a href="#">- Breakfast</a></li>
                                            <li><a href="#">- Meat</a></li>
                                            <li><a href="#">- Fastfood</a></li>
                                            <li><a href="#">- Salad</a></li>
                                            <li><a href="#">- Soup</a></li>
                                        </ul>
                                        <ul class="single-mega cn-col-4">
                                            <li><a href="#">- Recipe</a></li>
                                            <li><a href="#">- Bread</a></li>
                                            <li><a href="#">- Breakfast</a></li>
                                            <li><a href="#">- Meat</a></li>
                                            <li><a href="#">- Fastfood</a></li>
                                            <li><a href="#">- Salad</a></li>
                                            <li><a href="#">- Soup</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li><a href="/single-post.do">Blog</a></li>
                                <li><a href="contact.do">Contact</a></li>
                            </ul>
                        </div>
                        <!-- Nav End -->

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
        $scope.setEvent();
    };
    $scope.setEvent = function(){
        
    };
    $scope.search = function(){
        alert("search btn click");
    };
});
</script>