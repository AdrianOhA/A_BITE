<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Map" %>
<% Map<String, Object> user_info = (Map<String, Object>) session.getAttribute("USER_INFO"); %>

<style>
.form-control{
	line-height: 0.5;
	font-size: 0.5rem;
	padding: ;
}
.post-details-content .blog-content .post-tag {
	margin-bottom: 0;
}
</style>
<section class="post-news-area section-padding-100-0 mb-70"   ng-controller="postCtrl" ng-init="init()">
    <div class="container">
		<div class="row justify-content-center">
			<span style="display: none;" ng-model="recipe.recipeNo"></span>
            <!-- Post Details Content Area -->
           <div class="col-12 col-lg-4 col-xl-9">
               <div class="post-details-content">
                   <div class="blog-content col-12">
              	   	   <div class="col-xl-12">
					     <div class="img-container animated fadeInUp animate3 form-input">
							<div class="thumbnail-upload">
								<div class="avatar-edit">
									<input type='file' id="recipe-thumbnail" accept=".png, .jpg, .jpeg"/>
									<label for="recipe-thumbnail" id="recipe-imagePreview" style="background-image: url('/images/icon_cooking.png');background-position: 240px 160px;background-size: 150px;background-repeat: no-repeat;"></label>
								</div>
								<div class="avatar-preview"></div>
							</div>
						 </div>
						 <div class="post-meta margin-top-15">
						     <a href="#" class="post-author">제목 
							     <span class="input-group">
						             <input type="text" class="form-control form" placeholder="제목" ng-model="recipe.title">
						             <span class="input-group-append">
						               <span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
						             </span>
					             </span>
				             </a>
				         </div>
	                      
	                     <div class="post-meta margin-top-15" style="margin-bottom:0px;">
	                            <a href="#" class="post-date">판매 가격: 
								<span class="input-group">
									<input type="text" class="form-control form" placeholder="금액" ng-model="recipe.sellPay" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
									<span class="input-group-append">
										<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
									</span>
								</span>
							   </a>
	                           <a href="#" class="post-date">판매 수량: 
								<span class="input-group">
									<input type="text" class="form-control form" placeholder="수량" ng-model="recipe.sellCnt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
									<span class="input-group-append">
										<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
									</span>
								</span>
							   </a>
							    <a href="#" class="post-date" style="margin-left:20px;">태그: 
								<span class="input-group">
									<input type="text" class="form-control" placeholder="예) #꿀맛 #1인분" ng-keypress="tag_press($event)" id="tag" style="max-width:140px;min-width:140px;">
									<span class="input-group-append">
										<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
									</span>
								</span>
							   </a>
							</div>
	                        <span class="btn btn-link btn-info post-tag" id="tag_span" style="text-align: right;margin-top:10px;">{{recipe.tag}}</span>
	                        <div ng-repeat="detail in recipe.details" class="margin-top-15">
				            	<span style="font-weight: 600;color: #757575;">순서.{{detail.seq+1}}</span>
				            	<span style="float: right;color:#000;"><i class="fa fa-plus-circle ingredient ingredient_plus" ng-click="detail_plus(detail.seq)"></i><i class="fa fa-minus-circle ingredient ingredient_minus"  ng-click="detail_minus(detail.seq)"></i></span>
				            	<div>
					            	<textarea rows="3" cols="100" placeholder="레시피 내용" class="form-control form" style="padding: 10px 10px;height:150px;line-height:1rem;" ng-model="detail.contents"></textarea>
					            	<div class="img-recipe-container animated fadeInUp animate3 form-input" style="margin-top: 3px;">
									    <div class="recipe-avatar-upload">
									        <div class="avatar-edit">
									            <input type='file' id="detail-thumbnail_{{detail.seq+1}}" accept=".png, .jpg, .jpeg" onchange="angular.element(this).scope().fileNameChanged(this)"/>
									            <label for="detail-thumbnail_{{detail.seq+1}}" id="detail-imagePreview_{{detail.seq+1}}" style="background-image: url('/images/icon-plus.png');background-position: 345px 140px;background-size: 100px;background-repeat: no-repeat;"></label>
									        </div>
									        <div class="avatar-preview"></div>
									    </div>
								    </div>
				            	</div>
		            	   </div>
		            	  
                       </div>
                   </div>
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
								<img src="<%=user_info.get("USER_IMAGE") %>" alt="">
							</div>
							<p><%=user_info.get("USER_INFO") %></p>
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
	                   	   <li><img src="/images/tray.png" alt="">
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
						   </li>
	                   	   <li><img src="/images/eye.png" alt=""> <span>조회수 ${RECIPE.VIEWS_CNT+1}</span></li>
	                   	   <li></li>
	                   </ul>
	                    
	               </div>
	               <div class="ingredients">
	                   <h5>재료</h5>
	                   
	                   <div class="custom-control">
							<div class="input-group"  ng-repeat='ingredient in recipe.ingredients' ng-class="{'margin-top-15': $index > 0}" style="border-bottom: 2px solid #d6e1e4;padding-bottom:5px;">
							  <span ng-model="ingredient.seq" style="display: none;"></span>
							  <input type="text" class="form-control col-md-3 form" style="padding:0.175rem 0.2rem;" placeholder="{{ingredient.name_ph}}"  ng-model="ingredient.name">
							  <div class="input-group-append">
								<span class="input-group-text" style="padding: 0.175rem 0.15rem;"><i class="fa fa-spoon" aria-hidden="true"></i></span>
							  </div>
							  <input type="text" class="form-control col-md-3 contants_input form" style="padding:0.175rem 0.2rem;" placeholder="{{ingredient.size_ph}}"  ng-model="ingredient.size">
							  <div class="input-group-append">
								<span class="input-group-text" style="padding: 0.175rem 0.15rem;"><i class="fa fa-spoon" aria-hidden="true"></i></span>
							  </div>
							  <span class="center"><i class="fa fa-plus-circle ingredient ingredient_plus"  ng-click="ingredient_plus(ingredient.seq)"></i><i class="fa fa-minus-circle ingredient ingredient_minus" ng-click="ingredient_minus(ingredient.seq)"></i></span>
							</div>
						</div>
	               </div>
                </div>
            </div>
           
        </div>
        <div class="margin-top-15" style="padding-left: 30px;">
        	<span style="font-weight: 600;color: #757575;">소개</span>
        	<div class="input-group">
	       		<textarea rows="20" cols="100" placeholder="요리 소개" class="form-control form" style="padding: 10px 10px;line-height:1rem;" ng-model="recipe.info"></textarea>
          		<div class="input-group-append">
	              	<span class="input-group-text"><i class="fa fa-spoon" aria-hidden="true"></i></span>
	            </div>
            </div>
        </div> 	
     	<div class="margin-top-30 justify-content-center" style="text-align: center;">
	  	    <a href="#" class="btn bueno-btn" ng-click="save_recipe('Y')">저장</a>
		</div>
    </div>
