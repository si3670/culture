package kr.culture.member.mapper;

import org.springframework.stereotype.Repository;

import kr.culture.member.domain.MemberVo;

/**
 * <pre>회원 mapper</pre>
 *
 * @author leesein
 * @since 2022. 4. 12. 오후 1:44:47
 *
 * <pre>
 * @history
 * 2022. 4. 12. leesein : 최초생성
 * </pre>
 */
@Repository
public interface MemberMapper {

	//회원가입
	public void insertMember(MemberVo memberVo) throws Exception;

}
