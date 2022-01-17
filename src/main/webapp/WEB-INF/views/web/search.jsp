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
		                            <input type="search" name="top-search" placeholder="검색" ng-model="params.query">
		                            <button type="button" class="btn" ng-click="search()" id="btn"><i class="fa fa-search"></i></button>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
        <div class="row justify-content-center chk_after">
        	<section class="col-12 col-lg-8 col-xl-12" style="margin:0 auto;">
        		<details open>
	        		<summary class="note title">카테고리별 검색</summary>
	        		<div class="col-md-10">
	        			<c:forEach var="category" items="${CATEGORY_LIST}" varStatus="status">
	        				<a href="#0" class="btn btn-link btn-primary" data-value="${category.CODE_CD}" id="${category.CODE_CD}" ng-click="search('${category.CODE_CD}')">${category.CODE_NM}</a>
			            </c:forEach>
			        </div>
			        <div class="catagory-post-area section-padding-100">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-12 col-lg-8 col-xl-12">
									<div class="single-blog-post style-1 d-flex flex-wrap mb-30" ng-repeat="recipe in recipes">
										<div class="col-12 col-md-6 col-lg-4">
											<div class="single-post-catagory mb-30">
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
        	<section class="col-12 col-lg-8 col-xl-12" style="margin: 0 auto;">
        		<details open>
	        		<summary class="note title">거리별 검색</summary>
        			<span class="col-xl-12">
        			    <span class="row">
        			    	<span  class="col-xl-3" style="width:100%;height:600px;left:0px;top:0px">
        			    	    <ul class="ng-scope" style="max-height: 600px;">
						           <li ng-click="" ng-repeat="loc in locationList" style="border: 1px solid #7B6341;border-radius: 2px;margin-bottom: 5px;">
						             <span class="row">
							           	 <span class="col-sm-4" style="padding-right:5px;">
							           	 	<img class="avatar" ng-src="{{loc.THUMBNAIL}}" style="height:80px;width:100%;">
							           	 </span>
							             <span class="col-sm-8">
							             	 <p class="username ng-binding" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;font-weight: 600;">{{loc.TITLE}}</p>
							             	 <a class="" style="color:#7a7a7a;font-weight:normal;font-size: 12px;">가격: {{loc.SELL_PAY}}</a><br> <a class="" style="color:#7a7a7a;font-weight:normal;font-size: 12px;">남은 수량: {{loc.SELL_CNT}}</a>											
							             </span>
						             </span>
 						           </li>
						         </ul>
        			    	    <nav aria-label="Page navigation" class="row margin-top-15 justify-content-center">
									<ul class="pagination">
										<span class="prev_box" style="margin-top: 4px;">
											<a href="javascript:void(0)" class="btns first off" 
												ng-disabled="data.pageno2 <= 5" 
												ng-click="pageFirst2()">
												<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341">
													<path d="M24 0v24H0V0h24z" fill="none" opacity=".87"/><path d="M18.41 16.59L13.82 12l4.59-4.59L17 6l-6 6 6 6 1.41-1.41zM6 6h2v12H6V6z"/>
												</svg>	
											</a>
											<a href="javascript:void(0)" class="btns prev off" 
												ng-disabled="data.pageno2 == 1" 
												ng-click="pagePrev2()">
												<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.61 7.41L14.2 6l-6 6 6 6 1.41-1.41L11.03 12l4.58-4.59z"/></svg>
											</a>
										</span>
										<li class="page-item" ng-class="{'active' : pageno2 == data.pageno2}" ng-repeat="pageno2 in result.pager2.pageList track by $index" ng-click="pageGo2(pageno2)"> 
											<a href="javascript:void(0)"  class="page-link">{{ pageno2 }}</a>
										</li>
										<span class="next_box" style="margin-top: 4px;">
											<a href="javascript:void(0)" class="btns next on" 
												ng-disabled="data.pageno2 == result.pager2.totalPageCount" 
												ng-click="pageNext2(data.pageno2+1)">
												<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M10.02 6L8.61 7.41 13.19 12l-4.58 4.59L10.02 18l6-6-6-6z"/></svg>	
											</a>
											<a href="javascript:void(0)" class="btns last on" 
												ng-disabled="(result.pager2.totalPageCount - data.pageno2) < 5" 
												ng-click="pageLast2(result.pager2.totalPageCount)">
												<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#7B6341"><path d="M0 0h24v24H0V0z" fill="none" opacity=".87"/><path d="M5.59 7.41L10.18 12l-4.59 4.59L7 18l6-6-6-6-1.41 1.41zM16 6h2v12h-2V6z"/></svg>
											</a>
										</span>
									</ul>
								</nav>
        			    	</span>
        			    	<span id="vmap" class="col-xl-9" style="width:100%;height:600px;left:0px;top:0px"></span>
	        			</span>
	        		</span>
        		</details>
        	</section>
        </div>
    </div>
