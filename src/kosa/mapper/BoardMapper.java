package kosa.mapper;

import java.util.List;
import java.util.Map;

import kosa.model.Board;
import kosa.model.Search;

public interface BoardMapper {
	//Board.xml�� namespace
	
	/* 0�� ���(����) */
	//List<Board> listBoard();
	
	/* 1�� ��� */  
	//List<Board> listBoard(Search search);
	
	/* 2�� ��� */
	List<Board> listBoard(Map map);
	
	// �󼼺��� �޼ҵ� id��(���� �������� ������)
    Board detailBoard(int seq);
    
    //�� ����
    int insertBoard(Board board);
    
    //�� ����
    int updateBoard(Board board);
}
