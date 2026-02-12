package com.practice.portfolio.controller;
import com.practice.portfolio.dto.ContactDTO;
import com.practice.portfolio.entity.ContactEntity;
import com.practice.portfolio.services.interfaces.ContactService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/client")
public class MyController {


    @Qualifier("contactService")
    private final ContactService contact;


    @GetMapping("/home")
    public String home() {
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @PostMapping("/saveContact")
    public String saveContact(@Valid @ModelAttribute ContactDTO contactDTO,
                              BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
//        if (bindingResult.hasErrors()) {
//            for (FieldError fieldError : bindingResult.getFieldErrors()) {
//                String defaultMessage = fieldError.getDefaultMessage();
//            }
//        }

        if (bindingResult.hasErrors()) {
            model.addAttribute("result", "Invalid Input");
            model.addAttribute("errors", bindingResult.getFieldErrors());
            return "contact";
        }
        if (contact.isContactEmailExist(contactDTO.getEmail())) {
            redirectAttributes.addFlashAttribute("result", "Already message send using same email...");
            return "redirect:client/contact";
        }
        ContactEntity contactResponse = contact.saveContact(contactDTO);
        log.info("Contact saved details from controller: "+contactResponse);
        redirectAttributes.addFlashAttribute("result", "Contact Saved Successfully");
        return "redirect:/client/contact";
    }

    @GetMapping("/services")
    public String services() {
        return "services";
    }
}
