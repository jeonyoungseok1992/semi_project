package com.semi.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.semi.board.model.vo.Board;
import com.semi.common.model.vo.Attachment;
import com.semi.common.model.vo.PageInfo;

public class BoardDao2 {
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper2.selectListCount");
	}
	
	
	
	
	public int selectSearchCount(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper2.selectSearchCount", map);
	}
	
	public ArrayList<Board> selectSearchList(SqlSession sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper2.selectSearchList", map, rowBounds);
	}
	
	public int deleteBoard(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper2.deleteBoard", boardNo);
	}
	
	public Board selectUpdateBoard(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper2.selectUpdateBoard", boardNo);
		
	}
	
	public Attachment selectUpdateAttachment(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper2.selectUpdateAttachment", boardNo);
		
	}

}
