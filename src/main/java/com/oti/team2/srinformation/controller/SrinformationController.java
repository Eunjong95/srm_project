package com.oti.team2.srinformation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.team2.srinformation.dto.Srinformation;
import com.oti.team2.srinformation.service.ISrinformationService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SrinformationController {
	
	@Autowired
	ISrinformationService srinformation;
	
	/**
	 * 
	 * @author 여수한
	 * @return sr진척목록 조회
	 */
	@RequestMapping(value="/srinformationlist", method=RequestMethod.GET)
	public String getList(Model model) {
		List<Srinformation> list = srinformation.getList();
		return "srInfo/srInformationList";
	}
	
	
}
