package db_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class test04 {

	public static void main(String[] args) {
		
		Connection conn;
		Statement stmt = null;
		Scanner s = new Scanner(System.in);
		try {
			Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root","test1234"); // JDBC 연결
			System.out.println("DB 연결 완료");
			stmt = conn.createStatement(); // SQL문 처리용 Statement 객체 생성
//			System.out.print("아이디를 입력해주세요 >> ");
//			String id = s.nextLine();
//			System.out.print("비밀번호를 입력해주세요 >> ");
//			String pw = s.nextLine();
//			
//			ResultSet srs = stmt.executeQuery("select * from student where id = " + id + " and pw = " + pw);
//			if(srs.next()) {
//				System.out.println("로그인 됨");
//			} else {
//				System.out.println("로그인 안됨");
//			}
			try {
				System.out.println("회원가입 ");
				System.out.print("아이디 >> ");
				String joinId = s.nextLine();
				System.out.print("패스워드 >> ");
				String joinPw = s.nextLine();
				System.out.print("이름 >> ");
				String name = s.nextLine();
				System.out.print("학과 >> ");
				String dept = s.nextLine();
				stmt.executeUpdate("insert into student (id, pw, name, dept) values("+ joinId +"," + joinPw + "," + name + "," + dept + ");"); // 레코드 추가
				System.out.println("추가되었습니다.");
			} catch (SQLException e) {
				System.out.println("레코드 추가 에러");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 오류");
		} catch (SQLException e) {
			System.out.println("SQL 실행오류");
		} 
		
	}
}
