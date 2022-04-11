package kr.culture.member.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.culture.member.domain.MemberVo;

/**
 * 
 * @author KimGukBin
 *
 */
@Controller
@RequestMapping("/member")
public class MemeberController {
	/**
	 *  회원가입 화면
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 1 오후 18:22:50
	 *  
	 *  @return signUp.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/signUp.do")
		public String signUp() throws Exception{
			return "member/signUp.tiles";
		}
	
	@RequestMapping(value="/doSignUp.do")
	@ResponseBody
	public void doSignUp(MemberVo memberVo) throws Exception{
		System.out.println("회원가입 확인");
	}
	
	/**
	 *  로그인 화면 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 2 오후 19:19:36
	 *  
	 *  @return login.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/login.do")
	public String logIn() throws Exception{
		return "member/login.tiles";
	}
	
	/**
	 * <pre>로그인</pre>
	 *
	 * @author leesein
	 * @since 2022. 4. 11.
	 *
	 * @param userId
	 * @param userPw
	 * @throws Exception
	 */
	@RequestMapping(value="/doLogin.do")
	@ResponseBody
	public void doLogIn(@RequestParam Map<String, Object> param) throws Exception{
		System.out.println("hi");
	}
	
	/**
	 *  ID / PW 찾기 페이지 이동 
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:17:03
	 *  
	 *  @return findInfo.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/findInfo.do")
	public String findInfo() throws Exception{
		return "member/findInfo.tiles";
	}
	
	/**
	 * <pre>아이디 찾기</pre>
	 *
	 * @author leesein
	 * @since 2022. 4. 11.
	 *
	 * @param param
	 * @throws Exception
	 */
	@RequestMapping(value="/doFindId.do")
	@ResponseBody
	public void doFindId(@RequestParam Map<String, Object> param) throws Exception{
		System.out.println("아이디찾기 성공");
	}
	
	/**
	 *  회원관리 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:18:03
	 *  
	 *  @return management.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/management.do")
	public String management() throws Exception{
		return "member/management";
	}
	
	/**
	 *  탈퇴 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:18:03
	 *  
	 *  @return secession.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/secession.do")
	public String secession() throws Exception{
		return "member/secession";
	}
}
