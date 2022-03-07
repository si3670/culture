package kr.culture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author rlarn
 *
 */
@Controller
public class memeberController {
	
	/**
	 *  회원가입 화면 이동
	 *  
	 *  @author kimgukbin
	 *  @since 2022. 3. 1 오후 18:22:50
	 *  
	 *  @return 회원가입 완료
	 *  @throws Exception
	 */
	@RequestMapping(value="/signUp.do")
		public String signUp() throws Exception{
			return "member/signUp";
		}
	/**
	 *  로그인 화면 이동
	 *  
	 *  @author kimgukbin
	 *  @since 2022. 3. 2 오후 19:19:36
	 *  
	 *  @return main.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/login.do")
	public String logIn() throws Exception{
		return "member/login";
	}
}
