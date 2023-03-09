package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.AdminMemberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.MileageHistory;
import com.kh.payment.model.vo.Location;

public class AdminMemberService {

	/**
	 * 회원 전체조회 (관리자)
	 * @return
	 */
	public ArrayList<Member> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminMemberDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public Member selectMember(int memNo) {
		Connection conn = getConnection();
		
		Member m = new AdminMemberDao().selectMember(conn, memNo);
		
		close(conn);
		
		return m;
	}

	public ArrayList<Location> selectLocation(int memNo) {
		Connection conn = getConnection();
		
		ArrayList<Location> lList = new AdminMemberDao().selectLocation(conn, memNo);
		
		close(conn);
		
		return lList;
	}

	public int insertMileage(MileageHistory mh) {
		Connection conn = getConnection();
		
		int result = new AdminMemberDao().insertMileage(conn, mh);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteMember(String deleteList) {
		Connection conn = getConnection();
		
		int result = new AdminMemberDao().deleteMember(conn, deleteList);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new AdminMemberDao().updateMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
