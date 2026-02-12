package com.practice.portfolio.exception;


import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(Exception.class)
    public String handleGeneralException(RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
        String header = httpServletRequest.getHeader("referer");
        redirectAttributes.addFlashAttribute("result", "Something went wrong");
        return "redirect:"+header;
    }
}
