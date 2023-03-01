package com.oti.team2.srdemand.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;

public interface ISrDemandDao {

	/**
	 * sr요청 등록
	 * 
	 * @author 신정은
	 */
	public int insertSrDemand(SrRequestDto srRequestDto);

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
	 */
	public List<SrDemand> selectByCustId(String custId);

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
	public int updateByDmndNo(SrRequestDto srRequestDto);

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

}
