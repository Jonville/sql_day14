package db_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class test03 {
	public static void main(String[] args) {

		Connection conn;

		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "test1234"); // JDBC
			System.out.println("DB 연결 완료");

			stmt = conn.createStatement();

			printTable(stmt);

		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}
	}

	private static void printTable(Statement stmt) throws SQLException {

		Scanner sc = new Scanner(System.in);

		System.out.println("아이디를 입력해주세요 : ");
		String id = sc.next();
		System.out.println("비밀번호를 입력해주세요. : ");
		String pw = sc.next();

		ResultSet srs = stmt.executeQuery("select * from student where id = " + id + " and pw = " + pw);

		if (srs.next()) {
			System.out.println("로그인 되었습니다.");

		} else {
			
			System.out.println("비밀번호가 틀렸습니다.");
			
			while(true) {
				System.out.println("비밀번호가 틀렸습니다 - 비밀번호를 다시 입력하세요 : ");
				pw = sc.next();
				
				srs = stmt.executeQuery("select * from student where id = " + id + " and pw = " + pw);
				
				if (srs.next()) {
					
					System.out.println("로그인 되었습니다.");
					break;
					
					
				}
			}

		}
	}

}
