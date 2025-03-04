package com.oti.team2.srdemand.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srdemand.dto.MytodoSrListDto;
import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrFilterDto;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.util.pager.Pager;

public interface ISrDemandDao {

	/**
	 * sr요청 등록
	 * 
	 * @author 신정은
	 */
	public int insertSrDemand(@Param("srRequestDto") SrRequestDto srRequestDto);

	/**
	 * SR230222(SR+현재날짜)~ 로 시작하는 요청의 개수 구하기
	 * 
	 * @author 신정은
	 */
	public int countByDmndNo(String srCode);

	/**
	 * 고객의 나의 요청 목록 조회 기능
	 * 
	 * @author 신정은
	 * @param srFilterDto 
	 */
	public List<SrDemand> selectByCustId(@Param("custId") String custId, @Param("pager") Pager pager, @Param("sort")String sort,@Param("srFilterDto") SrFilterDto srFilterDto);

	/**
	 * sr요청 이 결재 전 상태이면 수정하기 위해 기존 데이터 제공
	 * 
	 * @author 신정은
	 */
	public SrRequestDto selectSdByDmnNo(String dmndNo);

	/**
	 * sr요청 수정 진행
	 * 
	 * @author 신정은
	 */
	public int updateByDmndNo(@Param("srRequestDto") SrRequestDto srRequestDto);

	/**
	 * 
	 * 
	 * @author 여수한, 신정은 작성일자 : 2023-02-22
	 * 
	 * @return sr요청 상세 조회
	 */
	public SrdemandDetail selectDetailByDmndNo(@Param("dmndNo") String dmndNo);

	/**
	 * 사용자에게 받은 SR요청번호와 SR진척번호를 연결하기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public String selectBySrDmndNo(@Param("dmndNo") String dmndNo);

	/**
	 * 고객용 나의 요청 총 행의 수 구하기
	 * 
	 * @author 신정은
	 * @param srFilterDto 
	 */
	public int countByClientId(@Param("clientId") String clientId, @Param("srFilterDto")SrFilterDto srFilterDto);

	/**
	 * 관리자용 모든요청 총 행의 수 구하기
	 * 
	 * @author 신정은
	 * @param srFilterDto 
	 */
	public int countAllSrDemand(@Param("srFilterDto")SrFilterDto srFilterDto);

	/**
	 * 관리자용 모든요청 목록 가져오기
	 * 
	 * @author 신정은
	 * @param sort 
	 * @param srFilterDto 
	 */
	public List<SrDemand> selectAllSrDemand(@Param("pager") Pager pager, @Param("sort") String sort, @Param("srFilterDto")SrFilterDto srFilterDto);

	/**
	 * 관리자의 sr요청 결재 기능 승인 ,반려 둘 다 처리한다.
	 * 
	 * @author 신정은
	 */
	public int updateSttsCdAndRjctRsnByDmndNo(@Param("sdApprovalDto") SdApprovalDto sdApprovalDto);

	/**
	 * SR요청 삭제하기
	 * 
	 * @author 신정은
	 */
	public int updateDelYnByDmndNo(@Param("dmndNo") String dmndNo);

	/**
	 * SR요청 번호로 시스템cd 가져오기
	 * 
	 * @author 신정은
	 */
	public String selectSysCdByDmndNo(@Param("dmndNo") String dmndNo);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-28
	 * @return sr요청 진행사항 수정 : 진척률 수정 / 결제취소 처리 시에 사용 됨
	 */
	public int updateSttsBySrNo(@Param("srNo") String srNo, @Param("sttsCd") int sttsCd);

	/*
	 * 나의 할일 페이징 처리 :  [고객/ 관리자]의 각 상태별 목록 조회시 페이징 처리를 위한 count
	 * @author 신정은
	 */
	public int countByCustIdOrPicIdAndSttsCd(@Param("custId") String custId
			, @Param("picId") String picId
			, @Param("sttsCd") int sttsCd);
	
	/*
	 * 나의 할일 페이지 - 상태별, [고객/관리자]별 요청+진척 조회 목록 불러오기
	 * @author 신정은
	 */
	public List<MytodoSrListDto> selectByCustIdOrPicIdAndSttsCd(@Param("custId") String custId
			, @Param("picId") String picId
			, @Param("sttsCd") int sttsCd
			, @Param("pager") Pager pager); 
	
	/*
	 * 나의 할일 페이징 처리 : [개발자] 각 상태별 목록 조회시 페이징 처리를 위한 count
	 * @author 신정은
	 */
	public int countByEmpIdAndSttsCd(@Param("empId") String empId
			, @Param("sttsCd") int sttsCd);
	
	/*
	 * 나의 할일 페이지 - 상태별, [개발자]별 자원정보 + 요청 + 진척 조회 목록 불러오기
	 * @author 신정은
	 */
	public List<MytodoSrListDto> selectByEmpIdAndSttsCd(@Param("empId") String empId
			, @Param("sttsCd") int sttsCd
			, @Param("pager") Pager pager);
	/**
	 * 반영요청 수락하기
	 * 
	 * @author 여수한
	 */
	public void updateSrdemandStts(@Param("dmndNo") String dmndNo);
	
	/* 알림을 보낼 요청자 아이디 조회
	 * @author 안한길
	 * */
	public String selectBySrNo(@Param("srNo")String srNo);
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-15
	 * @return 사용자의 sr요청 목록 엑셀 다운로드
	 * @throws Exception
	 */
	public List<SrDemand> selectMyInfoAllToExcel(@Param("custId")String memberId,@Param("sort") String sort,@Param("srFilterDto") SrFilterDto srFilterDto);
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-15
	 * @return 관리자의 sr요청목록 엑셀 다운로드
	 */
	public List<SrDemand> selectAdAllSrDemand(@Param("sort")String sort, @Param("srFilterDto")SrFilterDto srFilterDto);
}
