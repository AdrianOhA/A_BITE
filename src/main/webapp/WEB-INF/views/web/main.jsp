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
						<div class="pagination-area mt-70">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item" ng-click="pagination.setPage(i)" ng-class="pagination.page==i && 'active'"  ng-repeat="i in pagination.pageCount()"> 
							            <a class="page-link" href="#"> 
							                <i>{{i+1}}</i> 
							            </a> 
							        </li>
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
	$scope.init = function() {
		$scope.recipes = [];
		$scope.setEvent();
		$scope.search();
	};
	$scope.setEvent = function() {
	};
	$scope.search = function() {
		$.ajax({
	       type: 'POST',
	       url: '/web/getRecipeList.json',
	       data: JSON.stringify({"email" : "test"}),
	       contentType: "application/json; charset=UTF-8",
	       success: function(res) {
	    	   $scope.pagination.page_info.itemCount = res.COUNT; 
	       	   $scope.recipes = res.RECIPE_LIST;
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
	}
	
	$scope.pagination = {
	  page_info : {
		 page : 0,
		 rowsPerPage : 7,
		 itemCount : 0,
		 limitPerPage : 5	
	  },
	  setPage : function(page) {
	    if (this.page_info.page > this.pageCount()) {
	      return;
	    }
	    this.page_info.page = page;
	  },
	  nextPage: function() {
	    if (this.isLastPage()) {
	      return;
	    }
	    this.page_info.page++;
	  },
	  perviousPage: function() {
	    if (this.isFirstPage()) {
	      return;
	    }
	    this.page_info.page--;
	  },
	  firstPage: function() {
		  this.page_info.page = 0;
	  },
	  lastPage : function() {
		  this.page_info.page = this.pageCount() - 1;
	  },
	  isFirstPage : function() {
	    return this.page_info.page == 0;
	  },
	  isLastPage : function() {
	    return this.page_info.page == this.pageCount() - 1;
	  },
	  pageCount : function() {
	    return new Array(Math.ceil(parseInt(this.page_info.itemCount) / parseInt(this.page_info.rowsPerPage)));
	  },
	  lowerLimit : function() {
	    var pageCountLimitPerPageDiff = this.pageCount() - this.limitPerPage;

	    if (pageCountLimitPerPageDiff < 0) {
	      return 0;
	    }

	    if (this.page_info.page > pageCountLimitPerPageDiff + 1) {
	      return pageCountLimitPerPageDiff;
	    }

	    var low = this.page_info.page - (Math.ceil(this.page_info.limitPerPage / 2) - 1);

	    return Math.max(low, 0);
	  }	  
	};
});
</script>