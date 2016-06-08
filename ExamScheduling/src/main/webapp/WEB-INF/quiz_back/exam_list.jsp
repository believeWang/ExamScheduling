<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試列表</title>

<!-- 自訂 -->
<link rel="stylesheet" type="text/css" href="exam_resourse/css/examstyle.min.css" />
<%@ include file="../cdn.file" %>
<%@ include file="../header/slide_mqtt.file" %>
</head>
<body>
<%@ include file="../header/slidenav.jsp" %>
  <!-- START CONTENT -->
      <section id="content">
               

        <!--start container-->
        <div class="container">
          <div class="section">
          	<div id="products" class="row">
						<div class="product-sizer"></div>
<!--             statr products list -->
				<c:forEach var="examEntry" items="${applicationScope.allExams}"
 					varStatus="counter">
				
						<div id="${examEntry.key}" class="product">
							<div class="card">
								<div class="card-image waves-effect waves-block waves-light">
									
									<c:choose>
										<c:when test='${not empty applicationScope.examsMap[examEntry.key]}'>
										<img class="activator" src="${applicationScope.examsMap[examEntry.key]}"
											alt="${examEntry.key}">
										</c:when>
										
										<c:otherwise>
											<img class="activator" src="exam_resourse/images/examImg.png"
										alt="${examEntry.key}">
										</c:otherwise>
									</c:choose>




								</div>
								<ul class="card-action-buttons">
									<li><a href="ExamEdit?editno=${examEntry.value.examno}"
										class="btn-floating waves-effect waves-light green accent-4"> <i class="large material-icons">mode_edit</i></a></li>
									
									<li><a 
										class="btn-floating waves-effect waves-light red accent-2" onClick='deleteExam("${examEntry.value.examno}")'> <i class="large material-icons ">delete</i></a></li>
								</ul>
								<div class="card-content">

									<div class="row">
										<div class="col s8">
											<p class="card-title grey-text text-darken-4">
												<a href="#" class="grey-text text-darken-4">${examEntry.value.examTitle}</a>
											</p>
										</div>
									
									</div>
									

								</div>
								<div class="card-reveal">
										<span class="card-title grey-text text-darken-4">${examEntry.value.examTitle}<i class="material-icons right">close</i>
										</span>
										<label>考試編號:${examEntry.value.examno}</label><br/>
										<label>考題數量:${examEntry.value.quantities}</label><br/>
										<label>考試時間:${examEntry.value.duration}分鐘</label><br/>
										
									
										
									</div>
								
							</div>
						</div>
</c:forEach>






					</div>

				

			
            <!--/ end items list -->
          </div>
          
          <!-- Floating Action Button -->
            <div class="fixed-action-btn" style="bottom: 50px; right: 19px;">
                <a href="ExamEdit" class="btn-floating btn-large">
                  <i class="small material-icons">add</i>
                </a>
              
            </div>
            <!-- Floating Action Button -->
        </div>
        <!--end container-->
      </section>
<!-- masonry -->
<script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
<script type="text/javascript">
    /*
    * Masonry container for eCommerce page
    */
    var $containerProducts = $("#products");
  
      $containerProducts.masonry({
        itemSelector: ".product",
        columnWidth: ".product-sizer",
      });
   
      
      
     
 </script>
</body>
<script src="exam_resourse/js/examlistjs.js"></script>
</html>