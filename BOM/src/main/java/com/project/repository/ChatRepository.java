package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.entity.ChatEntity;

@Repository
public interface ChatRepository extends JpaRepository <ChatEntity, Long>{

//	   @Query("SELECT d FROM ChatEntity d ORDER BY d.chat_idx DESC")
//		List<ChatEntity> findAllOrderByIdxDesc();
	
	// List<ChatEntity> findAllByOrderByIdxDesc();



}
