package com.kh.myPage.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.community.model.vo.Instagram;
import com.kh.community.model.vo.Like;
import com.kh.myPage.model.dao.MyPageDao;
import com.kh.myPage.model.vo.Follow;
import com.kh.myPage.model.vo.MileageHistory;

public class MyPageService {

	public ArrayList<Follow> selectFollowerList(PageInfo pi, int memNo) {
		Connection conn = getConnection();
		ArrayList<Follow> list = new MyPageDao().selectFollowerList(conn, pi, memNo);
		close(conn);
		return list;
	}

	public ArrayList<Follow> selectFollowingList(PageInfo pi, int memNo) {
		//System.out.println("selectFollowingList 서비스 탐");
		Connection conn = getConnection();
		ArrayList<Follow> list = new MyPageDao().selectFollowingList(conn, pi, memNo);
		close(conn);
		return list;
	}

	public int deleteFollower(int memNo, String followerId) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteFollower(conn, memNo, followerId);
		if (result > 0) {
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
		if (result > 0) {
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
		if (result > 0) {
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

	public ArrayList<Instagram> selectLikeList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Instagram> list = new MyPageDao().selectLikeList(conn, memNo);
		close(conn);
		return list;
	}

	public int deleteLike(int memNo, int comNo) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteLike(conn, memNo, comNo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertLike(int memNo, int comNo) {
		Connection conn = getConnection();
		int result = new MyPageDao().insertLike(conn, memNo, comNo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectFollowerCount(int memNo) {
		Connection conn = getConnection();

		int listCount = new MyPageDao().selectFollowerCount(conn, memNo);

		close(conn);

		return listCount;
	}

	public int selectFollowingCount(int memNo) {
		Connection conn = getConnection();

		int listCount = new MyPageDao().selectFollowingCount(conn, memNo);

		close(conn);

		return listCount;
	}

}
