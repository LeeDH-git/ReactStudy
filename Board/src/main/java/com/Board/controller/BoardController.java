package com.Board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Board.domain.BoardVO;
import com.Board.domain.PositionJoinVO;
import com.Board.domain.PositionVO;
import com.Board.domain.SearchVO;
import com.Board.service.BoardService;

@Controller
@RequestMapping("/board/*")

public class BoardController {
	@Inject
	private BoardService service;
	
    @RequestMapping(value="/list", method=RequestMethod.GET) //해당 URL 로 클라이언트의 요청
    //분석 결과를 model 형태로 반환
    public String getlist(Model model, SearchVO search) throws Exception { //parameter: searchVO (model list)
    	 //function :selectMember parameter(searchVo), mapper: if vo is null select everingthing,else searchmember 
    	List<BoardVO> list = service.list(search);
        model.addAttribute("list", list);//Pass the created list to the memberList variable      
        //board/list.jsp로 포워딩
        return "board/list";
    }
    
    //게시물 작성 페이지로 이동
    @RequestMapping(value="/boardWrite", method = RequestMethod.GET)
    public String getWrite(Model model) throws Exception {
        List<PositionVO> poslist = service.poslist();
        model.addAttribute("poslist", poslist);
        return "board/boardWrite";
    }
    
    // 게시글 작성 post
    @RequestMapping(value="/boardWrite", method=RequestMethod.POST)
    public String postWrite(BoardVO vo) throws Exception {
        service.write(vo);
        return "redirect:list";
    }
    
    //게시물 상세페이지로 이동
    @RequestMapping(value="/boardDetail", method=RequestMethod.GET)
    public String getDetail(int no, Model model) throws Exception {
        BoardVO data = service.detail(no); // no값을 넘김
        model.addAttribute("data", data); // model에 데이터 값을 담는다
        return "board/boardDetail"; // board/board_list.jsp로 이동
    }
    
    // 게시글 수정 페이지로 이동 
    @RequestMapping(value="/boardUpdate", method=RequestMethod.GET)
    public String getUpdate(int no,Model model) throws Exception {
        BoardVO data = service.detail(no); // no값을 넘김
        model.addAttribute("data", data); // model에 데이터 값을 담는다
        return "board/boardUpdate"; // board/board_update.jsp로 이동
    }
    
    // 게시글 수정 post
    @RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
    public String postUpdate(BoardVO vo) throws Exception {
        service.update(vo);
        return "redirect:list"; // 리스트로 리다이렉트
    }
    
    // 게시물 삭제
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String postdelete(String no) throws Exception {
    	service.delete(no);
       return "redirect:list";
    }
    
    //게시물 선택삭제
    @RequestMapping(value = "/delete")
    public String ajaxTest(HttpServletRequest request) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.delete(ajaxMsg[i]);
        }
        return "redirect:list";
    }
    
    //조인한 테이블 리스트
    @RequestMapping(value="/joinlist", method=RequestMethod.GET) //url mapping
    public String PositionList(Model model) throws Exception{
        List<PositionJoinVO> plist = service.jlist();
        model.addAttribute("plist", plist);
        //board/joinlist.jsp로 포워딩
        return "board/joinlist";
    }
    

    

    

    


  }
