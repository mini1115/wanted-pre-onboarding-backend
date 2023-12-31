package com.wanted.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wanted.config.auth.PrincipalDetails;
import com.wanted.model.Board;
import com.wanted.service.BoardService;

@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("insert")
	@PreAuthorize("isAuthenticated()")
	public String insert() {
		return "board/insert";
	}

	@PostMapping("insert")
	public String insert(Board board, @AuthenticationPrincipal PrincipalDetails principal) {
		boardService.insert(board, principal.getMember());
		return "redirect:list";
	}

	// 게시판 글 목록
//	@GetMapping("list")
//	public String list(Model model) {
//		model.addAttribute("lists", boardService.findAll());
//		model.addAttribute("count", boardService.count());
//		return "/board/list";
//	}
	@GetMapping("list")
	public String list(Model model,@PageableDefault(size=10,sort="num",direction =Direction.DESC)Pageable pageable,@RequestParam(required = false,defaultValue = "") String field,@RequestParam(required = false,defaultValue = "") String word) {
		Page<Board>lists = boardService.findAll(field,word,pageable);
		
		Long count = boardService.count(field,word);
		model.addAttribute("lists",lists);
		model.addAttribute("count", count);
		return "/board/list";
	}
	//게시글 상세보기
	@GetMapping("detail/{num}")
	public String detail(@PathVariable Long num,Model model) {
		model.addAttribute("board",boardService.findById(num));
		return "/board/detail";
	}
	//게시글 삭제
	@DeleteMapping("delete/{num}")
	@ResponseBody
	public String delete(@PathVariable Long num) {
		boardService.delete(num);
		return "success";
	}
	//게시글 수정
	@GetMapping("update/{num}")
	public String update(@PathVariable Long num,Model model) {
		Board board = boardService.findById(num);
		model.addAttribute("board",board);
		return "/board/update";
	}
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody Board board) {
		boardService.update(board);
		return "success";
	}
	///////
}
