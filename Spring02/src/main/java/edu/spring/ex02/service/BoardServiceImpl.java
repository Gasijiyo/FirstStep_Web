package edu.spring.ex02.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.Board;
import edu.spring.ex02.persistence.BoardDao;

@Service	//스프링 컨테이너 (프레임워크) 가 서비스 컴포넌트로 생성하고 관리하기 위해.
public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	// Service 계층은 Persistence(Repository) 계층의 객체를 사용
	// 객체지향에서 처럼 객체 생성할 필요없이 스프링의 객체를 주입받아서 사용
	@Autowired private BoardDao boardDao;
	
	@Override
	public List<Board> select() {
		log.info("select () 호출");
		
		return boardDao.read();
	}

	@Override
	public int insert(Board board) {
		log.info("insert() 호출");
		
		// 1. boards 테이블에 새 글 insert
		int result = boardDao.create(board);
		// 2. TODO: 작성한 사용자의 points 10점 증가	
		
		return result;
	}

	@Override
	public Board select(int bno) {
		log.info("select(int={})", bno);
		
		Board board = boardDao.read(bno);	//해당 글 번호의 게시글 찾음
		boardDao.updateViewCnt(bno);	//조회수 1 증가
		
		return board;	//검색한 Board 객체를 리턴
	}

	@Override
	public int update(Board board) {
		log.info("update({}) 호출", board);
						
		return boardDao.update(board);
	}

	@Override
	public int delete(int bno) {
		log.info("delete({}) 호출", bno);
		
		return boardDao.delete(bno);
	}

	@Override
	public List<Board> select(int searchType, String searchKeyword) {
		log.info("select({}, {}) 호출", searchType, searchKeyword);

		
		return boardDao.read(searchType, searchKeyword);
	}

}
