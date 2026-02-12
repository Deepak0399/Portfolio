package com.practice.portfolio.controller;

import com.practice.portfolio.entity.ContactEntity;
import com.practice.portfolio.services.interfaces.ContactService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private ContactService contact;

    @GetMapping("/home")
    public String home() {
        return "admin/adminHome";
    }

    @GetMapping("/readAllContacts")
    public String readAllContacts(Model model) {
        List<ContactEntity> allContacts = contact.readAllContacts();
        model.addAttribute("contactData",allContacts);
        return "admin/readAllContacts";
    }


}
