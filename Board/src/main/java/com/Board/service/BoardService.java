package com.Board.service;

import java.util.List;

import com.Board.domain.BoardVO;
import com.Board.domain.PositionJoinVO;
import com.Board.domain.PositionVO;
import com.Board.domain.SearchVO;

public interface BoardService {
 
public List<BoardVO> list(SearchVO vo);//조회
public void write(BoardVO vo);//작성
public BoardVO detail(int no);//상세
public void update(BoardVO vo);//수정
public void delete(String no);//삭제
public List<PositionJoinVO> jlist();//조인
public List<PositionVO> poslist();//직책
}