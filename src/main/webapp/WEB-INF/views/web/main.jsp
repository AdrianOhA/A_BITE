<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div ng-controller="mainCtrl" ng-init="init()">
	<!-- ##### Hero Area Start ##### -->
	<div class="hero-area">
		<!-- Hero Post Slides -->
		<div class="hero-post-slides owl-carousel">
			<!-- Single Slide -->
			<div class="single-slide">
				<!-- Blog Thumbnail -->
				<div class="blog-thumbnail">
					<a href="#"><img src="/images/1.jpg" alt="" /></a>
				</div>

				<!-- Blog Content -->
				<div class="blog-content-bg">
					<div class="blog-content">
						<a href="#" class="post-tag">Healthy Food</a> <a href="#"
							class="post-title">Chicken Salad</a>
						<div class="post-meta">
							<a href="#" class="post-date">July 11, 2018</a> <a href="#"
								class="post-author">By Julia Stiles</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Slide -->
			<div class="single-slide">
				<!-- Blog Thumbnail -->
				<div class="blog-thumbnail">
					<a href="#"><img src="/images/2.jpg" alt="" /></a>
				</div>

				<!-- Blog Content -->
				<div class="blog-content-bg">
					<div class="blog-content">
						<a href="#" class="post-tag">Healthy Food</a> <a href="#"
							class="post-title">Chicken Salad</a>
						<div class="post-meta">
							<a href="#" class="post-date">July 11, 2018</a> <a href="#"
								class="post-author">By Julia Stiles</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Slide -->
			<div class="single-slide">
				<!-- Blog Thumbnail -->
				<div class="blog-thumbnail">
					<a href="#"><img src="/images/3.jpg" alt="" /></a>
				</div>

				<!-- Blog Content -->
				<div class="blog-content-bg">
					<div class="blog-content">
						<a href="#" class="post-tag">Healthy Food</a> <a href="#"
							class="post-title">Chicken Salad</a>
						<div class="post-meta">
							<a href="#" class="post-date">July 11, 2018</a> <a href="#"
								class="post-author">By Julia Stiles</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Slide -->
			<div class="single-slide">
				<!-- Blog Thumbnail -->
				<div class="blog-thumbnail">
					<a href="#"><img src="/images/3.jpg" alt="" /></a>
				</div>

				<!-- Blog Content -->
				<div class="blog-content-bg">
					<div class="blog-content">
						<a href="#" class="post-tag">Healthy Food</a> <a href="#"
							class="post-title">Chicken Salad</a>
						<div class="post-meta">
							<a href="#" class="post-date">July 11, 2018</a> <a href="#"
								class="post-author">By Julia Stiles</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Hero Area End ##### -->

	<div class="section-padding-100-0"></div>
	
	<!-- ##### Big Posts Area Start ##### -->
	<div class="big-posts-area mb-50">
		<div class="container">
			<!-- Single Big Post Area -->
			<div class="row align-items-center">
				<div class="col-12 col-md-6">
					<div class="big-post-thumbnail mb-50">
						<img src="/images/7.jpg" alt="" />
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="big-post-content text-center mb-50">
						<a href="#" class="post-tag">Healthy</a> <a href="#"
							class="post-title">Friend eggs with ham</a>
						<div class="post-meta">
							<a href="#" class="post-date">July 11, 2018</a> <a href="#"
								class="post-author">By Julia Stiles</a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Nunc tristique justo id elit bibendum pharetra non vitae lectus.
							Mauris libero felis, dapibus a ultrices sed, commodo vitae odio.
							Sed auctor tellus quis arcu tempus, egestas tincidunt augue
							pellentesque. Suspendisse vestibulum sem in eros maximus, pretium
							commodo turpis convallis. Aenean scelerisque orci quis urna
							tempus, vitae interdum velit aliquet.</p>
						<a href="#" class="btn bueno-btn">Read More</a>
					</div>
				</div>
			</div>

			<!-- Single Big Post Area -->
			<div class="row align-items-center">
				<div class="col-12 col-md-6">
					<div class="big-post-content text-center mb-50">
						<a href="#" class="post-tag">The Best</a> <a href="#"
							class="post-title">Steak with boiled vegetables</a>
						<div class="post-meta">
							<a href="#" class="post-date">July 11, 2018</a> <a href="#"
								class="post-author">By Julia Stiles</a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Nunc tristique justo id elit bibendum pharetra non vitae lectus.
							Mauris libero felis, dapibus a ultrices sed, commodo vitae odio.
							Sed auctor tellus quis arcu tempus, egestas tincidunt augue
							pellentesque. Suspendisse vestibulum sem in eros maximus, pretium
							commodo turpis convallis. Aenean scelerisque orci quis urna
							tempus, vitae interdum velit aliquet.</p>
						<a href="#" class="btn bueno-btn">Read More</a>
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="big-post-thumbnail mb-50">
						<img src="/images/8.jpg" alt="" />
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
							<div class="single-post-catagory mb-30">
								<img ng-src="{{recipe.THUMBNAIL}}" alt="" />
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
								<p>
 									{{recipe.TIP}}
								</p>
							</div>
							<div class="social-info">
								<a style="cursor: pointer;" ng-click="recipeLink(recipe.USER_NO, recipe.RECIPE_NO, recipe.SELL_PAY, recipe.SELL_CNT, recipe.TITLE)"><i class="fa fa-comment" aria-hidden="true"></i></a>
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
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
												<path d="M24 0v24H0V0h24z" fill="none" opacity=".87"/><path d="M18.41 16.59L13.82 12l4.59-4.59L17 6l-6 6 6 6 1.41-1.41zM6 6h2v12H6V6z"/>
											</svg>	
										</a>
										<a href="javascript:void(0)" class="btns prev off" 
											ng-disabled="data.pageno == 1" 
											ng-click="pagePrev()">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.61 7.41L14.2 6l-6 6 6 6 1.41-1.41L11.03 12l4.58-4.59z"/></svg>
										</a>
									</span>
									<li class="page-item" ng-class="{'active' : pageno == data.pageno}" ng-repeat="pageno in result.pager.pageList track by $index" ng-click="pageGo(pageno)"> 
										<a href="javascript:void(0)"  class="page-link">{{ pageno }}</a>
									</li>
									<span class="next_box" style="margin-top: 4px;">
										<a href="javascript:void(0)" class="btns next on" 
											ng-disabled="data.pageno == result.pager.totalPageCount" 
											ng-click="pageNext(data.pageno+1)">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M10.02 6L8.61 7.41 13.19 12l-4.58 4.59L10.02 18l6-6-6-6z"/></svg>	
										</a>
										<a href="javascript:void(0)" class="btns last on" 
											ng-disabled="(result.pager.totalPageCount - data.pageno) < 5" 
											ng-click="pageLast(result.pager.totalPageCount)">
											<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none" opacity=".87"/><path d="M5.59 7.41L10.18 12l-4.59 4.59L7 18l6-6-6-6-1.41 1.41zM16 6h2v12h-2V6z"/></svg>
										</a>
									</span>
									<!-- <li class="page-item" ng-click="pagination.setPage(i)" ng-class="pagination.page==i && 'active'"  ng-repeat="i in pagination.pageCount()"> 
							            <a class="page-link" href="#"> 
							                <i>{{i+1}}</i> 
							            </a> 
							        </li> -->
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
					avatar : user_info.USER_IMAGE,
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