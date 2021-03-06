package edu.spring.ex02.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.ex02.domain.Reply;
import edu.spring.ex02.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	private static final Logger log = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<Reply> select(int bno) {
		log.info("select(bno={})", bno);
		
		return replyDao.read(bno);
	}
	
	@Override
	public int insert(Reply reply) {
		log.info("insert({})", reply);
		// 댓글 테이블 (replies)에 새로운 댓글 추가
		int result = replyDao.create(reply);
				
		// 게시판 테이블(boards)에 댓글 수를 업데이트
		
		// 댓글 아이디에 포인트 지급
		
		return result;
	}
	
	@Override
	public int update(Reply reply) {
		log.info("update({})", reply);
		
		// 댓글 테이블(replies) 업데이트
		return replyDao.update(reply);
	}
	
	@Override
	public int delete(int rno) {
		log.info("delete(rno={})", rno);
		
		// 댓글 테이블(replies)에서 rno의 댓글 삭제
		int result = replyDao.delete(rno);
		
		// rno 댓글의 bno를 찾아서 게시판 테이블(boards)에서 댓글 수 감소
		
		return result;
	}

}
