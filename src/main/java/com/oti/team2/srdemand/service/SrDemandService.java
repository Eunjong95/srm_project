package com.oti.team2.srdemand.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.srdemand.dao.ISrDemandDao;
import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrDemandService implements ISrDemandService{
	
	@Autowired
	private ISrDemandDao srDemandDao;
	
	/**
	 * sr요청 등록
	 * @author 신정은
	 */
	public int addSrDemand(SrRequestDto srRequestDto) {
		
		// 요청번호 생성 
		String dmndNo = createSrDemandCode();
		srRequestDto.setDmndNo(dmndNo);
		int row = srDemandDao.insertSrDemand(srRequestDto);
		log.info(row);
		return row;
	}
	
	/**
	 * sr요청 코드 생성하기
	 *  요청번호 생성 로직  ex) SR230222_0002
		 1. 오늘 날짜를 230222 형식으로 가져온다.
		 2. SR230222 ~ 로 시작하는 요청의 개수를 구한다. : 3개라고 가정
		 3. 3+1=4 -> 4번 요청임
		 4. 숫자를 4자리가 안된다면, 앞에 0을 채워서 4자리 수로 만든다.
	 * @author 신정은
	 */
	private String createSrDemandCode() {
		// 현재 날짜 포맷하여 가져오기
		Date now = Calendar.getInstance().getTime();       
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
		String formatedNow = formatter.format(now);
		String srCode = "SR" + formatedNow;
		
		// 포맷팅 현재 날짜/시간 출력
		int count = srDemandDao.countByDmndNo(srCode+"%");
		
		// ex) SR230222_0008 에서 _ 뒤의 숫자 4자리를 세팅하는 로직
		String number = (count + 1) + "";
		while(number.length() < 4) {
			number = "0"+number;
		}
		
		srCode = srCode + "_" + number;
		log.info("sr요청코드 : " + formatedNow); 
		log.info("오늘의 요청 수 : " + count);	
		log.info("최종 sr요청코드 : " + srCode);
		return srCode;
	}

	/**
	 * 고객의 나의 sr요청 목록 조회
	 * @author 신정은
	 */
	public List<SrDemand> getSrDemandList(String custId, Pager pager) {
		return srDemandDao.selectByCustId(custId, pager);
	}
	
	/** 
	 * sr요청 이 결재 전 상태이면 수정하기 위해 기존 데이터 제공
	 * @author 신정은
	 */
	public SrRequestDto getSrReuestDto(String dmndNo) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * sr요청 수정 진행
	 * @author 신정은
	 */
	public int updateSrDemand(SrRequestDto srRequestDto) {
		int row = 0;
		srDemandDao.updateByDmndNo(srRequestDto);
		return 0;
	}
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	public SrdemandDetail getSrDemandDetail(String dmndNo) {
		SrdemandDetail sd = srDemandDao.selectDetailByDmndNo(dmndNo);
		log.info(dmndNo);
		return sd;
	}

	/**
	 * SR요청 삭제하기
	 * 
	 * @author 신정은
	 */
	public void deleteSrdemand(String dmndNo) {
		srDemandDao.updateDelYnByDmndNo(dmndNo);	
	}
	
	/**
	 * 고객용
	 * 나의 요청 총 행의 수 구하기
	 * @author 신정은
	 */
	public int getCountClientSr(String clientId) {
		return srDemandDao.countByClientId(clientId);
	}

	/**
	 * 관리자용
	 * 모든요청 총 행의 수 구하기
	 * @author 신정은
	 */
	public int getCountAllSr() {
		return srDemandDao.countAllSrDemand();
	}

	/**
	 * 관리자용
	 * 모든요청 목록 가져오기
	 * @author 신정은
	 */
	public List<SrDemand> getSrDemandListBy(Pager pager) {
		return srDemandDao.selectAllSrDemand(pager);
	}

	/**
	 * 관리자의 sr요청  결재 기능 
	 * @author 신정은
	 */
	@Transactional
	public void getSrDemandApproval(String dmndNo, int val, String rjctRsn) {
		if(val == 1) { // 승인일 경우 
			// 시스템코드 가져오기
			// 해당 시스템코드로 시작하는 srInformation의 수 가져오기
			// 현재의 년도 를 더한다.
			// sr information에 insert
			
		} 
		// 반려일 경우 1
		srDemandDao.updateSttsCdAndRjctRsnByDmndNo(dmndNo, val, rjctRsn);
		
	}

	


}