</div>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
var currLAT = <%=user_info.get("LAT")%>;
var currLNG = <%=user_info.get("LNG")%>;
var markerLayer,vmap = null;
mainApp.controller("searchCtrl", function($scope) {
 	$scope.init = function() {
 		$scope.recipes = [];
		$scope.locationList = [];
		$scope.setEvent();
		$scope.setMap();
		$scope.search();
	};
	
	$scope.data = {
		pageno: 1,
		rowCount: "6",
		pageno2: 1
	};
	$scope.params = {
		pageno: 1,
		pageno2 : 1,
		rowCount: "6",
		query : <%= request.getParameter("param")%>
	};
	$scope.result = {
		list : null,
		pager: {
			totalCount: 0,
			totalPageCount : 1
		},
		pager2 :{
			totalCount: 0,
			totalPageCount : 1
		}
	};
	
	$scope.setEvent = function() {
		$("#search_btn").on('click', function(e){
			search();
		});
	};
	$scope.search = function(category) {
		$scope.params.pageno = $scope.data.pageno;
		$scope.params.pageno2 = $scope.data.pageno2;
		$scope.params.rowCount = parseInt($scope.data.rowCount);
		$scope.params.category = '';
		if(category) {
			$scope.params.category = category;	
		}
		$scope.result.pager = {};
		$scope.result.pager2 = {};
		
		$.ajax({
	       type: 'POST',
	       url: '/web/getRecipeList.json',
	       data: JSON.stringify($scope.params),
	       contentType: "application/json; charset=UTF-8",
	       success: function(res) {
	    	   $scope.result.pager = res.pager;
	    	   $scope.result.pager2 = res.pager2;
	    	   if ($scope.result.pager.totalPageCount == 0) {
				  $scope.result.pager.totalPageCount = 1;
			   }
	    	   if ($scope.result.pager2.totalPageCount == 0) {
				  $scope.result.pager2.totalPageCount = 1;
			   }
	       	   $scope.recipes = res.list || [];
	       	   
	       	   var _locationList = res.locationList || [];
	       	   for(var i = 0; i < _locationList.length; i++) {
  	     	     var _loc = _locationList[i]; 
	     	     if( _loc.LAT &&  _loc.LNG) {
	     	    	loc.km  = getDistanceFromLatLonInKm(parseFloat(currLAT), parseFloat(currLNG), _loc.LAT, _loc.LNG );
	     	     }
		       }
	       	   $scope.locationList = _locationList;
	       	   addMarkerLayer(vmap, $scope.locationList);
	       	   $scope.$apply();
		   },
	    });	
	};
	
	$scope.setMap = function(){
	  vw.ol3.MapOptions = {
	      basemapType: vw.ol3.BasemapType.GRAPHIC
	    , controlDensity: vw.ol3.DensityType.EMPTY
	    , interactionDensity: vw.ol3.DensityType.BASIC
	    , controlsAutoArrange: true
	    , homePosition: vw.ol3.CameraPosition
	    , initPosition: vw.ol3.CameraPosition
	  }; 
			      
	  vmap = new vw.ol3.Map("vmap",  vw.ol3.MapOptions);
	  if(currLAT != null && currLNG != null) {
		  move(vmap, parseFloat(currLAT), parseFloat(currLNG), 1);  
	  }
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
	
	$scope.pageGo2 = function(pageno) {
		$scope.data.pageno2 = pageno;
		$scope.search();
	}
	
	$scope.pageFirst2 = function() {
		if ($scope.data.pageno2 == 1) {
			return;
		}
		
		$scope.pageGo2(1);
	}
	
	$scope.pageLast2 = function() {
		if ($scope.data.pageno2 == $scope.result.pager2.totalPageCount) {
			return;
		}
		
		$scope.pageGo2($scope.result.pager2.totalPageCount);
	}
	
	$scope.pageNext2 = function() {
		if ($scope.result.pager2.endPageno+1 > $scope.result.pager2.totalPageCount) {
			return;
		}
		$scope.pageGo2($scope.result.pager2.endPageno+1);
	}
	
	$scope.pagePrev2 = function() {
		if ($scope.result.pager2.beginPageno-1 == 0) {
			return;
		}
		$scope.pageGo2($scope.result.pager2.beginPageno-1);
	}
	
	$scope.changeRowCount2 = function() {
		$scope.pageGo2(1);
	}

	function move(vmap, x,y,z){
       var _center = [ x, y ];
       var z = z;
       var pan = ol.animation.pan({
        duration : 2000,
        source : (vmap.getView().getCenter())
       });
       vmap.beforeRender(pan);
       vmap.getView().setCenter(_center);
       setTimeout(fnMoveZoom(vmap), 3000);
   };

   function removeAllMarker() {
    if(markerLayer != null){
    	markerLayer.removeAllMarker();
    }
   }
   function fnMoveZoom(vmap) {
	 var zoom = vmap.getView().getZoom();
	 if (16 > zoom) {
	   vmap.getView().setZoom(14);
	 }
   };
   
  function addMarkerLayer(vmap, recipeList) {
	removeAllMarker();
  	markerLayer = new vw.ol3.layer.Marker(vmap);
  	vmap.addLayer(markerLayer);
  	for(var i = 0; i < recipeList.length; i++) {
	   var _recipe = recipeList[i]; 
	   if(_recipe.LAT && _recipe.LNG) {
		 addMarker( _recipe.LAT, _recipe.LNG, _recipe.TITLE, _recipe.SELL_PAY, _recipe.SELL_CNT, _recipe.ADDRESS);	   
	   }
	 }
  };

  function addMarker(lat, lng, title, sellPay, sellCnt, address) {
	vw.ol3.markerOption = {
	  x : lat,
	  y : lng,
	  epsg : "EPSG:3857",
	  title : title,
	  contents : '가격: '+sellPay+'원, 수량: '+sellCnt
	            + '<br><span style="font-size: 11px;">'+address+'</span>'
	  ,
	  iconUrl : '//map.vworld.kr/images/ol3/marker_blue.png',
	  text : {
	    offsetX: 0.5, //위치설정
	    offsetY: 300,   //위치설정
	    font: '14px',
	    fill: {color: 'black'},
	    stroke: {color: '#fff', width: 3},
	    text: title
	  }  
	};
	markerLayer.addMarker(vw.ol3.markerOption);
  };
  
  function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) { 
	  function deg2rad(deg) { 
		  return deg * (Math.PI/180) 
	  }
	  var R = 6371; // Radius of the earth in km 
	  var dLat = deg2rad(lat2-lat1); // deg2rad below 
	  var dLon = deg2rad(lng2-lng1); 
	  var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
	  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	  var d = R * c; // Distance in km 
	return d; 
  }
});
</script>
<script type="text/javascript">

 </script>