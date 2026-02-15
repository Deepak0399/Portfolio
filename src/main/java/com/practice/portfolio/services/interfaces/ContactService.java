package com.practice.portfolio.services.interfaces;

import com.practice.portfolio.dto.ContactDTO;
import com.practice.portfolio.entity.ContactEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ContactService {

    ContactEntity saveContact(ContactDTO contactDTO);
    boolean isContactEmailExist(String email);
    List<ContactEntity> readAllContacts();

    void deleteContactById(int id);
}
