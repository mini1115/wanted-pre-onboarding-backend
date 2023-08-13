package com.wanted.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public List<Board> findAll(){
		return boardRepository.findAll();
	}
	public Long count() {
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
