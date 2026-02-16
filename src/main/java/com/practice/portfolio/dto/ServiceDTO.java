package com.practice.portfolio.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceDTO {

    @Size(min = 2, max = 30, message = "Invalid Title Length")
    @NotBlank(message = "title cannot be empty")
    private String title;

    @Size(min = 5, max = 100, message = "Invalid Description Length")
    @NotBlank(message = "Description cannot be empty")
    private String description;

    private MultipartFile serviceFile;
}
