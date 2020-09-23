package com.Board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Board.dao.BoardDAO;
import com.Board.domain.BoardVO;
import com.Board.domain.PositionJoinVO;
import com.Board.domain.PositionVO;
import com.Board.domain.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	 
	// 회원 목록
	@Override
	public List<BoardVO> list(SearchVO vo){
	    return dao.list(vo);
	}
	 
	// 회원 정보 작성
	@Override
	public void write(BoardVO vo) {
	    dao.write(vo); 
	}
	 
	// 게시물 상세내용 불러오기
	@Override
	public BoardVO detail(int no) {
	    return dao.detail(no);
	}
	 
	 //조인
	@Override
	public List<PositionJoinVO> jlist(){
	    return dao.jlist();
	}
	 
	//직책 목록
	@Override
	public List<PositionVO> poslist(){
		return dao.poslist();
	}
	
	//게시물 삭제
	@Override
	public void delete(String no){
		dao.delete(no);
	}
	 
	// 게시물 수정
	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

}