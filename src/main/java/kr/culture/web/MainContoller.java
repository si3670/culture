package kr.culture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <pre>메인 controller</pre>
 *
 * @author leesein
 * @date : 2022. 2. 27.
 *
 */
@Controller
public class MainContoller {

	/**
	 * <pre>메인 화면 이동</pre>
	 *
	 * @author leesein 
	 * @since 2022. 2. 27. 오후 11:19:22
	 *
	 * @return
	 * @throws Exception
	 *
	 */
	@RequestMapping(value="/main.do")
	public String showMain() throws Exception{
		return "main/main";
	}
	
}
