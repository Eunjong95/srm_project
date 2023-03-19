<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card_body" id="sddetail"
	style="font-size: 14px; padding-top: 20px;">
	<div class="form-group row">
		<div class="col col-sm-2 px-0 font-weight-bold">요청번호</div>
		<div class="col col-sm-9">
			<div type="text" class="dmndNo font-weight-bold"
				style="font-size: 12px; width: 325px;">${sd.dmndNo}</div>
		</div>
	</div>
	<hr />
	<div class="form-group row">
		<div class="col col-sm-2 font-weight-bold px-0 ">SR 제목</div>
		<div class="col col-sm-9">
			<div type="text" class="ttl" style="width: 325px;">${sd.ttl}</div>
		</div>
	</div>
	<hr />
	<div class="form-group row">
		<div class="col col-sm-2 font-weight-bold px-0">관련 근거</div>
		<div class="col col-sm-9">
			<textarea class="relGrund" style="width: 100%;" readonly>${sd.relGrund}</textarea>
		</div>
	</div>
	<hr />
	<div class="form-group row">
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">시스템구분</div>
			<div class="col col-sm-8 sysNm pr-0">${sd.sysNm}</div>
		</div>
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">업무구분</div>
			<div class="col col-sm-8 taskSeNm">${sd.taskSeNm}</div>
		</div>
	</div>
	<hr />
	<div class="form-group row">
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">요청기관</div>
			<div class="col col-sm-8 instNm pr-0">${sd.instNm}</div>

		</div>
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">요청자</div>
			<div class="col col-sm-8 dropdown dropdown open clientNm">${sd.clientNm}</div>
		</div>
	</div>
	<hr />
	<div class="form-group row">
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">요청일</div>
			<div class="col col-sm-8 dmndYmd">${sd.dmndYmd}</div>
		</div>
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">완료요청일</div>
			<div class="col col-sm-8 cmptnDmndYmd">${sd.cmptnDmndYmd}</div>
		</div>
	</div>
	<hr />
	<c:if test="${sd.sttsCd gt 1}">
		<div class="form-group row">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold">개발 담당자</div>
				<div class="col col-sm-6">
					<div type="text" class="picNm">${sd.picNm}</div>
				</div>
			</div>
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold px-0">개발 부서</div>
				<div class="col col-sm-8">
					<div type="text" class="deptNm" style="width: 100%;">${sd.deptNm}</div>
				</div>
			</div>
		</div>
		<hr />
	</c:if>
	<div class="form-group row">
		<div class="col-sm-6 px-0">
			<div class="col col-sm-4 font-weight-bold">진행 상태</div>
			<div class="col col-sm-6">
				<div type="text" class="sttsNm">${sd.sttsNm}</div>
			</div>
		</div>
		<c:if test="${sd.sttsCd gt 1}">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold">완료(예정)일</div>
				<div class="col col-sm-6 endYmd">${sd.endYmd}</div>
			</div>
		</c:if>
	</div>
	<hr />
	<div class="form-group row">
		<c:if test="${sd.sttsCd gt 0}">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold">검토자 이름</div>
				<div class="col col-sm-6">
					<div class="rvwrNm">${sd.rvwrNm}</div>
				</div>
			</div>
		</c:if>
		<c:if test="${sd.sttsCd eq 0}">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold">우선순위</div>
				<div class="col col-sm-6">
					<select id="rnk">
						<option value="상" selected>상</option>
						<option value="중">중</option>
						<option value="하">하</option>
					</select>
				</div>
			</div>
		</c:if>
		<c:if test="${sd.sttsCd gt 1}">
			<div class="col-sm-6 px-0">
				<div class="col col-sm-4 font-weight-bold">우선순위</div>
				<div class="col col-sm-6">${sd.rnk}</div>
			</div>
		</c:if>
	</div>
	<hr />
	<c:if test="${sd.sttsCd eq 0}">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label px-0 font-weight-bold"
				style="line-height: 100px; font-size: 12px;">반려사유</label>
			<div class="col-sm-9">
				<textarea id="srRjctRsnn" class="form-control cn"
					style="height: 100px; width: 100%;"></textarea>
			</div>
		</div>
		<hr />
	</c:if>
	<c:if test="${sd.sttsCd eq 1}">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label px-0 font-weight-bold"
				style="line-height: 100px; font-size: 12px;">반려사유</label>
			<div class="col-sm-9">
				<textarea class="form-control cn"
					style="height: 100px; width: 100%;">${sd.rjctRsn}</textarea>
			</div>
		</div>
		<hr />
	</c:if>
	<div class="form-group row">
		<label class="col-sm-2 px-0 col-form-label font-weight-bold"
			style="line-height: 100px; font-size: 12px;">SR 내용</label>
		<div class="col-sm-9">
			<textarea class="form-control cn" style="width: 100%; height: 120px;" readonly>${sd.cn}</textarea>
		</div>
	</div>
	<hr />
	<div class="form-group row">
		<p class="col-sm-2 font-weight-bold px-0">첨부파일</p>
		<div class="col-sm-10">
			<c:forEach var="f" items="${sd.attachFile}">
				<div>
					<a href="<c:url value='/file/download/${f.fileSn}' />"> <span
						class="glyphicon glyphicon-save" aria-hidden="true"></span> <span>
							${f.orgnlFileNm} </span><span style=""> ${f.fileSz} Bytes</span>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row" id="adminButtonDiv">
		<c:if test="${sd.sttsCd eq 0}">
			<div class="col" style="text-align: right">
				<div id="srAccept" style="float: right;"
					class="btn btn-sm btn-oti center"
					onclick="goAccept('${sd.dmndNo}')">승인</div>
				<div id="srDecline" style="float: right; margin-right: 5px;"
					class="btn btn-sm btn-oti cancle"
					onclick="goDecline('${sd.dmndNo}')">반려</div>
			</div>
		</c:if>
	</div>
</div>