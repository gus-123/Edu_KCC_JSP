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

public class BoardDao { //dao�� �ִ� �޼ҵ带 ȣ��
    private static BoardDao dao = new BoardDao(); // �̱��� �������� ���� (BoardDao�� ������ �θ��� �ʱ� ���ؼ�)

    public static BoardDao getInstance() { // ��ü�� �����Ͽ� �ޱ�����.
        return dao;
    }

    //JNDI ����� �̿��ؼ� DBCP ����
    //DataSource��ü(Connection Pool) => JNDI �̸����� jdbc/oracle
    public Connection getDBCPConnection() {
    	DataSource ds = null;
    	try {
    		Context ctx = new InitialContext();  //JNDI ���
    		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); // ������ �ҽ��� �˻��Ͽ� ��ȯ
    		
    		return ds.getConnection();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return null;
    }
    
    //�� ��� ����
    public List<Board> listBoard() {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<Board> list = new ArrayList<Board>();
    	
    	String sql = "select * from board order by seq desc";
    	
    	try {
    		conn = getDBCPConnection();
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();  //�ϳ��� ��ü�� board ��ü�� ����.
    		
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
    
    
    //�� �� ����(�� �Ѱ��� ���� �����̴� board�� ����)
    public Board detailBoard(int seq) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Board board = new Board();

        String sql = "SELECT * FROM board WHERE seq = ?";

        try {
            conn = getDBCPConnection();  //DB�� ����
            pstmt = conn.prepareStatement(sql);  //sql ������ ����
            pstmt.setInt(1, seq); //?�� ���� ���� ������.
            rs = pstmt.executeQuery();  //executeQuery�� select, executeUpdate�� delete,update,insert

            if (rs.next()) {  //�ϳ��϶��� if, �������϶��� while
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
    
    
    public int insert(Board board) { // Board ��ü ����
        //System.out.println(board);  //jdbc ���� �� �ڵ�
    	
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	
    	//url, user, password
    	String url = "jdbc:oracle:thin:@localhost:1521:XE";
    	String user = "kcc";
    	String password = "1234";
    	int re = -1;
    	
    	String sql = "insert into board values(board_seq.nextval, ?, ?, ?, sysdate, 0)";  // �����Ͱ� ���� �ڸ��� ?�� ����
    	
    	try {
    		//1. JDBC ����̹� �ε�
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		
    		//2. DB ���� (Connection ��ü ����)
    		conn = DriverManager.getConnection(url, user, password);
    		System.out.println("conn: " + conn);
    		
    		//3. PreparedStatement ��ü����(SQL ����)
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, board.getTitle()); //���ڴ� setString ������  setInt
    		pstmt.setString(2, board.getWriter());
    		pstmt.setString(3, board.getContents());
    		
    		//4. SQL ����(insert, update, delete => executeUpdate() => ���� (�ο찹��)
    		re = pstmt.executeUpdate();
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		if(pstmt != null) {
    			try {
    				pstmt.close(); // DB�� ���� �۾�
    			} catch (Exception e2) {}
    		}
    		
    		if(conn != null) {
    			try {
    				conn.close();  // DB�� ���� �۾�
    			} catch (Exception e2) {}
    		}
    		
    	}
    	return re;  // -1�� insert ����, 1�� insert ����
    }
}
