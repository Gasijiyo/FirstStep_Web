package edu.spring.ex02.persistence;

import java.util.Date;
import java.util.List;

import edu.spring.ex02.domain.Diary;

// CRUD 기능
public interface DiaryDao {
	
	List<Diary> read();
	
//	List<Diary> read(String userid);
	
	Diary read(int dno);	
	
	int create(Diary diary);
	
	int update(Diary diary);
	
	int delete(int dno);
	
}
