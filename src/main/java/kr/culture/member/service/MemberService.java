package kr.culture.member.service;

import kr.culture.member.domain.MemberVo;

/**
 * <pre>회원 service</pre>
 *
 * @author leesein
 * @since 2022. 4. 12. 오후 1:44:18
 *
 * <pre>
 * @history
 * 2022. 4. 12. leesein : 최초생성
 * </pre>
 */
public interface MemberService {
	//회원 가입
	public void insertMember(MemberVo memberVo) throws Exception;

}
