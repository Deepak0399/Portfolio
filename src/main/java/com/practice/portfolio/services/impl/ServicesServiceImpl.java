package com.practice.portfolio.services.impl;

import com.practice.portfolio.dto.ServiceDTO;
import com.practice.portfolio.entity.ServiceEntity;
import com.practice.portfolio.repositories.ServiceRepository;
import com.practice.portfolio.services.interfaces.ServicesService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ServicesServiceImpl implements ServicesService {

    private final ServiceRepository serviceRepository;
    private final ModelMapper modelMapper;
    @Override
    @Transactional(rollbackOn = Exception.class)
    public ServiceEntity saveService(ServiceDTO serviceDTO, String realPath, MultipartFile multipartFile) throws IOException {
        String fileName = UUID.randomUUID().toString() + multipartFile.getOriginalFilename();

        ServiceEntity serviceEntity = modelMapper.map(serviceDTO, ServiceEntity.class);
        serviceEntity.setFileName(fileName);
        serviceEntity.setDatetime(LocalDateTime.now().toString());

        ServiceEntity entity = serviceRepository.save(serviceEntity);

        Path path = Paths.get(realPath, fileName);
        File file = path.toFile();
        multipartFile.transferTo(file);

        return entity;
    }

    @Override
    public List<ServiceEntity> readServices() {
        return serviceRepository.findAll();
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public void deleteServiceById(int id, String realPath, String fileName) {
        serviceRepository.deleteById(id);
        File file = new File(realPath + File.separator+fileName);
        file.delete();
    }

    @Override
    public Optional<ServiceEntity> readService(int id) {
        return serviceRepository.findById(id);
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public ServiceEntity updateService(ServiceDTO serviceDTO, String realPath, MultipartFile multipartFile,
                                       int id, String oldFileName) throws IOException {
        String fileName = UUID.randomUUID().toString() + multipartFile.getOriginalFilename();
        if (multipartFile != null && !multipartFile.isEmpty()) {
            // New File
            ServiceEntity serviceEntity = modelMapper.map(serviceDTO, ServiceEntity.class);
            serviceEntity.setId(id);
            serviceEntity.setFileName(fileName);
            serviceEntity.setDatetime(LocalDateTime.now().toString());
            ServiceEntity entity = serviceRepository.save(serviceEntity);
            // Old File Deleted
            new File(realPath + File.separator+oldFileName).delete();
            // New File Uploaded
            Path path = Paths.get(realPath, fileName);
            File file = path.toFile();
            multipartFile.transferTo(file);


            return entity;
        }
        else {
            // Old File
            ServiceEntity serviceEntity = modelMapper.map(serviceDTO, ServiceEntity.class);
            serviceEntity.setId(id);
            serviceEntity.setFileName(oldFileName);
            serviceEntity.setDatetime(LocalDateTime.now().toString());
            ServiceEntity entity = serviceRepository.save(serviceEntity);
            return entity;
        }
    }
}
