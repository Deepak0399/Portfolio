package com.practice.portfolio.services.interfaces;

import com.practice.portfolio.dto.ServiceDTO;
import com.practice.portfolio.entity.ServiceEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public interface ServicesService {

    ServiceEntity saveService(ServiceDTO serviceDTO, String realPath, MultipartFile multipartFile) throws IOException;
    List<ServiceEntity> readServices();
    void deleteServiceById(int id,String realPath, String fileName);
    Optional<ServiceEntity> readService(int id);
    ServiceEntity updateService(ServiceDTO serviceDTO, String realPath, MultipartFile multipartFile,
                                int id, String oldFileName) throws IOException;

}
