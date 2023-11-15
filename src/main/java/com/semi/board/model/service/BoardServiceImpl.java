package com.semi.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.semi.board.model.dao.BoardDao2;
import com.semi.board.model.vo.Board;
import com.semi.common.Template;
import com.semi.common.model.vo.Attachment;
import com.semi.common.model.vo.PageInfo;

public class BoardServiceImpl implements BoardService2{
private BoardDao2 bDao = new BoardDao2();
	
	



	

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		int searchCount = bDao.selectSearchCount(sqlSession, map);
		
		sqlSession.close();
		return searchCount;
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Board> list = bDao.selectSearchList(sqlSession, map, pi);
	
		sqlSession.close();
		return list;
	}

	@Override
	public int deleteBoard(int boardNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = bDao.detaildeleteBoard(sqlSession, boardNo);
		if (result > 0) {
			sqlSession.commit();
		}

		sqlSession.close();
		return result;
	}

	@Override
	public Board selectUpdateBoard(int boardNo) {
		SqlSession sqlSession = Template.getSqlSession();
		Board b = bDao.selectUpdateBoard(sqlSession, boardNo);
		return b;
	}

	@Override
	public ArrayList<Attachment> selectUpdateAttachment(int boardNo) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Attachment> atList = bDao.selectUpdateAttachment(sqlSession, boardNo);
		return atList;
	}
	
	@Override
	public int updateBoard(Board b, ArrayList<Attachment> atlist) {
		SqlSession sqlSession = Template.getSqlSession();
		int result1 = bDao.updateBoard(sqlSession, b);
		int result2 = 1;
		   if (atlist != null) {    // 새로운 첨부파일이 있을 경우
		        for (int i = 0; i < atlist.size(); i++) {
		            Attachment at = atlist.get(i);
		            if (at.getFileNo() != 0) {    // 기존의 첨부파일이 있을 경우 => update
		                result2 = bDao.updateAttachment(sqlSession, at);
		            } else {    // Attachment insert
		                result2 = bDao.insertAttachment(sqlSession, at);
		            }
		        }
		    }
		if(result1 > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return result1 * result2;
		
//		public int updateAttachment(Attachment at) {
//		SqlSession sqlSession = Template.getSqlSession();
//		int result = bDao.updateAttachment(sqlSession, at);
//		return result;
//	}
//	
//	public int insertAttachment(Attachment at) {
//		SqlSession sqlSession = Template.getSqlSession();
//		int result = bDao.insertAttachment(sqlSession, at);
//		return result;
//	}
	}


	
	
	
	
	
	
	
	
	  
	
	
}
