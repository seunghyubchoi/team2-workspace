package com.kh.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.community.model.dao.CommunityDao;
import com.kh.community.model.vo.AnswerInstagram;
import com.kh.community.model.vo.InstaImage;
import com.kh.community.model.vo.Instagram;

public class CommunityService {

	public ArrayList<Instagram> selectInstaList() {
		Connection conn = getConnection();
		
		ArrayList<Instagram> list = new CommunityDao().selectInstaList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertAnswer(AnswerInstagram answer) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertAnswer(conn, answer);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<AnswerInstagram> selectAnswerList(int comNo) {
		Connection conn = getConnection();
		
		ArrayList<AnswerInstagram> list = new CommunityDao().selectAnswerList(conn, comNo);
		
		close(conn);
		
		return list;
	}
	
	public int insertInsta(Instagram insta, InstaImage img) {
		Connection conn = getConnection();
		
		int result1 = new CommunityDao().insertInsta(conn, insta);
		int result2 = new CommunityDao().insertInstaimg(conn, img);
		/*
		 * int result2 = 1;
		 * 
		 * if (img != null) { result2 = new CommunityDao().insertInstaimg(conn, img); }
		 */
		
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public Instagram selectInsta(int comNo) {
		Connection conn = getConnection();
		
		Instagram insta = new CommunityDao().selectInsta(conn, comNo);
		
		close(conn);
		
		return insta;
	}
	
	public InstaImage selectInstaImg(int comNo) {
		Connection conn = getConnection();
		
		InstaImage img = new CommunityDao().selectInstaImg(conn, comNo);
		
		close(conn);
		
		return img;
	}
	
	public int updateInsta(Instagram insta, InstaImage img) {
		Connection conn = getConnection();
		
		int result1 = new CommunityDao().updateInsta(conn, insta);
		
		int result2 = 1;
		
		if (img != null) {
			if (img.getInstaImgNo() != 0) {
				result2 = new CommunityDao().updateInstaImg(conn, img);
			}
		}
		
		if (result1 > 0 && result2 < 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	public int deleteInsta(int comNo) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().deleteInsta(conn, comNo);
		System.out.println("서비스 " + comNo);
		
		close(conn);
		
		return result;
	}
	
	public int insertLike(int comNo, int memNo) {
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertLike(conn, comNo, memNo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
