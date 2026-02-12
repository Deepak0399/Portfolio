package com.practice.portfolio.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ContactDTO {
    @Size(min = 3, max = 30, message = "Invalid Name Length")
    @NotBlank(message = "Name cannot be empty")
    private String name;
    @Size(min = 8, max = 50, message = "Invalid Email")
    @NotBlank(message = "Email cannot be empty")
    @Email
    private String email;
    @Size(min = 4, max = 50, message = "Invalid Subject Length")
    @NotBlank(message = "Subject cannot be empty")
    private String subject;
    @Size(min = 4, max = 1000, message = "Invalid Message Length")
    @NotBlank(message = "Message cannot be empty")
    private String message;

}

