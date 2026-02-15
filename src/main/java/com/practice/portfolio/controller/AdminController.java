package com.practice.portfolio.controller;
import com.practice.portfolio.services.interfaces.ContactService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        model.addAttribute("contactData",contact.readAllContacts());
        return "admin/readAllContacts";
    }
    @GetMapping("/deleteContactById")
    public String deleteContact(@RequestParam int id) {
        contact.deleteContactById(id);
        return "redirect:/admin/readAllContacts";
    }


}
