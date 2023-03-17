<%-- 작성자 : 신정은
	작성날짜 : 2023-02-20 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%@include file="/WEB-INF/views/fragments/header.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/image.js"></script>

</head>
<style>
.box {
	width: 200px;
	border: 1px solid #77aaff;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
}

.box:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #77aaff;
	border-radius: 10px;
}

#chooseFile {
	visibility: hidden;
}

label>img {
	margin-top: 100px;
	border-radius: 50%;
}

#headerFirst {
	background: linear-gradient(135deg, #360940 10%, #782748 100%);
}

.otiFsize {
	font-size: 15px !important;
}

</style>
<body>
	<%@include file="/WEB-INF/views/fragments/top.jsp"%>
	<%@include file="/WEB-INF/views/fragments/sidebar.jsp"%>
	<!-- Page-body start -->
	<div class="page-body">
		<div class="row">
			<!-- *********** -->
			<c:if test="${member.memberType eq 'ROLE_CLIENT'}">
				<div class="col-7">
			</c:if>
			<c:if test="${member.memberType ne 'ROLE_CLIENT'}">
				<div class="col-12">
			</c:if>
			<div class="card" style="height: 660px;">
				<div class="card-header">
					<h5 style="font-weight: bold;">나의 정보</h5>
				</div>
				<div class="row">
					<div class="col-4"
						style="justify-content: center; text-align: center;">
						<div class="mb-2">
							<div class="container">
								<div class="image-upload" id="image-upload">
									<form method="post" enctype="multipart/form-data" id="profile">
										<div class="button">
											<label for="chooseFile" id="newImg"> <c:if
													test="${member.fileData eq null}">
													<img id="defaultImage" src="/resources/oti_images/user.png"
														style="width: 230px; height: 230px; align-content: center;">
												</c:if> <c:if
													test="${member.fileData ne null and (member.memberType ne 'ROLE_CLIENT')}">
													<img id="defaultImage"
														src='<c:url value="/member/profile/${member.memberId}"/>'
														style="width: 300px; height: 300px; align-content: center;">
												</c:if> <c:if
													test="${(member.fileData ne null) and (member.memberType eq 'ROLE_CLIENT')}">
													<img id="defaultImage"
														src='<c:url value="/member/profile/${member.memberId}"/>'
														style="width: 230px; height: 230px; align-content: center;">
												</c:if>
											</label>
										</div>
										<input type="file" id="chooseFile" name="chooseFile"
											accept="image/*"
											onchange="loadFile(this, '${member.memberId}')">
									</form>
								</div>
								<span style="color: gray" id="addImg">프로필 사진을 등록해주세요.</span>
							</div>
						</div>
					</div>
					<c:if test="${member.memberType eq 'ROLE_CLIENT'}">
						<div class="col-7 card-block">
					</c:if>
					<c:if test="${member.memberType ne 'ROLE_CLIENT'}">
						<div class="col-8 card-block">
					</c:if>
					<form class="form-material" enctype="multipart/form-data"
						id="myinfo" action="<c:url value='/member/myinfo'/>" method="post">
						<div class="form-group row otiFsize">
							<div class="col-sm-2 px-0 font-weight-bold">이름</div>
							<div class="col-sm-10">${member.flnm}</div>
						</div>
						<div class="form-group row otiFsize">
							<div class="col-sm-2 px-0 font-weight-bold">아이디</div>
							<div class="col-sm-10">${member.memberId}</div>
						</div>
						<input name="memberId" type="hidden" value="${member.memberId}" />

						<div class="form-group form-default otiFsize" style="padding-rigth:50px;">
							<div class="col-sm-2 px-0 font-weight-bold">비밀번호</div>
							<input type="password" name="pswd" class="col-sm-10 form-control form-ba"
								required="" value="${member.pswd}"> 
						</div>
						<div class="form-group form-default otiFsize">
							<div class="col-sm-2 px-0 font-weight-bold">전화번호</div>
							<input type="text" name="telNo" class="col-sm-10 form-control form-bar" required=""
								value="${member.telNo }">
						</div>
						<div class="form-group form-default otiFsize">
							<div class="col-sm-8 px-0 font-weight-bold"><span>이메일 (exa@gmail.com)</span></div>
							<input type="text" name="eml" class="col-sm-10 form-control form-bar" required=""
								value="${member.eml}">
						</div>
						<div class="form-group form-default otiFsize">
							<div class="col-sm-2 px-0 font-weight-bold">주소</div>
							<input type="text" name="addr" id="address_kakao"
								class="col-sm-10 form-control form-bar" required="" value="${member.addr}">
						</div>
						<div class="form-group form-default" style="padding-top: 20px;">
							<input value="${inst.instDetailAddr}" class="form-control"
								type="text" name="addrDetail" placeholder="상세주소"> <span
								class="form-bar"  value="${member.addrDetail}"></span>
						</div>
						<c:if test="${member.memberType eq 'ROLE_CLIENT'}">
							<div class="form-group form-default otiFsize row">
								<div class="col-sm-2 px-0 font-weight-bold">기관 소속</div>
								<input type="text" name="instNm" class="col-sm-6 form-control form-bar"
									required="" value="${member.institution.instNm}">

								<div class="btn-group dropright col-sm-4">
									<a href="<c:url value='/institution/add'/>" type="button"
										class="btn btn-oti btn-sm ml-2"> 기관 등록 </a>
								</div>
							</div>
						</c:if>
						<c:if test="${member.memberType ne 'ROLE_CLIENT'}">
							<div class="form-group form-default otiFsize" style="display: flex;">
								<div class="col-sm-2 px-0 font-weight-bold">부서</div>
								<div class="col-sm-10">${member.department.deptNm}</div>
							</div>

							<div class="form-group form-default otiFsize" style="display: flex;">
								<div class="col-sm-2 px-0 font-weight-bold">직급</div>
								<div class="col-sm-10">${member.jobGrade.jbgdNm}</div>
							</div>
						</c:if>
					</form>
					<div class="d-flex">
						<button type="submit" form="myinfo" class="btn btn-sm btn-oti"
							style="margin-left: 160px;">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${member.memberType eq 'ROLE_CLIENT'}">
		<div class="col-5">
			<div class="card" style="height: 660px;">
				<div class="card-header" id="headerFirst">
					<h5 style="font-weight: bold;">나의 기관</h5>
				</div>
				<div class="col-10 card-block otiFsize"
					style="margin-top: 10px; padding: 50px;">
					<form method="post" action="<c:url value='/institution/update'/>"
						id="myInstForm" class="form-material">
						<div class="form-group form-default">
							<input type="hidden" value="${inst.instCd}" name="instCd">
							<input value="${inst.instNm}" type="text" name="InstNm"
								class="form-control" required style="width: 70%"> <span
								class="form-bar"></span> <label class="float-label">기업명</label>
						</div>
						<div class="form-group form-default" style="padding-top: 20px;">
							<input value="${inst.instTelno}" type="text" name="InstTelno"
								class="form-control" required="" style="width: 50%"> <span
								class="form-bar"></span> <label class="float-label"
								style="padding-top: 20px;">대표 번호</label>
						</div>
						<div class="form-group form-default" style="padding-top: 20px;">
							<input type="text" name="InstAddr" id="address_kakao1" style="width: 100%"
								class="form-control" required value="${inst.instAddr}">
							<label class="float-label" style="padding-top: 20px;">주소</label>
						</div>
						<div class="form-group form-default" style="padding-top: 20px;">
							<input value="${inst.instDetailAddr}" class="form-control"
								type="text" name="InstAddr" placeholder="상세주소"> <span
								class="form-bar"></span>
						</div>
					</form>
					<div class="d-flex" style="padding-top: 108px;">
						<button type="submit" form="myInstForm" class="btn btn-sm btn-oti">수정</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- *********** -->
	<!-- Page-body end -->
	<%@include file="/WEB-INF/views/fragments/bottom.jsp"%>
	<script
		src="${pageContext.request.contextPath}/resources/js/kakaoAddress.js"></script>
</body>
</html>