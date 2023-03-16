<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
<style>

</style>
<div class="card" style="height:450px;">
	<div class="card-header">
		<h5 class="card-header-text">문의사항</h5>
	</div>
	<table class="table table-hover">
			<c:if test="${fn:length(qnaList) == 0 }">
				<div class="text-center d-flex justify-content-center" style="height: 100px;">
					<div style="margin: auto;">문의내역이 없습니다.</div>
				</div>
			</c:if>
			<c:if test="${fn:length(qnaList) gt 0}">
				<thead>
					<tr>
						<th class="col-1" style="text-align: center;"></th>
						<th class="col-5 text-left">제목</th>
						<th class="col-1">작성자</th>
						<th class="col-3">작성날짜</th>
						<th class="col-2">답변상태</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${qnaList}" var="board" varStatus="status">
					<tr onclick="qnaDetail(${board.bbsNo})">
						<th style="text-align: center;">${qPager.startRowNo + status.index}</th>
						<c:choose>
							<c:when test="${fn:length(board.bbsTtl) > 15}">
								<td id="ttl" class="text-left"><c:out
										value="${fn:substring(board.bbsTtl,0,14)}" />...</td>
							</c:when>
							<c:otherwise>
								<td id="ttl" class="text-left"><c:out
										value="${board.bbsTtl}" /></td>
							</c:otherwise>
						</c:choose>
						<td>${board.wrtNm}</td>
						<td>${board.wrtYmd}</td>
						<c:if test="${board.ansYn == false}">
							<td class="text-center">미답변</td>
						</c:if>
						<c:if test="${board.ansYn == true}">
							<td class="text-center">답변완료</td>
						</c:if>
					</tr>
				</c:forEach>
		</c:if>
		</tbody>
	</table>
	<!-- 페이징 처리 -->
	<br/>
	<%@ include file="/WEB-INF/views/mytodo/mQnaPager.jsp"%>
</div>