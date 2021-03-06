package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.WeAreCoupleDAO;
import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;

public class WeAreCoupleService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new WeAreCoupleDAO().getListCount(conn);
		close(conn);
		return result;
	}
	 
	  public ArrayList<Board> selectList( int currentPage) {
			Connection conn = getConnection();
			
			ArrayList<Board> list = new WeAreCoupleDAO().selectList(conn,currentPage);
			close(conn);
			return list;
		}

	public int insertThumbnail(Board b, BestCouple bc, ArrayList<Photo> fileList) {
		Connection conn = getConnection();
		
		WeAreCoupleDAO dao = new WeAreCoupleDAO();
		
		int result1 = dao.insertBoard(conn, b); 
		int result2 = dao.insertBcPhoto(conn, bc);
		int result3 = dao.insertPhoto(conn, fileList);
		
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

		// 디테일 뷰
	public Board selectBoard(String postNo) {
		Connection conn = getConnection();
		WeAreCoupleDAO dao = new WeAreCoupleDAO();
		// 조회수
		int result = dao.updateCount(conn, postNo);
		
		Board b = null;
		if(result > 0) {
			b = dao.selectBoard(conn, postNo);
			
			if(b!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
		}else {
			rollback(conn);
		}
		close(conn);
		return b;
	}
	
	public ArrayList<Photo> selectPhoto(String postNo) {
		Connection conn = getConnection();
		ArrayList<Photo> list = new WeAreCoupleDAO().selectPhoto(conn, postNo);
		
		return list;
	}
	
	public BestCouple selectCouple(String postNo) {
		Connection conn = getConnection();
		
		BestCouple bc = new WeAreCoupleDAO().selectCouple(conn, postNo);
		return bc;
	}

	public int deletePhoto(String postNo) {
		Connection conn = getConnection();
		WeAreCoupleDAO dao = new WeAreCoupleDAO();
		//int result = dao.deletePhoto(conn, postNo);
		int result1 = dao.deleteBoard(conn, postNo);
		if( result1 > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updatePhoto(Board b, BestCouple bc ,String postNo) {
		Connection conn = getConnection();
		WeAreCoupleDAO dao = new WeAreCoupleDAO();
		int post = Integer.parseInt(postNo);
		int result = dao.updatePhoto(conn, b,post);
		int result2 = dao.updateBestCouple(conn, bc, post);
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int updatePhoto(Board b, BestCouple bc ,String postNo,ArrayList<Photo> file) {
		Connection conn = getConnection();
		
		int post = Integer.parseInt(postNo);
		WeAreCoupleDAO dao = new WeAreCoupleDAO();
		
		int result1 = dao.updatePhoto(conn, b ,post);
		int result2 = 0;
		if(file.get(0).getPhotoNo() == 0) {
			result2 = dao.insertNewAttachment(conn, file,post);
		} else {
			result2 = dao.updateAttachment(conn, file);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updatePhoto(Board b,BestCouple bc , ArrayList<Photo> changeFile, ArrayList<Photo> newInsertFile ,String postNo) {
		Connection conn = getConnection();
		int post = Integer.parseInt(postNo);
		WeAreCoupleDAO dao = new WeAreCoupleDAO();
		
		int result1 = dao.updatePhoto(conn, b ,post);
		int result2 = dao.updateAttachment(conn, changeFile);
		int result3 = dao.insertNewAttachment(conn, newInsertFile ,post);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int getListSearchCount(String menu,String content) {
		Connection conn = getConnection();
		int result = new WeAreCoupleDAO().getListSearchCount(conn,menu,content);
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectSearchList(int currentPage, String menu, String content) {
		Connection conn = getConnection();
		ArrayList<Board> list =  new WeAreCoupleDAO().selectSearchList(conn,currentPage,menu, content);
		close(conn);
		return list;
	}

	



}
