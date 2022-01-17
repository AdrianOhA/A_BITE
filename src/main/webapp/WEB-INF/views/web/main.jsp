<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div ng-controller="mainCtrl" ng-init="init()">
	<!-- ##### Hero Area Start ##### -->
	<div class="hero-area">
		<!-- Hero Post Slides -->
		<div class="hero-post-slides owl-carousel">
			<!-- Single Slide -->
			<c:forEach var="crecipe" items="${CURR_RECIPES}" varStatus="status">
				<div class="single-slide">
					<div class="blog-thumbnail">
						<a href="#"><img src="${crecipe.THUMBNAIL}" alt=""  style="width: 700px;height: 650px"  /></a>
					</div>
					<!-- Blog Content -->
					<div class="blog-content-bg">
						<div class="blog-content">
							<a href="#" class="post-tag">${crecipe.CATEGORY}</a> <a href="#"
								class="post-title">${crecipe.TITLE}</a>
							<div class="post-meta">
								<a href="#" class="post-date">가격: ${crecipe.SELL_PAY} 원</a> <a href="#"
										class="post-author">남은 수량: ${crecipe.SELL_CNT}</a>	
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="section-padding-100-0"></div>
	
	<div class="big-posts-area mb-50">
		<div class="container">
			<div class="row align-items-center" ng-repeat="rank in categoryRanks track by $index">
				<div class="col-12 col-md-6" ng-show="$index % 2 == 0">
					<div class="big-post-thumbnail mb-50">
						<img ng-src="{{rank.THUMBNAIL}}" alt="" style="width: 540;height: 530px;flex-shrink: 0;min-width: 100%;min-height: 100%;" />
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="big-post-content text-center mb-50">
						<a href="#" class="post-tag">THE BEST<br>{{rank.CATEGORY}}</a> <a href="#"
							class="post-title">{{rank.TITLE}}</a>
						<div class="post-meta">
							<a href="#" class="post-date">가격: {{rank.SELL_PAY}}</a> <a href="#"
								class="post-author">남은 수량: {{rank.SELL_CNT}}</a>
						</div>
						<p>{{rank.INFO}}<br>{{rank.TIP}}</p>
						<a href="#" class="btn bueno-btn">상세보기</a>
					</div>
				</div>
				<div class="col-12 col-md-6" ng-show="$index % 2 == 1">
					<div class="big-post-thumbnail mb-50">
						<img  ng-src="{{rank.THUMBNAIL}}" alt="" style="width: 540;height: 530px;flex-shrink: 0;min-width: 100%;min-height: 100%;" />
					</div>
				</div>
			</div>
						
		</div>
	</div>
	<div class="catagory-post-area section-padding-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8 col-xl-12">
					<div class="single-blog-post style-1 d-flex flex-wrap mb-30" ng-repeat="recipe in recipes">
						<div class="col-12 col-md-6 col-lg-4">
							<div class="single-post-catagory mb-30" style="display: flex;">
								<img ng-src="{{recipe.THUMBNAIL}}" alt="" style="height:255px;flex-shrink: 0;min-width: 100%;min-height: 100%;"/>
								<div class="catagory-content-bg">
									<div class="catagory-content">
										<a ng-href="/web/recipe.do?recipeNo={{recipe.RECIPE_NO}}" class="post-tag">{{recipe.CATEGORY}}</a><a ng-href="/web/recipe.do?recipeNo={{recipe.RECIPE_NO}}"
											class="post-title">{{recipe.TITLE}}</a>
									</div>
								</div>
							</div>
						</div>
						<!-- Blog Content -->
						<div class="blog-content">
							<a ng-href="/web/recipe.do?recipeNo={{recipe.RECIPE_NO}}" class="post-tag">{{recipe.TAG}}</a> <a ng-href="/web/recipe.do?recipeNo={{recipe.RECIPE_NO}}"
								class="post-title">{{recipe.TITLE}}</a>
							<div class="post-meta">
								<a href="#" class="post-date">가격: {{recipe.SELL_PAY}} 원</a> <a href="#"
									class="post-author">남은 수량: {{recipe.SELL_CNT}}</a>
							</div>
							<p>{{recipe.INFO}}</p>
						</div>
						<div class="single-widget-area author-widget col-lg-3">
							<div class="background-pattern bg-img"
								style="background-image: url(/images/pattern2.png);">
								<div class="author-thumbnail">
									<img ng-src="{{recipe.USER_IMAGE}}" alt="">
								</div>
								<p></p>
								<pre>{{recipe.USER_INFO}}</pre>
							</div>
							<div class="social-info">
								<a style="cursor: pointer;" ng-click="recipeLink(recipe.USER_NO, recipe.RECIPE_NO, recipe.SELL_PAY, recipe.SELL_CNT, recipe.TITLE)"><i class="fa fa-comment cart-btn" aria-hidden="true"></i></a>
								<a style="cursor: pointer;" ng-click="recipeLink(recipe.USER_NO)"><i class="fa fa-user-circle" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="row"> 
					<div class="col-12">
						<div class="pagination-area mt-70 paging" ng-show="result.pager.totalCount > 0">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<span class="prev_box" style="margin-top: 4px;">
										<a href="javascript:void(0)" class="btns first off" 
											ng-disabled="data.pageno <= 5" 
											ng-click="pageFirst()">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341">
												<path d="M24 0v24H0V0h24z" fill="none" opacity=".87"/><path d="M18.41 16.59L13.82 12l4.59-4.59L17 6l-6 6 6 6 1.41-1.41zM6 6h2v12H6V6z"/>
											</svg>	
										</a>
										<a href="javascript:void(0)" class="btns prev off" 
											ng-disabled="data.pageno == 1" 
											ng-click="pagePrev()">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.61 7.41L14.2 6l-6 6 6 6 1.41-1.41L11.03 12l4.58-4.59z"/></svg>
										</a>
									</span>
									<li class="page-item" ng-class="{'active' : pageno == data.pageno}" ng-repeat="pageno in result.pager.pageList track by $index" ng-click="pageGo(pageno)"> 
										<a href="javascript:void(0)"  class="page-link">{{ pageno }}</a>
									</li>
									<span class="next_box" style="margin-top: 4px;">
										<a href="javascript:void(0)" class="btns next on" 
											ng-disabled="data.pageno == result.pager.totalPageCount" 
											ng-click="pageNext(data.pageno+1)">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M10.02 6L8.61 7.41 13.19 12l-4.58 4.59L10.02 18l6-6-6-6z"/></svg>	
										</a>
										<a href="javascript:void(0)" class="btns last on" 
											ng-disabled="(result.pager.totalPageCount - data.pageno) < 5" 
											ng-click="pageLast(result.pager.totalPageCount)">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341"><path d="M0 0h24v24H0V0z" fill="none" opacity=".87"/><path d="M5.59 7.41L10.18 12l-4.59 4.59L7 18l6-6-6-6-1.41 1.41zM16 6h2v12h-2V6z"/></svg>
										</a>
									</span>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="instagram-feed-area d-flex flex-wrap">
		<div class="single-instagram">
			<img src="/images/insta1.jpg" alt="" /> <a href="/images/insta1.jpg"
				class="img-zoom" title="Instagram Image">+</a>
		</div>
		<div class="single-instagram">
			<img src="/images/insta2.jpg" alt="" /> <a href="/images/insta2.jpg"
				class="img-zoom" title="Instagram Image">+</a>
		</div>
		<div class="single-instagram">
			<img src="/images/insta3.jpg" alt="" /> <a href="/images/insta3.jpg"
				class="img-zoom" title="Instagram Image">+</a>
		</div>
		<div class="single-instagram">
			<img src="/images/insta4.jpg" alt="" /> <a href="/images/insta4.jpg"
				class="img-zoom" title="Instagram Image">+</a>
		</div>
		<div class="single-instagram">
			<img src="/images/insta5.jpg" alt="" /> <a href="/images/insta5.jpg"
				class="img-zoom" title="Instagram Image">+</a>
		</div>

	</div>