</section>

<script>
"use strict";
var mainApp = window.mainApp || (window.mainApp = angular.module("ABite_App", []));
mainApp.controller("postCtrl", function($scope) {
	$scope.init = function() {
		$scope.tag_flag = false;
		$scope.recipe = {
			userNo : <%= user_info.get("USER_NO") %>,
			recipeNo : 0,
			thumbnail: "",
			title: "",
			tag : "#태그를 #입력해 #주세요",
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
					size_ph: "2장"
				  },{
						seq : 2,
						name : "",
						name_ph : "소금",
						size : "",
						size_ph: "한꼬집"
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
		if(checkValidation()){
			var _saveData = $scope.getSaveData();
			$.ajax({
	            type: 'POST',
	            url: '/web/saveRecipe.json',
	            contentType: "application/json; charset=UTF-8",
	            data: JSON.stringify(_saveData),
	            success: function(res) {
	            	$scope.recipe.recipeNo = res.recipe.recipeNo;
	            	if($scope.recipe.recipeNo > 0) {
	            		if(confirm("등록완료 ><, 조회 화면으로 갈래?")) {
	            			location.href = '/';	
	            		}
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
		if($scope.tag_flag == false ) {
			$scope.recipe.tag = "";
			$scope.tag_flag = true;
		}
		var txt = $("#tag").val();
		$("#tag").removeClass('valid');   
		if(e.keyCode == 13) {
			if($scope.recipe.tag.length <= 22) {
				$scope.recipe.tag += txt + ' ';
				$("#tag").val('');	
			}
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

		_obj.name_ph = $scope.recipe.ingredients[curr_seq].name_ph;
		_obj.size_ph = $scope.recipe.ingredients[curr_seq].size_ph;
		
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
       var finalWidth = 9;
       $(".drop").css("width", "9em");
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
    	$(".form").each(function(){
    		$(this).removeClass('valid');
   			var _val = $(this).val() || "";
   			if (_val == "" || _val == 0) {
   				$(this).addClass('valid');
   				_flag = false;
   			}
   		});
    	
    	if($("#tag_span").text() == '') {
    		$("#tag").addClass('valid');
    	}
    	
    	return _flag;
    }
});
</script>