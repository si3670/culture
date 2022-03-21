package kr.culture.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	/**
	 *  게시물 목록 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:22:23
	 *  
	 *  @return boardList.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/boardList.do")
	public String boardList() throws Exception{
		return "board/boardList";
	}
	
	/**
	 *  자유게시판 목록 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:29:32
	 *  
	 *  @return freeBoardList.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/freeBoardList.do")
	public String freeBoardList() throws Exception{
		return "board/freeBoardList";
	}
	
	/**
	 *  게시물 생성 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:24:27
	 *  
	 *  @return boardCreat.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/boardCreat.do")
	public String boardCreat() throws Exception{
		return "board/boardCreat";
	}
	
	/**
	 *  게시물  수정 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:25:40
	 *  
	 *  @return boardModify.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/boardModify.do")
	public String boardModify() throws Exception{
		return "board/boardModify";
	}
	
	/**
	 *  게시물 관리 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:27:29
	 *  
	 *  @return boardManagement.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/boardManagement.do")
	public String boardManagement() throws Exception{
		return "board/boardManagement";
	}
	
	/**
	 *  게시물 상세보기 페이지 이동
	 *  
	 *  @author KimGukBin
	 *  @since 2022. 3. 10 오후 23:28:14
	 *  
	 *  @return boardDetail.do
	 *  @throws Exception
	 */
	@RequestMapping(value="/boardDetail.do")
	public String boardDetail() throws Exception{
		return "board/boardDetail";
	}
	
}
