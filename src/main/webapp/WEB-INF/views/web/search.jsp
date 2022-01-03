<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

<div class="catagory-post-area section-padding-100"  ng-controller="searchCtrl" ng-init="init()">
    <div class="container">
    	<div class="header-area" style="z-index: 1">
	    	<div class="top-header-area bg-img bg-overlay" style="background-image: url(/images/header.jpg);">
		        <div class="container h-100">
		            <div class="row h-100 align-items-center justify-content-between">
		                <div class="col-12 col-sm-6 col-lg-5 col-xl-4">
		                    <!-- Top Search Area -->
		                    <div class="top-search-area">
		                        <form action="#" method="post">
		                            <input type="search" name="top-search" placeholder="검색">
		                            <button type="button" class="btn" ng-click="search()" id="btn"><i class="fa fa-search"></i></button>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
        <div class="row justify-content-center chk_after">
        	<section class="col-12 col-lg-8 col-xl-12">
        		<details open>
	        		<summary class="note title">카테고리별 검색</summary>
	        		<div class="col-md-10">
	        			<c:forEach var="category" items="${CATEGORY_LIST}" varStatus="status">
	        				<a href="#0" class="btn btn-link btn-primary" data-value="${category.CODE_CD}">${category.CODE_NM}</a>
			            </c:forEach>
			        </div>
			        <div class="catagory-post-area section-padding-100">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-12 col-lg-8 col-xl-12">
									<div class="single-blog-post style-1 d-flex flex-wrap mb-30" ng-repeat="recipe in recipes">
										<div class="col-12 col-md-6 col-lg-4">
											<div class="single-post-catagory mb-30">
												<img ng-src="{{recipe.THUMBNAIL}}" alt="" style="height:255px;"/>
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
		        </details>
        	</section>
        	<section class="col-12 col-lg-8 col-xl-12">
        		<details open>
	        		<summary class="note title">거리별 검색</summary>
	        		<div id="map"></div>
        		</details>
        	</section>
        </div>
    </div>
</div>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller("searchCtrl", function($scope) {
	$scope.init = function() {
		$scope.recipes = [];
		$scope.setEvent();
		$scope.search();
	};
	
	$scope.data = {
		pageno: 1,
		rowCount: "10"
	};
	$scope.params = {
		pageno: 1,
		rowCount: "10",	
	};
	$scope.result = {
		list : null,
		pager: {
			totalCount: 0,
			totalPageCount : 1
		}
	};
	
	$scope.setEvent = function() {
		$("#search_btn").on('click', function(e){
			alert("click bublling")
		});
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
});
</script>