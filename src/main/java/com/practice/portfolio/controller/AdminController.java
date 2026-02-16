package com.practice.portfolio.controller;
import com.practice.portfolio.dto.ServiceDTO;
import com.practice.portfolio.entity.ContactEntity;
import com.practice.portfolio.services.interfaces.ContactService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
    @Qualifier("contactService")
    private final ContactService contact;

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
    @GetMapping("/addService")
    public String addServiceView() {
        return "admin/addService";
    }
    @PostMapping("/addService")
    public String addService(@Valid @ModelAttribute ServiceDTO serviceDTO, BindingResult result,
                             Model model, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("result", "Invalid Input");
            model.addAttribute("errors", result.getFieldErrors());
            return "admin/addService";
        }
        if(serviceDTO.getServiceFile() == null || serviceDTO.getServiceFile().isEmpty()) {
            model.addAttribute("result", "File must be uploaded");
            return "admin/addService";
        }

        return "admin/addService";
    }


}
