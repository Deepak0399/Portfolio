package com.practice.portfolio.repositories;

import com.practice.portfolio.entity.ContactEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends JpaRepository<ContactEntity,Integer> {
    boolean existsByEmail(String email);
}
