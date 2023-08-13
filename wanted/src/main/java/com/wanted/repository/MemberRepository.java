package com.wanted.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.wanted.model.Member;
public interface MemberRepository extends JpaRepository<Member,Long> {
	
	Member findByEmail(String email);

}
