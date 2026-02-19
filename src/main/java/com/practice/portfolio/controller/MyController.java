package com.practice.portfolio.controller;
import com.practice.portfolio.dto.ContactDTO;
import com.practice.portfolio.entity.ContactEntity;
import com.practice.portfolio.services.interfaces.ContactService;
import com.practice.portfolio.services.interfaces.ServicesService;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/client")
public class MyController {


    private final ContactService contactService;
    private final ServicesService servicesService;


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

        if (bindingResult.hasErrors()) {
            model.addAttribute("result", "Invalid Input");
            model.addAttribute("errors", bindingResult.getFieldErrors());
            return "contact";
        }
        if (contactService.isContactEmailExist(contactDTO.getEmail())) {
            redirectAttributes.addFlashAttribute("result", "Already message send using same email...");
            return "redirect:client/contact";
        }
        ContactEntity contactResponse = contactService.saveContact(contactDTO);
        log.info("Contact saved details from controller: "+contactResponse);
        redirectAttributes.addFlashAttribute("result", "Contact Saved Successfully");
        return "redirect:/client/contact";
    }

    @GetMapping("/services")
    public String services(Model model) {
        model.addAttribute("listOfServices", servicesService.readServices());
        return "services";
    }
    @GetMapping("/downloadResume")
    public void downloadResume(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String realPath = request.getServletContext().getRealPath("/resume/");
        Path path = Paths.get(realPath, "MyResume.pdf");
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Deepak.pdf");
        ServletOutputStream outputStream = response.getOutputStream();
        Files.copy(path, outputStream);
        outputStream.flush();
    }
}
