//package db_test;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.Scanner;
//
//public class DB_Exam01 {
//	public static void main(String[] args) {
//
//		Connection conn;
//
//		Statement stmt = null;
//
//		try {
//			Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
//			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "test1234"); // JDBC
//			System.out.println("DB 연결 완료");
//
//			stmt = conn.createStatement();
//
//			Scanner sc = new Scanner(System.in);
//
//			System.out.println("추가(1), 삭제(2), 수정(3), 끝내기(4) >> ");
//
//			int num = sc.nextInt();
//
//			switch (num) {
//
//			case 1:
//				input(stmt);
//				break;
//			case 2:
//				delete(stmt);
//				break;
//
//			case 3:
//				update(stmt);
//				break;
//
//			case 4:
//				exit();
//				break;
//
//			}
//			
//			ResultSet srs = stmt.executeQuery("select * from student");
//
//			while (srs.next()) {
//
//				System.out.print(srs.getString("name"));
//				System.out.print("\t|\t" + srs.getString("id"));
//				System.out.println("\t|\t" + srs.getString("dept"));
//			}
//
//		} catch (ClassNotFoundException e) {
//			System.out.println("JDBC 드라이버 로드 에러");
//		} catch (SQLException e) {
//			System.out.println("DB 연결 오류");
//		}
//	}
//
//	private static void input(Statement stmt) throws SQLException {
//
//		Scanner sc = new Scanner(System.in);
//
//		System.out.println("회원가입 ");
//		System.out.print("아이디 >> ");
//		String joinId = sc.nextLine();
//		System.out.print("패스워드 >> ");
//		String joinPw = sc.nextLine();
//		System.out.print("이름 >> ");
//		String name = sc.nextLine();
//		System.out.print("학과 >> ");
//		String dept = sc.nextLine();
//		stmt.executeUpdate("insert into student (id, pw, name, dept) values('" + joinId + "','" + joinPw + "','" + name + "','"
//				+ dept + "');"); // 레코드 추가
//		System.out.println("추가되었습니다.");
//
//	}
//
//	private static void delete(Statement stmt) throws SQLException {
//
//		Scanner sc = new Scanner(System.in);
//
//		System.out.print("아이디 >> ");
//		String joinId = sc.nextLine();
//		
//		ResultSet srs = stmt.executeQuery("select * from student where id = " + joinId);
//
//		if(srs.next()) {
//		stmt.executeUpdate("delete from student where id = " + joinId);
//		}
//
//	}
//
//	private static void update(Statement stmt) throws SQLException {
//
//		Scanner sc = new Scanner(System.in);
//
//		System.out.println("수정할 속성 이름 >> ");
//
//		String str = sc.next();
//		
//		switch(str) {
//		
//		case "id" :
//
//			System.out.print("수정할 속성의 현재값 >> ");
//			String nowId = sc.next();
//			System.out.print("수정할 속성의 새로운 값 >> ");
//			String joinId = sc.next();
//			stmt.execute("update student "
//					+ " set id = '" + joinId + "'where id = ' " + nowId + "'");
//	
//			break;
//			
//		case "pw" :
//
//			System.out.print("수정할 속성의 현재값 >> ");
//			String nowPw = sc.next();
//			System.out.print("수정할 속성의 새로운 값 >> ");
//			String joinPw = sc.next();
//			stmt.execute("update student "
//					+ " set id = '" + joinPw + "'where id = ' " + nowPw + "'");
//	
//			break;
//			
//		case "name" :
//
//			System.out.print("수정할 속성의 현재값 >> ");
//			String nowName = sc.next();
//			System.out.print("수정할 속성의 새로운 값 >> ");
//			String name = sc.next();
//			stmt.execute("update student "
//					+ " set id = '" + name + "'where id = ' " + nowName + "'");
//	
//			break;
//			
//			
//		case "dept" :
//			
//			System.out.print("수정할 속성의 현재값 >> ");
//			String nowDept = sc.next();
//			System.out.print("수정할 속성의 새로운 값 >> ");
//			String dept = sc.next();
//			stmt.execute("update student "
//					+ " set id = '" + dept + "'where id = ' " + nowDept + "'");
//	
//			break;
//			
//		}
//			
//			
//
//	}
//
//	private static void exit() throws SQLException {
//
//		System.out.println("종료합니다.");
//
//	}
//
//}
