package com.wanted.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.wanted.model.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{

	public void deleteByNum(Long num);
	
}
