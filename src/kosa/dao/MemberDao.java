package kosa.dao;

import kosa.model.Member;

public class MemberDao {
	private static MemberDao dao = new MemberDao(); // �̱��� �������� ���� (BoardDao�� ������ �θ��� �ʱ� ���ؼ�)

    public static MemberDao getInstance() { // ��ü�� �����Ͽ� �ޱ�����.
        return dao;
    }

    public void insert(Member member) {
        System.out.println(member);
    }
}