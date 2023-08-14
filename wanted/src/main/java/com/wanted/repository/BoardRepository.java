package com.wanted.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.wanted.model.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{

	public void deleteByNum(Long num);
	
	Page<Board> findByTitleContaining(String title,Pageable pageable);
	Page<Board> findByContentContaining(String title,Pageable pageable);

	
	@Query(value="select count(*) from member_board where title like CONCAT('%',:word,'%')",nativeQuery = true)
	public Long TitleSearch(@Param("word") String word);
	@Query(value="select count(*) from member_board where content like CONCAT('%',:word,'%')",nativeQuery = true)
	public Long ContentSearch(@Param("word") String word);
}
