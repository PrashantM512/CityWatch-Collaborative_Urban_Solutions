package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.city.watch.entity.Department;

public class DepartmentDaoImpl implements DepartmentDao{
	private Connection conn;

	public DepartmentDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public Department loginDepartment(String dept_id, String password) {
		Department dept=null;
		try {
			String query="SELECT * FROM department WHERE dept_id=? AND password=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,dept_id);
			stmt.setString(2, password);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()) {
				dept=new Department();
				dept.setId(rs.getInt(1));
				dept.setDept_id(rs.getString(2));
				dept.setPassword(rs.getString(3));
				dept.setState(rs.getString(4));
				dept.setDist(rs.getString(5));
				dept.setTaluka(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dept;
	}

}
