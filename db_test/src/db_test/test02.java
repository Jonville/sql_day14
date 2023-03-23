package db_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class test02 {
	public static void main(String[] args) {

		Connection conn;

		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java", "root", "test1234"); // JDBC
			System.out.println("DB 연결 완료");

			stmt = conn.createStatement();
			
			System.out.println("insert into student (name, id, dept) values ('아무개' , '0893012' , '컴퓨터공학');");
			stmt.executeUpdate("insert into student (name, id, dept) values ('아무개' , '0893012' , '컴퓨터공학');");
			printTable(stmt);
			System.out.println();
			
			System.out.println("update student set id='0189011' where name='아무개'");
			stmt.executeUpdate("update student set id='0189011' where name='아무개'");
			printTable(stmt);
			System.out.println();
			
			System.out.println("delete from student where name='아무개'");
			stmt.executeUpdate("delete from student where name='아무개'");
			printTable(stmt);
			System.out.println();

		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}
	}

	private static void printTable(Statement stmt) throws SQLException {

		ResultSet srs = stmt.executeQuery("select * from student");

		while (srs.next()) {

			System.out.print(srs.getString("name"));
			System.out.print("\t|\t" + srs.getString("id"));
			System.out.println("\t|\t" + srs.getString("dept"));
		}

	}

}
