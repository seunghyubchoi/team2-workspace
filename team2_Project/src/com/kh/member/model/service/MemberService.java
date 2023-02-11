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

}
