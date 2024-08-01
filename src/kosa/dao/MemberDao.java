package kosa.dao;

import kosa.model.Member;

public class MemberDao {
	private static MemberDao dao = new MemberDao(); // 싱글톤 형식으로 생성 (BoardDao를 여러번 부르지 않기 위해서)

    public static MemberDao getInstance() { // 객체를 전달하여 받기위함.
        return dao;
    }

    public void insert(Member member) {
        System.out.println(member);
    }
}