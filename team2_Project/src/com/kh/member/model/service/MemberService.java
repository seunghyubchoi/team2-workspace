package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);

		
		return m;
	}

	public Member passwordCheck(String memId, String pwdCheck) {
		Connection conn = getConnection();
		Member m = new MemberDao().passwordCheck(conn, memId, pwdCheck);
		close(conn);
		
		return m;
	
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	
	public Member updatePwd(String memId, String memPwd, String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, memId, memPwd, updatePwd);
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
			
		} else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public int insertMember(Member m) {
Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		// 트랜젝션 처리
		if(result > 0) {
			// 성공
			commit(conn);
		} else {
			// 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result;	
	}
}