</div>
<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));


mainApp.controller("mainCtrl", function($scope, delivery) {
	$scope.recipes = [];
	$scope.categoryRanks = [];
	$scope.data = {
		pageno: 1,
		rowCount: "10"
	}
	$scope.params = {
		pageno: 1,
		rowCount: "10",	
	}
	$scope.result = {
		list : null,
		pager: {
			totalCount: 0,
			totalPageCount : 1
		}
	}
		
	$scope.init = function() {
		$scope.recipes = [];
		$scope.setEvent();
		$scope.searchCategoryRanks();
		$scope.search();
	};
	$scope.setEvent = function() {
	};
	$scope.search = function() {
		$scope.params.pageno = $scope.data.pageno;
		$scope.params.rowCount = parseInt($scope.data.rowCount);
		$scope.result.pager = {};
		
		$.ajax({
	       type: 'POST',
	       url: '/web/getRecipeList.json',
	       data: JSON.stringify($scope.params),
	       contentType: "application/json; charset=UTF-8",
	       success: function(res) {
	    	   $scope.result.pager = res.pager;
	    	   if ($scope.result.pager.totalPageCount == 0) {
				  $scope.result.pager.totalPageCount = 1;
			   }
	    	   res.list.filter(function(obj){
	    		   /*  obj.USER_INFO = obj.USER_INFO.replace("\r\n", "<br>");*/ 
	    	   });
	       	   $scope.recipes = res.list;
	       	   $scope.$apply();
		   },
	    });	
	};
	
	$scope.recipeLink = function(userNo, recipeNo, sellPay, sellCnt, title) {
		if(recipeNo) { //chat
			$scope.searchUser(userNo , function(user_info){
				var _obj = {
					id : 0, 
					recipeNo : recipeNo,
					username : user_info.USER_NAME,
					target: user_info.USER_ID,
					avatar : user_info.THUMBNAIL,
					messages: [],
					sellPay : sellPay,
					sellCnt : sellCnt,
					title : title
				};
				delivery.setParams(_obj);
			});
		} else {
			
		}
	}
	
	$scope.searchUser= function(userNo, callback) {
		$.ajax({
	       type: 'POST',
	       url: '/Auth/getMemberForChat.json',
	       data: JSON.stringify({"userNo" : userNo}),
	       async: false,
	       contentType: "application/json; charset=UTF-8",
	       success: function(res) {
	       		callback(res.userInfo);
		   },
	    });	
	};
	
	$scope.searchCategoryRanks = function(){
		$.ajax({
	       type: 'POST',
	       url: '/web/getCategoryRanks.json',
	       contentType: "application/json; charset=UTF-8",
	       success: function(res) {
	       	   $scope.categoryRanks = res.list;
	       	   $scope.$apply();
		   },
	    });	
	}
	
	
	$scope.pageGo = function(pageno) {
		$scope.data.pageno = pageno;
		$scope.search();
	}
	
	$scope.pageFirst = function() {
		if ($scope.data.pageno == 1) {
			return;
		}
		
		$scope.pageGo(1);
	}
	
	$scope.pageLast = function() {
		if ($scope.data.pageno == $scope.result.pager.totalPageCount) {
			return;
		}
		
		$scope.pageGo($scope.result.pager.totalPageCount);
	}
	
	$scope.pageNext = function() {
		if ($scope.result.pager.endPageno+1 > $scope.result.pager.totalPageCount) {
			return;
		}
		$scope.pageGo($scope.result.pager.endPageno+1);
	}
	
	$scope.pagePrev = function() {
		if ($scope.result.pager.beginPageno-1 == 0) {
			return;
		}
		$scope.pageGo($scope.result.pager.beginPageno-1);
	}
	
	$scope.changeRowCount = function() {
		$scope.pageGo(1);
	}

});
</script>