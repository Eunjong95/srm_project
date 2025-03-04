package com.oti.team2.srinformation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.srinformation.dto.Dept;
import com.oti.team2.srinformation.dto.Manager;
import com.oti.team2.srinformation.dto.SrInfoFilter;
import com.oti.team2.srinformation.dto.SrInformationRequestDto;
//github.com/OTI-SRM/srm_project
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInformation;
import com.oti.team2.util.pager.Pager;

@Mapper
public interface ISrinformationDao {

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-22
	 * @param srInfoFilter
	 * @param pager
	 * @param role 
	 * @return sr진척 목록 조회
	 */
	public List<SrinformationList> selectInfoAll(@Param("pager") Pager pager,
			@Param("srInfoFilter") SrInfoFilter srInfoFilter, @Param("sort") String sort, @Param("role")String role, @Param("ey") String ey, @Param("by") String by);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-23
	 * @return sr진척 계획정보 조회
	 */
	public SrplanInformation selectPlanByDmndNo(@Param("dmndNo") String dmndNo);

	/**
	 * WOR-2023 으로 시작하는 데이터의 수를 가져온다.
	 * 
	 * @author 신정은
	 */
	public int countBySrNo(String srCode);

	/**
	 * sr요청 승인 시 srInformation으로 insert한다.
	 * 
	 * @author 신정은
	 */
	public int insertSrInformatioin(SrInformationRequestDto srInfoDto);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return 개발부서 조회
	 */
	public List<Dept> selectDept();

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @param deptCd
	 * @return sr계획정보 부서 변경시 해당 담당자 변경
	 */
	public Manager selectFlnmByDeptCd(@Param("deptCd") String deptCd);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return sr계획정보 부서 변경
	 */
	public void updateSrInfo(@Param("srplanInfomation") SrplanInformation srplanInfomation);

	/*
	 * 페이징 처리를 위한 전체 행수 조회
	 * 
	 * @author 안한길 작성일자 : 2023-03-06
	 * 
	 * @return 결과 행수
	 * */
	public int selectTotalRow(@Param("page") int page, @Param("srInfoFilter") SrInfoFilter srInfoFilter, @Param("role")String role);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-03
	 * @return 개발취소시 sr정보 진행여부 false(0)으로 수정
	 */
	public void updatePrgrsBySrNo(@Param("srNo") String srNo);
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-08
	 * @return 개발취소시 계획종료일 SYSDATE
	 */
	public void updateEndYmdBySrNo(@Param("srNo") String srNo);
	
	/**
	 * 고객이 문의글 작성 시 : 자신의 모든 진척-요청번호를 보여주기 위함
	 * @author 신정은
	 */
	public List<SRKeyDto> selectSrNoAndDmndNoByCustId(@Param("custId")String custId);
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-09
	 * @return 반영요청 수락시 SR진척에서 계획종료일 update
	 */
	public void updateEndYmdByDmndNo(@Param("dmndNo") String dmndNo);
	
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-13
	 * @return sr진척 엑셀 다운로드 목록 조회
	 */
	public List<SrinformationList> selectInfoAllToExcel(@Param("srInfoFilter") SrInfoFilter srInfoFilter, @Param("sort") String sort);
	
	/*
	 * 해당 관리자가 담당하는 가장 최근의 요청에대한 진척번호 조회
	 * @author 신정은
	 */
	public String selectMaxSrNoByPicId(String picId);
	
}
