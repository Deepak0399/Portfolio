package com.practice.portfolio.exception;


import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(Exception.class)
    public String handleGlobalException(RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
        String header = httpServletRequest.getHeader("referer");
        redirectAttributes.addFlashAttribute("result", "Something went wrong");
        return "redirect:"+header;
    }
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxUploadSizeExceededException(RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
        String header = httpServletRequest.getHeader("referer");
        redirectAttributes.addFlashAttribute("result", "File size must not exceed 5MB");
        return "redirect:"+header;
    }
}
