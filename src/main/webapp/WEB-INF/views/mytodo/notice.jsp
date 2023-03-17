<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
<style>
table th{
font-size: 14px !important;
	}
	
table tbody td{
font-size: 13px !important;
	}
</style>

<div class="card">
	<div class="card-header">
		<h5 class="card-header-text">공지사항</h5>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th class="col-1" style="text-align: center;"></th>
				<th class="col-7 text-left">제목</th>
				<th class="col-1">작성자</th>
				<th class="col-3">작성날짜</th>
				<th class="col-3">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noticeList}" var="board" varStatus="status">
				<tr onclick="noticeDetail(${board.bbsNo})">
					<th style="text-align: center;">${nPager.startRowNo + status.index}</th>
					<c:choose>
						<c:when test="${fn:length(board.bbsTtl) > 20}">
							<td id="ttl" class="text-left"><c:out
									value="${fn:substring(board.bbsTtl,0,19)}" />...</td>
						</c:when>
						<c:otherwise>
							<td id="ttl" class="text-left"><c:out
									value="${board.bbsTtl}" /></td>
						</c:otherwise>
					</c:choose>
					<td>${board.wrtNm}</td>
					<td>${board.wrtYmd}</td>
					<td>${board.inqCnt}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 처리 -->
	<%@ include file="/WEB-INF/views/mytodo/mNoticePager.jsp"%>
</div>