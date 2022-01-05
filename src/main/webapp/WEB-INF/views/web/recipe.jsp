<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

<section class="post-news-area section-padding-100-0 mb-70"   ng-controller="recipeCtrl" ng-init="init()">
    <div class="container">
        <div class="row justify-content-center">
            <!-- Post Details Content Area -->
           <div class="col-12 col-lg-4 col-xl-9">
               <div class="post-details-content">
              	   <div class="blog-content col-12">
              	   	   <div class="col-xl-12">
             	   	   	   <img src="${RECIPE.THUMBNAIL}" alt="" style="padding-bottom: 60px;height: 490px; flex-shrink: 0;min-width: 100%;min-height: 100%">
	                       <a href="#" class="post-tag">${RECIPE.TAG}</a>
	                       <h4 class="post-title">${RECIPE.TITLE}</h4>
	                       <div class="post-meta mb-50">
	                           <a href="#" class="post-date">가격: ${RECIPE.SELL_PAY}원</a>
	                           <a href="#" class="post-author">남은 수량: ${RECIPE.SELL_CNT}</a>
	                       </div>
                       </div>
                   </div>
                   <c:forEach var="detail" items="${RECIPE.DETAILS}" varStatus="status">
                     <h5 class="mb-30">Step ${detail.SEQ+1}</h5>
                     <p >${detail.CONTENTS} </p>
                     <img src="${detail.IMAGE}" style="height: 400px;width: 100%;" class="mb-30">
                   </c:forEach>
               </div>
               <input type="hidden" ng-value="${RECIPE.RECIPE_NO}" ng-model="recipe.RECIPE_NO"/>
           </div>

           <!-- Sidebar Widget -->
           <div class="col-12 col-sm-9 col-md-6 col-lg-4 col-xl-3">
               <div class="sidebar-area">
                   <!-- Single Widget Area -->
                  <div class="single-widget-area author-widget mb-30">
						<div class="background-pattern bg-img"
							style="background-image: url(/images/pattern2.png);">
							<div class="author-thumbnail">
								<img src="${RECIPE.USER_IMAGE}" alt="">
							</div>
							<p>${RECIPE.TIP}</p>
						</div>
						<div class="social-info">
							<a style="cursor: pointer;" ng-click="recipeLink(recipe.USER_NO, recipe.RECIPE_NO, recipe.SELL_PAY, recipe.SELL_CNT, recipe.TITLE)"><i class="fa fa-comment" aria-hidden="true"></i></a>
							<a style="cursor: pointer;" ng-click="recipeLink(recipe.USER_NO)"><i class="fa fa-user-circle" aria-hidden="true"></i></a>
						</div>
				  </div>
	               <div class="recipe-info">
	                   <h5>정보
	                   <span style="float: right;">
	                   <i class="fa fa-pencil-square-o" aria-hidden="true" style="cursor: pointer;" ng-click="edit_toggle()"></i>
				       <i class="fa fa-check" aria-hidden="true"  style="cursor: pointer;" ></i>
				       </span>
	                   </h5>
	                   <ul class="info-data">
	                   	   <li><img src="/images/tray.png" alt=""> <span>${RECIPE.CATEGORY}</span></li>
	                   	   <li><img src="/images/eye.png" alt=""> <span>${RECIPE.VIEWS_CNT+1} Views</span></li>
	                       <li><img src="/images/alarm-clock.png" alt=""><span>가격: ${RECIPE.SELL_PAY}원 <br>남은 수량: ${RECIPE.SELL_CNT}</span></li>
	                   </ul>
	                    
	               </div>
	               <div class="ingredients">
	                   <h5>Ingredients</h5>
					   <c:forEach var="ingredient" items="${RECIPE.INGREDIENTS}" varStatus="status">
		               	<div class="custom-control ">
	                       <span class="custom-control-label">${ingredient.NAME}/${ingredient.SIZE} </span>
	                   </div>
	                   </c:forEach>
	               </div>
                </div>
            </div>
        </div>
        <div style="">
         	<h6 class="title">한줄 평</h6>
         	<div class="background-pattern bg-img" style="border: 1px solid #e6e6e6e6;border-radius: 5px;line-height: 1.3rem;background: #e6e6e6e6;">${RECIPE.INFO}</div>
        </div> 	
			<div style="">            	
            	<h6 class="title">댓글</h6>
            	<div style="border:1px solid #e6e6e6;padding:30px;padding-left: 10px;border-radius: 5px;border-bottom: 0;" ng-repeat='comment in comments'>
	            	<div>
	            		<img ng-src="{{comment.USER_IMAGE}}" style="height: 30px;width: 30px;border-radius: 50%;vertical-align: middle;">
	            		<span class="title"> {{comment.USER_NAME}}</span> 
	            	<span class="contents" style="padding: 50px;">{{comment.CONTENTS}}</span>
	            	</div>
            	</div>
            	<div class="input-group">
	            	<textarea style="border-radius: 5px;" class="form-control form" placeholder="예) 댓글 내용을 입력하세요" ng-model="reply.CONTENTS"></textarea>
	           	 	<button class="input-group-append" style="cursor: pointer;border:0"  ng-click="saveComment()">
	           	 		<span class="input-group-text  btn bueno-btn" style="height: 100%;">등록</span>
	 			    </button>
 			    </div>
            </div>
    </div>
</section>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller('recipeCtrl', function($scope) {
	$scope.comments = [];
	$scope.reply = {
		RECIPE_NO : '${RECIPE.RECIPE_NO}',
		CONTENTS : null,
		USER_NO : '<%= user_info.get("USER_NO") %>'
	};
	$scope.recipe = {
		recipeNo : '${RECIPE.RECIPE_NO}',
		userNo: '${RECIPE.USER_NO}'
	};
	$scope.init = function() {
		$scope.setEvent();
		$scope.searchComments();
		$scope.saveLookupCount();
	};
	
	$scope.setEvent = function() {
		$(".form-control").focusout(function(){
		   var _val = $(this).val();
		   if (_val != '') {
			   $(this).removeClass('valid');   
		   }
	   });
	};
	
	$scope.searchComments = function() {
		$scope.comments = [];
		$.ajax({
            type: 'POST',
            url: '/web/getComments.json',
            contentType: "application/json; charset=UTF-8",
            data : JSON.stringify($scope.recipe),
            async: false,
            success: function(res) {
            	$scope.comments = res.COMMENTS || [];
            },
        });	
	};
	
	$scope.saveLookupCount = function() {
		$.ajax({
            type: 'POST',
            url: '/web/saveLookupCount.json',
            contentType: "application/json; charset=UTF-8",
            data : JSON.stringify($scope.recipe),
            async: false,
            success: function(res) {
            	
            },
        });	
	};
	
	$scope.saveComment = function(){
		if(checkValidation()){
			$.ajax({
	            type: 'POST',
	            url: '/web/saveComment.json',
	            contentType: "application/json; charset=UTF-8",
	            data : JSON.stringify($scope.reply),
	            async: false,
	            success: function(res) {
	            	$scope.reply.CONTENTS = null;
	            	$scope.searchComments();
	            },
	        });	
		}
	}

    function checkValidation(){
    	var _flag = true;
    	$(".form-control").each(function(){
    		$(this).removeClass('valid');
   			var _val = $(this).val() || "";
   			if (_val == "") {
   				$(this).addClass('valid');
   				_flag = false;
   			}
   		});
    	return _flag;
    }
});
</script>