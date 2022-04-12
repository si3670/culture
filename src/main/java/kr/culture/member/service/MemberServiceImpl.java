package kr.culture.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.culture.member.domain.MemberVo;
import kr.culture.member.mapper.MemberMapper;

/**
 * <pre>회원 serviceImpl</pre>
 *
 * @author leesein
 * @since 2022. 4. 12. 오후 1:44:34
 *
 * <pre>
 * @history
 * 2022. 4. 12. leesein : 최초생성
 * </pre>
 */
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	//회원가입
	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		this.memberMapper.insertMember(memberVo);
	}

}
