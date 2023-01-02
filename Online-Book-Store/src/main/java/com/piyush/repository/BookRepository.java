package com.piyush.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.piyush.entity.BookEntity;

@Repository
public interface BookRepository extends JpaRepository<BookEntity,Serializable> {

}
