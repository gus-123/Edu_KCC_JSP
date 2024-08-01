package kosa.mapper;

import java.util.List;
import java.util.Map;

import kosa.model.Board;
import kosa.model.Search;

public interface BoardMapper {
	//Board.xml의 namespace
	
	/* 0번 방식(정적) */
	//List<Board> listBoard();
	
	/* 1번 방식 */  
	//List<Board> listBoard(Search search);
	
	/* 2번 방식 */
	List<Board> listBoard(Map map);
	
	// 상세보기 메소드 id값(내가 가져오고 싶은값)
    Board detailBoard(int seq);
    
    //글 쓰기
    int insertBoard(Board board);
    
    //글 수정
    int updateBoard(Board board);
}
