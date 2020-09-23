package com.Board.dao;

import java.util.List;

import com.Board.domain.BoardVO;
import com.Board.domain.PositionJoinVO;
import com.Board.domain.PositionVO;
import com.Board.domain.SearchVO;

public interface BoardDAO {
 
public List<BoardVO> list(SearchVO vo);//조회
public void write(BoardVO vo);//쓰기
public BoardVO detail(int no);//상세보기
public void update(BoardVO vo);//수정
public void delete(String no);//삭제
public List<PositionJoinVO> jlist();//조인
public List<PositionVO> poslist();//직책 목록
}