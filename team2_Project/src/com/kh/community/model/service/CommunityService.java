package com.kh.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.community.model.dao.CommunityDao;
import com.kh.community.model.vo.Instagram;

public class CommunityService {

	public ArrayList<Instagram> selectInstaList() {
		Connection conn = getConnection();
		
		ArrayList<Instagram> list = new CommunityDao().selectInstaList(conn);
		
		close(conn);
		
		return list;
	}
	
}
