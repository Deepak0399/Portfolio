package com.practice.portfolio.controller;
import com.practice.portfolio.dto.ServiceDTO;
import com.practice.portfolio.entity.ServiceEntity;
import com.practice.portfolio.services.interfaces.ContactService;
import com.practice.portfolio.services.interfaces.ServicesService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    private final ContactService contactService;
    private final ServicesService servicesService;
    private String result;

    @GetMapping("/home")
    public String home() {
        return "admin/adminHome";
    }

    @GetMapping("/readAllContacts")
    public String readAllContacts(Model model) {
        model.addAttribute("contactData", contactService.readAllContacts());
        return "admin/readAllContacts";
    }
    @GetMapping("/deleteContact")
    public String deleteContact(@RequestParam int id) {
        contactService.deleteContactById(id);
        return "redirect:/admin/readAllContacts";
    }
    @GetMapping("/addService")
    public String addService() {
        return "admin/addService";
    }
    @PostMapping("/addService")
    public String addService(@Valid @ModelAttribute ServiceDTO serviceDTO, BindingResult result,
     Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("result", "Invalid Input");
            model.addAttribute("errors", result.getFieldErrors());
            return "admin/addService";
        }
        if(serviceDTO.getServiceFile() == null || serviceDTO.getServiceFile().isEmpty()) {
            model.addAttribute("result", "File must be uploaded");
            return "admin/addService";
        }
        MultipartFile multipartFile = serviceDTO.getServiceFile();
        long size = multipartFile.getSize();
        if (size > (1024 * 1024)) {
            model.addAttribute("fileError","File size must not Exceed 1MB");
            return "admin/addService";
        }
        String realPath = request.getServletContext().getRealPath("img/services/");


        servicesService.saveService(serviceDTO, realPath, multipartFile);

        redirectAttributes.addFlashAttribute("result", "Service Added Successfully");
        return "redirect:/admin/addService";
    }
    @GetMapping("/readAllServices")
    public String readAllService(Model model) {
        model.addAttribute("listOfServices", servicesService.readServices());
        return "admin/readAllServices";
    }
    @GetMapping("/deleteService")
    public String deleteService(@RequestParam int id, @RequestParam String fileName,
                                RedirectAttributes redirectAttributes, HttpServletRequest request) {
        String realPath = request.getServletContext().getRealPath("img/services/");

        servicesService.deleteServiceById(id, realPath, fileName);
        return "redirect:/admin/readAllServices";
    }
    @GetMapping("/updateService")
    public String updateService(@RequestParam int id, Model model) {
        Optional<ServiceEntity> service = servicesService.readService(id);
        ServiceEntity serviceEntity = service.get();
        model.addAttribute("serviceData", serviceEntity);

        return "admin/updateService";
    }
    @PostMapping("/updateService")
    public String updateService(@RequestParam int id, @RequestParam String oldFileName,HttpServletRequest request,
         @ModelAttribute ServiceDTO serviceDTO, RedirectAttributes redirectAttributes) throws IOException {
        String realPath = request.getServletContext().getRealPath("img/services/");
        MultipartFile serviceFile = serviceDTO.getServiceFile();
        servicesService.updateService(serviceDTO, realPath, serviceFile, id, oldFileName);
        redirectAttributes.addFlashAttribute("result", "Service Updated Successfully");
        return "redirect:/admin/readAllServices";
    }
}
