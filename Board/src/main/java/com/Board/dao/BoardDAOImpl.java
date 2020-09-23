package com.Board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Board.domain.BoardVO;
import com.Board.domain.PositionJoinVO;
import com.Board.domain.PositionVO;
import com.Board.domain.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	 @Inject
	 private SqlSession sql;
	 
	 private static String namespace = "com.Board.mappers.board";
	
	// 게시물 목록
	@Override
	 public List<BoardVO> list(SearchVO vo){
	     return sql.selectList(namespace + ".list", vo);
	 }
	
	//게시물 등록
	@Override
	public void write(BoardVO vo){
		sql.insert(namespace + ".write", vo); 
	}
	
	// 게시물 상세내용 불러오기
	@Override
	public BoardVO detail(int no){
	    return sql.selectOne(namespace +".detail", no);
	 }
	
	//수정하기
	@Override
	public void update(BoardVO vo){
	    sql.update(namespace + ".update", vo);
	}
	
	// 삭제 하기
	@Override
	public void delete(String no){
	    sql.delete(namespace + ".delete", no); 
		}
	
	//조인
	@Override
	 public List<PositionJoinVO> jlist(){
		 return sql.selectList(namespace + ".jlist");
	 }
	
	//직책 목록
	@Override
	 public List<PositionVO> poslist(){
	     return sql.selectList(namespace + ".poslist");
	 }
	
	


	




	
	


}