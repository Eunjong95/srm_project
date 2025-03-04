<%--
	작성자 : 신정은
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- paging 처리 함수 --%>
<script src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<div class="pagination-container">
	<div class="pagination">
		<c:if test="${pager.startPageNo -1 > 0 }">
			<a class="pagination-newer" href="?page=${pager.startPageNo - pager.pagesPerGroup}">PREV</a>
		</c:if>
		<c:if test="${pager.startPageNo -1 <= 0 }">
			<a style="visibility: hidden" class="pagination-newer" href="#">PREV</a>
		</c:if>
		<span class="pagination-inner"> <c:forEach var="num"
				begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
				<c:if test="${pager.pageNo == num }">
					<a class="pagination-active" href="?page=${num}">${num}</a>
				</c:if>
				<c:if test="${pager.pageNo != num }">
					<a href="?page=${num}">${num}</a>
				</c:if>
			</c:forEach>
		</span>
		<c:if test="${pager.endPageNo < pager.totalPageNo }">
			<a class="pagination-older" href="?page=${pager.endPageNo + 1}">NEXT</a>
		</c:if>
		<c:if test="${pager.endPageNo >= pager.totalPageNo }">
			<a style="visibility: hidden" class="pagination-older" href="#">NEXT</a>
		</c:if>
	</div>
</div>
