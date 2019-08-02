<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:set var="followlist" value="${followlist }" />
    
	<div class="lightbox visible-box">
		<article class="popup-all">


		<div class='container'>

			<div class='row'>
				<div class='col-md-12'>
					<div id='error'></div>
					<table class='table table-condensed'>
						<tbody id='display'>
						<c:if test="${followlist.followvo.size() > 0}">
						<c:forEach var="i" begin="0" end="${followlist.followvo.size()-1 }">
							<tr class="online">
								<td><img src="${pageContext.request.contextPath}/uploads/${followlist.followprofile[i].photoName}"></td>
								<td><div class="main">
										<span class="title">
										<a href="${pageContext.request.contextPath}/${followlist.followprofile[i].userid}/" target="_blank">${followlist.followprofile[i].userid}</a></span><br>
										<span
											title="">${followlist.followprofile[i].introduction}</span>
									</div></td>
								<c:if test="${followlist.followprofile[i].userid ne sessionScope.userid }">	`
								<td id="va-auto"><span id="online" class="isOnline pull-right">${followlist.followcheck[i] }</span><br>
								</td>
							</c:if>
							<c:if test="${followlist.followprofile[i].userid eq sessionScope.userid }">	`
								<td id="va-auto"><span id="online" class="isOnline pull-right"></span><br>
								</td>
							</c:if>
							</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>



			<i id="exit-button" class="fa fa-times"></i>
		</article>
	</div>