package com.wanted.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wanted.model.Board;
import com.wanted.model.Member;
import com.wanted.repository.BoardRepository;


@Transactional(readOnly=true)
@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	@Transactional
	public void insert(Board board,Member member) {
		board.setMember(member);
		boardRepository.save(board);
	}
	//게시물 리스트
	public Page<Board> findAll(String field,String word,Pageable pageable){
//		Page<Board> lists = boardRepository.findAll(pageable);
		if(field.equals("title")) 
			return boardRepository.findByTitleContaining(word,pageable);
		if(field.equals("content")) 
			return boardRepository.findByContentContaining(word,pageable);
		return boardRepository.findAll(pageable);
		 
	}
	//게시물 카운트
	public Long count(String field,String word) {
		if(field.equals("title")) {
			return boardRepository.TitleSearch(word);
		}
		else if(field.equals("content")) {
			return boardRepository.ContentSearch(word);
		}
		return boardRepository.count();
	}
	
	@Transactional
	public Board findById(Long num) {
		Board board = boardRepository.findById(num).get();
		return board;
	}
	//게시글 삭제
	@Transactional
	public void delete(Long num) {
		boardRepository.deleteByNum(num);
	}
	//게시글 수정하기 putmapping 서비스 구현
	@Transactional
	public void update(Board board) {
		Board newboard = boardRepository.findById(board.getNum()).get();
		newboard.setTitle(board.getTitle());
		newboard.setContent(board.getContent());
		newboard.setRegdate(new Date());
	}
}
