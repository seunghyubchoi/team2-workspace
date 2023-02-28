package com.kh.myPage.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.myPage.model.dao.MyPageDao;
import com.kh.myPage.model.vo.Follow;
import com.kh.myPage.model.vo.MileageHistory;

public class MyPageService {

	public ArrayList<Follow> selectFollowerList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Follow> list = new MyPageDao().selectFollowerList(conn, memNo);
		close(conn);
		return list;
 	}

	public ArrayList<Follow> selectFollowingList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Follow> list = new MyPageDao().selectFollowingList(conn, memNo);
		close(conn);
		return list;
	}

	public int deleteFollower(int memNo, String followerId) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteFollower(conn, memNo, followerId);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result; 
	}

	public int deleteFollowing(int memNo, String followingId) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteFollowing(conn, memNo, followingId);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result; 
	}

	public int cancelDeleteFollowing(int memNo, String followingId) {
		Connection conn = getConnection();
		int result = new MyPageDao().cancelDeleteFollowing(conn, memNo, followingId);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result; 
	}

	public ArrayList<MileageHistory> selectMileageHistory(int memNo) {
		Connection conn = getConnection();
		ArrayList<MileageHistory> list = new MyPageDao().selectMileageHistory(conn, memNo);
		close(conn);
		return list;

	}

}
