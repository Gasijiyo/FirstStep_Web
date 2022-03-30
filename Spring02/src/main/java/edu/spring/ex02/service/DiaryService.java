package edu.spring.ex02.service;

import java.util.Date;
import java.util.List;

import edu.spring.ex02.domain.Diary;


public interface DiaryService {
	
	List<Diary> select();
	
//	List<Diary> select(String userid);
	
	Diary select(int dno);
	
	int insert (Diary diary);
	
	int update (Diary diary);
	
	int delete (int dno);
}
