package kosa.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kosa.model.Board;

public class BoardDao { //dao에 있는 메소드를 호출
    private static BoardDao dao = new BoardDao(); // 싱글톤 형식으로 생성 (BoardDao를 여러번 부르지 않기 위해서)

    public static BoardDao getInstance() { // 객체를 전달하여 받기위함.
        return dao;
    }

    //JNDI 기술을 이용해서 DBCP 구현
    //DataSource객체(Connection Pool) => JNDI 이름으로 jdbc/oracle
    public Connection getDBCPConnection() {
    	DataSource ds = null;
    	try {
    		Context ctx = new InitialContext();  //JNDI 기술
    		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); // 데이터 소스를 검색하여 반환
    		
    		return ds.getConnection();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return null;
    }
    
    //글 목록 보기
    public List<Board> listBoard() {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<Board> list = new ArrayList<Board>();
    	
    	String sql = "select * from board order by seq desc";
    	
    	try {
    		conn = getDBCPConnection();
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();  //하나의 객체를 board 객체에 담음.
    		
    		while(rs.next()) {
				Board board = new Board();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContents(rs.getString("contents"));
				board.setRegdate(rs.getString("regdate"));
				board.setHitcount(rs.getInt("hitcount"));
				
				list.add(board);				
			}
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {}
			}
		}
    	return list;
    }
    
    
    //글 상세 보기(글 한개에 대한 내용이니 board로 받음)
    public Board detailBoard(int seq) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Board board = new Board();

        String sql = "SELECT * FROM board WHERE seq = ?";

        try {
            conn = getDBCPConnection();  //DB와 연결
            pstmt = conn.prepareStatement(sql);  //sql 쿼리문 실행
            pstmt.setInt(1, seq); //?에 넣을 값을 정해줌.
            rs = pstmt.executeQuery();  //executeQuery는 select, executeUpdate는 delete,update,insert

            if (rs.next()) {  //하나일때는 if, 여러개일때는 while
                board.setSeq(rs.getInt("seq"));
                board.setTitle(rs.getString("title"));
                board.setWriter(rs.getString("writer"));
                board.setContents(rs.getString("contents"));
                board.setRegdate(rs.getString("regdate"));
                board.setHitcount(rs.getInt("hitcount"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return board;
    }    
    
    
    public int insert(Board board) { // Board 객체 전달
        //System.out.println(board);  //jdbc 연결 전 코드
    	
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	
    	//url, user, password
    	String url = "jdbc:oracle:thin:@localhost:1521:XE";
    	String user = "kcc";
    	String password = "1234";
    	int re = -1;
    	
    	String sql = "insert into board values(board_seq.nextval, ?, ?, ?, sysdate, 0)";  // 데이터가 들어올 자리는 ?로 놓음
    	
    	try {
    		//1. JDBC 드라이버 로딩
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    		//2. DB 연결 (Connection 객체 생성)
    		conn = DriverManager.getConnection(url, user, password);
    		System.out.println("conn: " + conn);
    		
    		//3. PreparedStatement 객체생성(SQL 질의)
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, board.getTitle()); //문자는 setString 정수는  setInt
    		pstmt.setString(2, board.getWriter());
    		pstmt.setString(3, board.getContents());
    		
    		//4. SQL 실행(insert, update, delete => executeUpdate() => 정수 (로우갯수)
    		re = pstmt.executeUpdate();
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		if(pstmt != null) {
    			try {
    				pstmt.close(); // DB를 끊는 작업
    			} catch (Exception e2) {}
    		}
    		
    		if(conn != null) {
    			try {
    				conn.close();  // DB를 끊는 작업
    			} catch (Exception e2) {}
    		}
    		
    	}
    	return re;  // -1은 insert 실패, 1은 insert 성공
    }
}
