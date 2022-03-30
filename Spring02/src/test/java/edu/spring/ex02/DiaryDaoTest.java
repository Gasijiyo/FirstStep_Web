package edu.spring.ex02;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.ex02.domain.Diary;
import edu.spring.ex02.persistence.DiaryDao;
import edu.spring.ex02.persistence.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"}
		)
@WebAppConfiguration
public class DiaryDaoTest {
	private static final Logger log = LoggerFactory.getLogger(DiaryDaoTest.class);
	
	@Autowired
	private DiaryDao diaryDao;
	private UserDao userDao;
	
//	@Test
//	public void doTest() throws Exception {
//		log.info("diaryDao{}", diaryDao);
//		List<Diary> list = diaryDao.read();
//		log.info("list size = {}", list.size());
//		for (Diary d:list) {
//			log.info(d.toString());
//		}
		
//		Diary diary = diaryDao.read(1);
//		log.info(diary.toString());
		
//		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
//		Date d1 = df.parse("2022/02/12");
//		Date d2 = df.parse("2022/02/12");
//		List<Diary> list = diaryDao.read(d);
//		log.info(list.toString());
		
//		Diary diary = new Diary(0, "protoss", "질럿생산", d1, d2);
//		int result = diaryDao.create(diary);
//		log.info("Insert 결과: {}", result);
		
	}


