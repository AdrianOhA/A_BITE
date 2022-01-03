<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="theme-red" ng-controller="settingCtrl" ng-init="init()">
	 <!-- Back to top button -->
  <div class="btn-back_to_top">
    <span class="ti-arrow-up"></span>
  </div>
  <div class="vg-page page-about" id="about">
    <div class="container py-5">
      <div class="row">
        <div class="col-lg-3 py-3">
          <div class="img-place wow fadeInUp">
            <img src="${SETTING_INFO.USER_IMAGE}" alt="" style="width: 300px;height: 375px;">
          </div>
        </div>
        <div class="col-lg-6 offset-lg-1 wow fadeInRight">
          <div ng-show="toggle_flag == false">
          	<h1 class="fw-light">${SETTING_INFO.USER_NAME}</h1>
          	<h5 class="fg-theme mb-3">${SETTING_INFO.USER_ID}</h5>
          	<p class="text-muted">
				<c:choose>
			 		<c:when test="${empty SETTING_INFO.USER_INFO or SETTING_INFO.USER_INFO eq ''}">
			 			소개를 해주세요
			 		</c:when>
			 		<c:otherwise>
			 			${SETTING_INFO.USER_INFO}
			 		</c:otherwise>
				</c:choose> 
			</p>
          </div>
          <div ng-show="toggle_flag != false">
	          <div class="input-group fw-light">
				 <input type="text" class="form-control form" placeholder="${SETTING_INFO.USER_NAME}" style="max-width: 300px;">
				 <div class="input-group-append">
					<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
				 </div>
			  </div>
	          <div class="input-group margin-top-15 fg-theme" >
				 <h5 class="fg-theme mb-3">${SETTING_INFO.USER_ID}</h5>
			  </div>
			  <div class="input-group text-muted">
			  	<textarea rows="11" cols="100" placeholder="소개" class="form-control form" style="padding: 10px 10px;">${SETTING_INFO.USER_INFO}</textarea>
			     <div class="input-group-append">
					<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
				 </div> 
			  </div>
	          <input type="hidden" name="lat"/>
	          <input type="hidden" name="lng"/>
          </div>
        </div>
        <div class="col-lg-1">
        	<i class="fa fa-pencil-square-o" aria-hidden="true" style="cursor: pointer;" ng-click="edit_toggle()"></i>
        	<i class="fa fa-check" aria-hidden="true"  style="cursor: pointer;" ></i>
        </div>
      </div>
    </div>
    <div class="container py-5">
      <h1 class="text-center fw-normal wow fadeIn">카테고리</h1>
      <div class="row py-3">
        <c:forEach var="category" items="${SETTING_INFO.CATEGORY_PERCENTS}" varStatus="status">
        	<c:choose>
        		<c:when test="${status.index % 4 == 0}">
        			<div class="col-md-6">
        				<div class="px-lg-3">
				            <div class="progress-wrapper wow fadeInUp">
				              <span class="caption">${category.CATEGORY}</span>
				              <div class="progress">
				                <div class="progress-bar" role="progressbar" style="width: ${category.PERCENT}%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">${category.PERCENT}</div>
				              </div>
				            </div>
				        </div>
			 		</div>		
        		</c:when>
        		<c:otherwise>
       				<div class="col-md-6">
        				<div class="px-lg-3">
				            <div class="progress-wrapper wow fadeInUp">
				              <span class="caption">${category.CATEGORY}</span>
				              <div class="progress">
				                <div class="progress-bar" role="progressbar" style="width: ${category.PERCENT}%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"> ${category.PERCENT}</div>
				              </div>
				            </div>
				        </div>
			 		</div>		
        		</c:otherwise>
        	</c:choose>
        </c:forEach>
      </div>
    </div>
  <div class="vg-page page-funfact" style="background-image: url(/images/bg_banner.jpg);">
    <div class="container">
      <div class="row section-counter">
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="768" style="color:#fff;">768</h1>
          <span>랭킹</span>
        </div>
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="230" style="color:#fff;">230</h1>
          <span>구매</span>
        </div>
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="97" style="color:#fff;">97</h1>
          <span>판매</span>
        </div>
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="699" style="color:#fff;">699</h1>
          <span>댓글</span>
        </div>
      </div>
    </div>
  </div>
  <!-- Blog -->
  <div class="vg-page page-blog" id="blog">
    <div class="container">
      <div class="text-center">
        <div class="badge badge-subhead wow fadeInUp">POST</div>
      </div>
      <h1 class="text-center fw-normal wow fadeInUp">Latest Post</h1>
      <div class="row post-grid">
        <div class="col-md-6 col-lg-4 wow fadeInUp">
          <div class="card">
            <div class="img-place">
              <img src="/images/work-9.jpg" alt="">
            </div>
            <div class="caption">
              <a href="javascript:void(0)" class="post-category">Technology</a>
              <a href="#" class="post-title">Invision design forward fund</a>
              <span class="post-date"><span class="sr-only">Published on</span> May 22, 2018</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 wow fadeInUp">
          <div class="card">
            <div class="img-place">
              <img src="/images/work-6.jpg" alt="">
            </div>
            <div class="caption">
              <a href="javascript:void(0)" class="post-category">Business</a>
              <a href="#" class="post-title">Announcing a plan for small teams</a>
              <span class="post-date"><span class="sr-only">Published on</span> May 22, 2018</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 wow fadeInUp">
          <div class="card">
            <div class="img-place">
              <img src="/images/work-1.jpg" alt="">
            </div>
            <div class="caption">
              <a href="javascript:void(0)" class="post-category">Design</a>
              <a href="#" class="post-title">5 basic tips for illustrating</a>
              <span class="post-date"><span class="sr-only">Published on</span> May 22, 2018</span>
            </div>
          </div>
        </div>
        <a href="#" class="btn bueno-btn">더보기</a>
      </div>
    </div>
  </div> <!-- End blog -->
  
  <!-- Testimonial -->
  <div class="vg-page page-testimonial">
    <div class="container">
      <h1 class="text-center fw-normal wow fadeInUp">What Clients are Saying</h1>
      <div class="row justify-content-center mt-5 wow fadeInUp">
        <div class="col-md-9">
          <div class="owl-carousel testi-carousel">
            <div class="item">
              <div class="row">
                <div class="col-md-6">
                  <div class="img-place">
                    <img src="/images/testimonials_1.jpg" alt="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="caption">
                    <div class="testi-content">There are many variations of passages of Lorem Ipsum available, but the majority have suffered</div>
                    <div class="testi-info">
                      <div class="thumb-profile">
                        <img src="/images/testimonials_1.jpg" alt="">
                      </div>
                      <div class="tagline">
                        <h5 class="mb-0">Satria Nugraha</h5>
                        <span class="text-muted">CEO Nutshell</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="row">
                <div class="col-md-6">
                  <div class="img-place">
                    <img src="/images/testimonials_2.jpg" alt="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="caption">
                    <div class="testi-content">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Saepe natus expedita ab facilis ut, animi explicabo amet. Voluptatibus possimus iste enim, doloremque, fugiat accusamus nisi optio fugit ratione expedita harum?</div>
                    <div class="testi-info">
                      <div class="thumb-profile">
                        <img src="/images/testimonials_2.jpg" alt="">
                      </div>
                      <div class="tagline">
                        <h5 class="mb-0">Selena Arrini</h5>
                        <span class="text-muted">CEO BigTree</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- End testimonial -->
</div>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller('settingCtrl', function($scope) {
	$scope.init = function() {
		$scope.toggle_flag = false;
		$scope.setEvent();
	};
	
	$scope.setEvent = function() {
		
	};
	
	$scope.save = function(){
		if(checkValidation()){
			/* $.ajax({
	            type: 'POST',
	            url: '/web/saveComment.json',
	            contentType: "application/json; charset=UTF-8",
	            data : JSON.stringify($scope.reply),
	            async: false,
	            success: function(res) {
	            	$scope.reply.CONTENTS = null;
	            	$scope.searchComments();
	            },
	        });	 */
		}
	};
	
	$scope.edit_toggle = function(){
		if($scope.toggle_flag == true) {
			$scope.toggle_flag = false;
		} else{
			$scope.toggle_flag = true;
		}
	};

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