package com.practice.portfolio.services.impl;

import com.practice.portfolio.dto.ContactDTO;
import com.practice.portfolio.entity.ContactEntity;
import com.practice.portfolio.repositories.ContactRepository;
import com.practice.portfolio.services.interfaces.ContactService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContactServiceImpl implements ContactService {

    private final ContactRepository contactRepository;


    private ModelMapper modelMapper;

    @Override
    public ContactEntity saveContact(ContactDTO contactDTO) {
//        contact = ContactEntity.builder()
//                .name(contactDTO.getName())
//                .email(contactDTO.getEmail())
//                .subject(contactDTO.getSubject())
//                .message(contactDTO.getMessage())
//                .build();
        ContactEntity contactEntity = modelMapper.map(contactDTO, ContactEntity.class);
        ContactEntity entityResponse = contactRepository.save(contactEntity);
        log.info("Contact saved from service:"+ entityResponse);
        return entityResponse;
    }

    @Override
    public boolean isContactEmailExist(String email) {
       return contactRepository.existsByEmail(email);
    }

    @Override
    public List<ContactEntity> readAllContacts() {
        return contactRepository.findAll();
    }
}
