<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

<div class="catagory-post-area section-padding-100"  ng-controller="postCtrl" ng-init="init()">
    <div class="container">
        <div class="row justify-content-center">
            <!-- Post Area -->
            <div class="col-12 col-lg-8 col-xl-12 chk_after">
           	   <div class="tim-container">
			      <div class="title">
			        <h5>
			          <i class="fa fa-plus-square" aria-hidden="true"></i> <span class="note">요리</span> 등록하기
		              <span style="display: none;" ng-model="recipe.recipeNo"></span>  
		            </h5>
			      </div>
			    </div>
			    <div class="container-fluid">
			      <div class="row">
				    <div class="col-lg-6">
			  		    <div class="margin-top-15"><h6><span class="note title">요리</span> 썸네일</h6></div>
			  		 	<div class="input-group">
			              <div class="img-container animated fadeInUp animate3 form-input">
						    <div class="avatar-upload">
						        <div class="avatar-edit">
						            <input type='file' id="recipe-thumbnail" accept=".png, .jpg, .jpeg"/>
						            <label for="recipe-thumbnail" id="recipe-imagePreview" style="background-image: url('/images/icon_cooking.png');background-position: 110px 35px;background-size: 150px;background-repeat: no-repeat;"></label>
						        </div>
						        <div class="avatar-preview"></div>
						    </div>
						 </div>
		               </div>    
			  		 </div>
			    
			       <div class="col-lg-6">
					    <div class="col-lg-5">
		            		<div class="margin-top-15"><h6><span class="note title">요리</span> 제목</h6></div>
		            		<div class="input-group">
				              <input type="text" class="form-control" placeholder="제목" ng-model="recipe.title">
				              <div class="input-group-append">
				                <span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
				              </div>
				            </div>
			            </div>
					   
						<div class="col-lg-7">
						  <div class="margin-top-15"><h6><span class="note title">요리</span> 태그</h6></div>
					  		 <div class="input-group">
				              <input type="text" class="form-control" placeholder="예) #꿀맛 #1인분" ng-keypress="tag_press($event)" id="tag" style="max-width:140px;min-width:140px;">
				              <div class="input-group-append">
				                <span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
				              </div>
				              <span class="btn btn-link btn-info">{{recipe.tag}}</span>
				            </div>
						 </div>
						  <div class="col-lg-5">
			            	<div class="margin-top-15"><h6><span class="note title">요리</span> 카테고리</h6></div>
			            	<div class="drop">
					  	 		<c:forEach var="category" items="${CATEGORY_LIST}" varStatus="status">
					  	 			<c:choose>
					  	 				<c:when test="${status.index == 0}">
					  	 					<div class="option active placeholder" data-value="${category.CODE_CD}" ng-click="set_category('${category.CODE_CD}')"  >${category.CODE_NM}</div>
					  	 				</c:when>
					  	 				<c:otherwise>
					  	 					<div class="option" data-value="${category.CODE_CD}"  ng-click="set_category('${category.CODE_CD}')">${category.CODE_NM}</div>	
					  	 				</c:otherwise>
					  	 			</c:choose>
					  	 		</c:forEach>
							</div>
						</div>
		            </div>
			  		 
		  		 </div>
		  		</div> 
		  		<div class="container-fluid">
				  <div class="row">
					 <div class="col-lg-6">
						<div class="margin-top-15"><h6><span class="note title">요리</span> 재료</h6></div>
						<div class="input-group"  ng-repeat='ingredient in recipe.ingredients' ng-class="{'margin-top-15': $index > 0}">
						  <span ng-model="ingredient.seq" style="display: none;"></span>
						  <input type="text" class="form-control col-md-3" placeholder="예) 돼지고기"  ng-model="ingredient.name">
						  <div class="input-group-append">
							<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
						  </div>
						  <input type="text" class="form-control col-md-3 contants_input" placeholder="예) 100g"  ng-model="ingredient.size">
						  <div class="input-group-append">
							<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
						  </div>
						  <span class="center"><i class="fa fa-plus-circle ingredient ingredient_plus"  ng-click="ingredient_plus(ingredient.seq)"></i><i class="fa fa-minus-circle ingredient ingredient_minus" ng-click="ingredient_minus(ingredient.seq)"></i></span>
						</div>
					 </div>
					<div class="col-lg-6">
						<div class="col-lg-5">
							<div class="margin-top-15"><h6><span class="note title">판매</span> 수량</h6></div>
							<div class="input-group">
							  <input type="text" class="form-control" placeholder="수량" ng-model="recipe.sellCnt">
							  <div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
							  </div>
							</div>
						</div>
						 <div class="col-lg-5">
							<div class="margin-top-15"><h6><span class="note title">판매</span> 금액</h6></div>
							<div class="input-group">
							  <input type="text" class="form-control" placeholder="금액" ng-model="recipe.sellPay">
							  <div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
							  </div>
							</div>
						</div>
					</div>
					 
				 </div>
				</div> 
		  		 <div class="col-12 col-lg-12 col-sm-4">
	            	<div class="margin-top-15">
	            		<h6><span class="note title">요리</span> 순서</h6>
	            	</div>
	            	<div ng-repeat="detail in recipe.details">
		            	<span style="font-weight: 600;color: #757575;">Step.{{detail.seq+1}}</span>
		            	<div class="input-group">
		            		<textarea rows="3" cols="100" placeholder="소개" class="form-control" style="padding: 10px 10px;" ng-model="detail.contents"></textarea>
		            		<div class="input-group-append">
			                	<div class="img-recipe-container animated fadeInUp animate3 form-input">
								    <div class="recipe-avatar-upload">
								        <div class="avatar-edit">
								            <input type='file' id="detail-thumbnail_{{detail.seq+1}}" accept=".png, .jpg, .jpeg" onchange="angular.element(this).scope().fileNameChanged(this)"/>
								            <label for="detail-thumbnail_{{detail.seq+1}}" id="detail-imagePreview_{{detail.seq+1}}" style="background-image: url('/images/icon-plus.png');background-position: 40px 35px;background-size: 100px;background-repeat: no-repeat;"></label>
								        </div>
								        <div class="avatar-preview"></div>
								    </div>
							    </div>
							</div>
		            	</div>
		            	<span style="float: right;margin-right: -20px;"><i class="fa fa-plus-circle ingredient ingredient_plus" ng-click="detail_plus(detail.seq)"></i><i class="fa fa-minus-circle ingredient ingredient_minus"  ng-click="detail_minus(detail.seq)"></i></span>
	            	</div>
	            </div>	
		  		<div class="col-12 col-md-8 col-sm-4">
	            	<div class="margin-top-15"><h6><span class="note title">요리</span> 팁</h6></div>
	            	<div class="input-group">
	            		<textarea rows="3" cols="100" placeholder="팁" class="form-control" style="padding: 10px 10px;" ng-model="recipe.tip"></textarea>
	            		<div class="input-group-append">
		                	<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
		                </div>
	            	</div>
		  		</div>
		  		<div class="col-12 col-md-8 col-sm-4">
	            	<div class="margin-top-15"><h6><span class="note title">요리</span> 소개</h6></div>
	            	<div class="input-group">
	            		<textarea rows="3" cols="100" placeholder="소개" class="form-control" style="padding: 10px 10px;" ng-model="recipe.info"></textarea>
	            		<div class="input-group-append">
		                	<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
		                </div>
	            	</div>
		  		</div>
		  		
		  	 </div>
		  	 <div class="margin-top-30 justify-content-center">
		  	 	<a href="#" class="btn bueno-btn" ng-click="save_recipe('N')">저장</a>
		  	 	<a href="#" class="btn bueno-btn" ng-click="save_recipe('Y')">저장 후 공개</a>
		  	 </div>
		  	 
        </div>
    </div>
