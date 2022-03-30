package edu.spring.ex02.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.spring.ex02.domain.Diary;
import edu.spring.ex02.service.DiaryService;

//@RestController
@Controller
@RequestMapping(value = "/diary")
public class DiaryController {
	private static final Logger log = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired
	private DiaryService diaryService;
	
//	@RequestMapping(value = "/calendar/{userid}", method = RequestMethod.GET)
//	public ResponseEntity<List<Diary>> readAllDiary(@PathVariable(name = "userid") String userid) {
//		log.info("readAllDiary(userid = {})", userid);
//		
//		List<Diary> diaryList = diaryService.select(userid);
//		
//		ResponseEntity<List<Diary>> entity = new ResponseEntity<List<Diary>>(diaryList, HttpStatus.OK);
//		
//		return entity;	
//	}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void main(Model model) {
		log.info("Diary main() 호출");
		
		List<Diary> schedule = diaryService.select();
		model.addAttribute("schedule", schedule);
		
		for (Diary d: schedule) {			
			log.info(d.toString());
			
		}
		
	}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.POST)
	public String insert(Diary diary) {
		log.info("Diary insert() 호출", diary);

		diaryService.insert(diary);
		return "redirect:/diary/calendar";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int dno) {
		log.info("Diary delete(dno = {})", dno);
		diaryService.delete(dno);
		return "redirect:/diary/calendar";
		
	}	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Diary diary) {
		log.info("Diary update({})호출" , diary);
		diaryService.update(diary);
		return "redirect:/diary/calendar";
	}
	
	
	
	
	
}
