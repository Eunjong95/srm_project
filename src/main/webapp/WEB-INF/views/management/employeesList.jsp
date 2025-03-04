<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 작성자: 최은종 --%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<%-- 카카오 주소 js --%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/kakaoAddress.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/employeesList.js"></script>

<style>
table, th, td {
	text-align: center;
	line-height: normal;
	font-size: 15px !important;
}

.form-group {
	margin-bottom: 0;
}

p {
	margin: auto;
	font-size: 15px;
}

#headerFirst {
	background: #4C1342;
}

.card .card-header {
	background: linear-gradient(135deg, #360940 10%, #782748 100%);
}
* {
font-size: 15px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<!-- Page-body start -->
	<div class="page-body">
		<div class="row">
			<!-- *********** -->
			<%-- 사원목록  --%>
			<div class="col-xl-8 col-md-12">
				<div class="card"  style="height: 720px; font-size: 15px;">
					<div class="card-header" id="headerFirst">
						<h5 style="font-weight: bold;">사원 관리</h5>
						<div class="card-header-right">
							<ul class="list-unstyled card-option" align="right">
								<li><i class="fa fa fa-wrench open-card-option"></i></li>
								<li><i class="fa fa-window-maximize full-card"></i></li>
								<li><i class="fa fa-refresh reload-card"></i></li>
							</ul>
						</div>
						<%-- 검색 기능 --%>
					</div>
					<div class="card-block"
						style="padding-top: 20px; padding-bottom: 10px;">
						<div class="mr-5">
							<form id="empFilter"
								action="${pageContext.request.contextPath}/admin/employee/list"
								onsubmit="return search()">
								<div class="form-group row">
									<label class="col-sm-1 col-form-label text-right"
										style="font-size: 14;">이름</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" name="flnm"
											value="${flnm}">
									</div>
									<label class="col-sm-1 col-form-label text-right"
										style="font-size: 14;">부서</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" name="deptNm"
											value="${deptNm}">
									</div>
									<label class="col-sm-1 col-form-label text-right"
										style="font-size: 14;">직급</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" name="jbgdNm"
											value="${jbgdNm}">
									</div>
									<div class="col-sm-3 d-flex justify-content-end">
										<button type="submit"
											class="btn btn-oti waves-effect waves-light">검색</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="card-block table-border-style p-0">
						<div class="table-responsive">
							<table class="table table-hover" style="font-size: 15px;">
								<thead>
									<tr>
										<th>번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>부서</th>
										<th>직급</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<%-- 
																		수정:안한길 
																		수정일:23.02.20.
																		내용:사원목록 jstl적용
																	 --%>
									<c:if test="${pager.totalRows ne 0}">
										<c:forEach var="employee" items="${employeesList}"
											varStatus="empStatus">
											<tr id="${employee.memberId}Row"
												onclick="getEmployee('${employee.memberId}')">
												<th scope="row">${empStatus.count}</th>
												<td>${employee.memberId }</td>
												<td>${employee.flnm }</td>
												<td id="${employee.memberId}Dept">${employee.department.deptNm }</td>
												<td id="${employee.memberId}Jbgd">${employee.jobGrade.jbgdNm }</td>
												<td>${employee.eml }</td>
											</tr>
										</c:forEach>

									</c:if>
									<c:if test="${pager.totalRows eq 0}">
										<tr>
											<td colSpan="6">검색 결과가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<%@include file="/WEB-INF/views/fragments/pagination.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<%-- 사원 목록 끝--%>
			<c:if test="${pager.totalRows ne 0}">
				<%-- 사원 상세조회 카드--%>
				<div class="col-xl-4 col-md-12">
					<div class="card">
						<div class="card-header">
							<h5 style="font-weight: bold;">사원 정보</h5>
						</div>
						<div class="card-block"
							style="justify-content: center; text-align: center;">
							<div class="my-2" id="eimg">
								<img 
									src="${pageContext.request.contextPath}/member/img/${employeesList[0].memberId}"
									style="height: 200px; width: 200px; align-content: center;">
							</div>
						</div>
						<div class="card-block">
							<form class="form-material">
								<div class="form-group row">
									<p class="col-sm-3 font-weight-bold">아이디</p>
									<div class="col-sm-9" id="MEmployeeId">${employeesList[0].memberId}</div>
								</div>
								<div class="form-group row">
									<p class="col-sm-3 font-weight-bold pt-3">이름</p>
									<div class="col-sm-9 pt-3" id="MEmployeeName">${employeesList[0].flnm }</div>
								</div>
								<div class="form-group form-default row">
									<p class="col-sm-3 font-weight-bold pt-3">전화번호</p>
									<div class="col-sm-9 pt-3" id="MEmployeeTel">
										${employeesList[0].telNo }</div>
								</div>
								<div class="form-group form-default row">
									<p class="col-sm-3 font-weight-bold pt-3">이메일</p>
									<div class="col-sm-9 pt-3" id="MEmployeeEmail">
										${employeesList[0].eml }</div>
								</div>
								<div class="form-group form-default row">
									<p class="col-sm-3 font-weight-bold pt-3">주소</p>
									<div class="col-sm-9 pt-3" id="MEmployeeAddr">
										${employeesList[0].addr }</div>
								</div>
								<div class="form-group form-default row">
									<p class="col-sm-3 font-weight-bold pt-3">부서</p>
									<div class="col-sm-9 pt-3" id="MEmployeeDepartment">
										<select name="selectDepartment" class="form-control"
											style="width: 60%">
											<%-- 부서 목록 --%>
											<c:forEach var="department" items="${departmentList}">
												<c:if
													test="${employeesList[0].department.deptNm eq department.deptNm}">
													<option value="${department.deptCd}" selected>${department.deptNm}</option>
												</c:if>
												<c:if
													test="${employeesList[0].department.deptNm ne department.deptNm}">
													<option value="${department.deptCd}">${department.deptNm}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group form-default row">
									<p class="col-sm-3 font-weight-bold">직급</p>
									<div class="col-sm-9" id="MEmployeeJobGrade">
										<select name="selectJobGrade" class="form-control"
											style="width: 60%">
											<c:forEach var="jobGrade" items="${jobGradeList}">
												<%-- 직급 select 태그 --%>
												<c:if
													test="${employeesList[0].jobGrade.jbgdNm eq jobGrade.jbgdNm}">
													<option value="${jobGrade.jbgdCd}" selected>${jobGrade.jbgdNm}</option>
												</c:if>
												<c:if
													test="${employeesList[0].jobGrade.jbgdNm ne jobGrade.jbgdNm}">
													<option value="${jobGrade.jbgdCd}">${jobGrade.jbgdNm}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
							</form>
						</div>
						<div class="card-footer">
							<div align="center">
								<button onclick="updateInfo('${employeesList[0].memberId}')"
									type="button" id="modifyInfo"
									class="btn btn-oti waves-effect waves-light">저장</button>
								<button onclick="deleteInfo('${employeesList[0].memberId}')"
									type="button" id="deleteInfo"
									class="btn btn-oti waves-effect waves-light">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<%-- *********** --%>
	</div>
	<%-- Page-body end --%>
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
</body>
</html>