</div>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller("postCtrl", function($scope) {
	$scope.init = function() {
		$scope.recipe = {
			userNo : <%= user_info.get("USER_NO") %>,
			recipeNo : 0,
			thumbnail: "",
			title: "",
			tag : "",
			category : "CT_01",
			openYN: "N",
			sellCnt: 0,
			sellPay: 0,
			ingredients: [{
				seq : 0,
				name : "",
				name_ph : "돼지고기",
				size : "",
				size_ph: "150g"
			  },{
					seq : 1,
					name : "",
					name_ph : "상추",
					size : "",
					size_ph: "30g"
				  },{
						seq : 2,
						name : "",
						name_ph : "소금",
						size : ""
					  }],
			details : [{
				seq : 0,
				contents : "",
				image: ""
			  },
			  {
					seq : 1,
					contents : "",
					image: ""
				  },
				  {
						seq : 2,
						contents : "",
						image: ""
					  }	  
			  
			],
			tip : "",
			info : ""
		};
		$scope.setEvent();
	};
	
	$scope.setEvent = function() {
		$(".drop .option").click(function () {
		    var val = $(this).attr("data-value"),
		      $drop = $(".drop"),
		      prevActive = $(".drop .option.active").attr("data-value"),
		      options = $(".drop .option").length;
		    $drop.find(".option.active").addClass("mini-hack");
		    $drop.toggleClass("visible");
		    $drop.removeClass("withBG");
		    $(this).css("top");
		    $drop.toggleClass("opacity");
		    $(".mini-hack").removeClass("mini-hack");
		    if ($drop.hasClass("visible")) {
		      setTimeout(function () {
		        $drop.addClass("withBG");
		      }, 400 + options * 100);
		    }
		    triggerAnimation();
		    if (val !== "placeholder" || prevActive === "placeholder") {
		      $(".drop .option").removeClass("active");
		      $(this).addClass("active");
		    }
		  });
	   $("#recipe-thumbnail").change(function() {
		   read_thumbnailURL(this);
       });
	   
	   $(".form-control").focusout(function(){
		   var _val = $(this).val();
		   if (_val != '') {
			   $(this).removeClass('valid');   
		   }
	   });
	};
	
	$scope.save_recipe = function(openYN) {
		var _openFlag = openYN || 'N';
		$scope.recipe.openYN = _openFlag;
		var _saveData = $scope.getSaveData();
		
		if(checkValidation()){
			$.ajax({
	            type: 'POST',
	            url: '/web/saveRecipe.json',
	            contentType: "application/json; charset=UTF-8",
	            data: JSON.stringify(_saveData),
	            success: function(res) {
	            	$scope.recipe.recipeNo = res.recipe.recipeNo;
	            	if($scope.recipe.recipeNo > 0) {
	            		console.log("성공!")
	            	} else {
	            		console.log("실패애애")
	            	}
	            },
	        });
		}
	}
	
	$scope.getSaveData = function (){
		$scope.recipe = $.extend($scope.recipe, $scope.getRecipeThumbfile());
		
		for(var i = 0; i < $scope.recipe.details.length; i++){
			var _detail = $scope.recipe.details[i];
			_detail =$.extend(_detail,  $scope.getDetailImageFile(_detail.seq))
		}   
		return $scope.recipe;
	}
	
	$scope.getDetailImageFile = function(seq){
		var id = seq+1;
		var images = $("#detail-imagePreview_"+ id).css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
    	
    	var ext = images.match(/^(data:image\/)(png|jpg|jpeg)/g)[0];
    	ext = ext.split("/")[1];
    	
    	var obj = {
    		encodedImg : images,
    		ext: ext,
    		target : "detail",
    		no : $scope.recipe.recipeNo,
    		seq: seq
    	}
    	
    	return obj;
	}
	
	
    $scope.getRecipeThumbfile = function(){
    	var images = $("#recipe-imagePreview").css("background-image").replace(/^url\(['"](.+)['"]\)/, '$1');
    	
    	var ext = images.match(/^(data:image\/)(png|jpg|jpeg)/g)[0];
    	ext = ext.split("/")[1];
    	
    	var obj = {
    		encodedImg : images,
    		ext: ext,
    		target : "recipe",
    		no : $scope.recipe.recipeNo
    	}
    	
    	return obj;
    }
	
	$scope.set_category = function(category_cd) {
		$scope.recipe.category = category_cd;
	}
	
	$scope.tag_press = function(e){
		var txt = $("#tag").val();
		if(e.keyCode == 13) {
			$scope.recipe.tag += txt + ',';
			$("#tag").val('');
			$scope.recipe.tag = $scope.recipe.tag.substring(0, $scope.recipe.tag.length-1);
		}
	}
	
	$scope.detail_plus = function(curr_seq){
		var nex_seq = curr_seq+1;
		var _obj = {
		 	seq : nex_seq,	
		 	contents : "",
			image: ""
		}
		$scope.recipe.details.splice(nex_seq, 0, _obj);
		$scope.recipe.details.filter(function(obj, idx){
			obj.seq = idx;
		}); 
	};
	
	$scope.detail_minus = function(seq){
		if($scope.recipe.details.length != 1) {
			$scope.recipe.details.splice(seq, 1);  // 대상 제거
			$scope.recipe.details.filter(function(obj){
				if(obj.seq > seq) {
					obj.seq -= 1;  
				}
			});	
		} 
	};
	
	$scope.ingredient_plus = function(curr_seq){
		var nex_seq = curr_seq+1;
		var _obj = {
		 	seq : nex_seq,	
		 	contents : "",
			image: ""
		}
		$scope.recipe.ingredients.splice(nex_seq, 0, _obj);
		$scope.recipe.ingredients.filter(function(obj, idx){
			obj.seq = idx;
		}); 
	};
	
	$scope.ingredient_minus = function(seq){
		if($scope.recipe.ingredients.length != 1) {
			$scope.recipe.ingredients.splice(seq, 1);  // 대상 제거
			$scope.recipe.ingredients.filter(function(obj){
				if(obj.seq > seq) {
					obj.seq -= 1;  
				}
			});	
		} 
	};
	 $scope.fileNameChanged = function(input) {
    	var target = $(input).parent().find('label').attr('id');
    	if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
            	$('#'+target).css({
               		'background-image': 'url('+e.target.result +')',
               		'background-size' : 'cover',
               		'background-position': 'center'
               	});
                $('#'+target).hide();
                $('#'+target).fadeIn(100);
            }
            reader.readAsDataURL(input.files[0]);
        }
    };
	
    function triggerAnimation() {
       var finalWidth = $(".drop").hasClass("visible") ? 22 : 20;
       $(".drop").css("width", "24em");
       setTimeout(function () {
      	$(".drop").css("width", finalWidth + "em");
       }, 400);
  	}
    
    function read_thumbnailURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#recipe-imagePreview').css({
                		'background-image': 'url('+e.target.result +')',
                		'background-size' : 'cover',
                		'background-position': 'center'
                	});
                $('#recipe-imagePreview').hide();
                $('#recipe-imagePreview').fadeIn(100);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    function checkValidation(){
    	var _flag = true;
    	$(".form-control").each(function(){
    		$(this).removeClass('valid');
   			var _val = $(this).val() || "";
   			if (_val == "" || _val == 0) {
   				$(this).addClass('valid');
   				_flag = false;
   			}
   		});
    	return _flag;
    }
});
</script>