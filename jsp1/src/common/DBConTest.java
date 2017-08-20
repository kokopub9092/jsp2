package common;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConTest {
	
	public static void main(String[] args) {
		Connection con;
		Statement st;
		try {
			con = DBConnector.getCon();
			System.out.println("연결 성공");
			st = con.createStatement(); // 쿼리를 만들어주는 함수 
			ResultSet rs= st.executeQuery("select * from user"); // 쿼리를 실행시키는 함수
			while(rs.next()) { // rs.next는 줄을 내린다.
				System.out.print(rs.getString("user_no"));
				System.out.print(rs.getString("id"));
				System.out.print(rs.getString("password"));
				System.out.println(rs.getString("name"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();			
		}
	}
}
