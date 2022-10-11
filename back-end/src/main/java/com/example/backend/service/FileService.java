package com.example.backend.service;

import com.example.backend.model.Image;
import com.example.backend.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.Instant;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;
import java.util.TimeZone;

@Service
public class FileService {

    @Autowired
    private ImageRepository imageRepository;

    private static final Path CURRENT_FOLDER = Paths.get(System.getProperty("user.dir"));

//    @Value("${upload.path}")
//    private Path CURRENT_FOLDER;

    private static final Path staticPath = Paths.get("static");
    private static final Path imagePath = Paths.get("images");
    private static final Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7:00"));

    private Instant instant = Instant.now();

    public void deleteFile(Image image) throws IOException {
        imageRepository.findById(image.getId()).map(
                image1 -> {
                    image1.setPathFile(null);
                    image1.setUrl(null);
                    image1.setType(null);
                    image1.setName(null);
                    return imageRepository.save(image1);
                }
        );
//        fileRepository.deleteById(image.getId());

        Path dirPath = Paths.get(image.getPathFile());
        Files.list(dirPath).forEach(file->{
            if(file.getFileName().toString().startsWith(image.getName())){
                try{
                    Files.delete(file.toAbsolutePath());
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        });
    }

    public Set<Image> uploadImage(MultipartFile[] multipartFiles) throws IOException{
        Set<Image> images = new HashSet<>();
        Path staticPath = Paths.get("static");
        Path imagePath = Paths.get("images");

        //create folder following year/month
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7:00"));
        Path folderPath = Paths.get(calendar.get(Calendar.YEAR) + "_" + (calendar.get(Calendar.MONTH)+1));

        if (!Files.exists(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath).resolve(folderPath))) {
            Files.createDirectories(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath).resolve(folderPath));
        }

        for(MultipartFile file: multipartFiles){
            long timeStampMillis = instant.toEpochMilli();
            String filename = timeStampMillis + "_" + file.getOriginalFilename();

            //Tạo 1 đường dẫn mới để lưu file ở local
            Path file2 = CURRENT_FOLDER.resolve(staticPath).resolve(imagePath)
                    .resolve(folderPath).resolve(filename);
            Files.copy(file.getInputStream(), file2, StandardCopyOption.REPLACE_EXISTING);

            try (OutputStream os = Files.newOutputStream(file2)) {
                os.write(file.getBytes());
            }

            Image image = new Image(
                    filename,
                    ServletUriComponentsBuilder.fromCurrentContextPath()
                            .path("/images/")
                            .path(folderPath.toString())
                            .path("/").path(filename).toUriString(),
                    staticPath.resolve(imagePath).resolve(folderPath).toString(),
                    file.getContentType()
            );
            images.add(image);
        }
        return images;
    }

    public Image uploadOneImage(MultipartFile file) throws IOException {
        //create folder following year/month
        Path folderPath = Paths.get(calendar.get(Calendar.YEAR) + "_" + (calendar.get(Calendar.MONTH) + 1));

        if (!Files.exists(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath).resolve(folderPath))) {
            Files.createDirectories(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath).resolve(folderPath));
        }

        String filename = instant.toEpochMilli() + "_" + file.getOriginalFilename();

        //Tạo 1 đường dẫn mới để lưu file ở local
        Path file1 = CURRENT_FOLDER.resolve(staticPath).resolve(imagePath)
                .resolve(folderPath).resolve(filename);
        Files.copy(file.getInputStream(), file1, StandardCopyOption.REPLACE_EXISTING);

        try (OutputStream os = Files.newOutputStream(file1)) {
            os.write(file.getBytes());
        }

        return new Image(
                filename,
                ServletUriComponentsBuilder.fromCurrentContextPath()
                        .path("/images/")
                        .path(folderPath.toString())
                        .path("/").path(filename).toUriString(),
                staticPath.resolve(imagePath).resolve(folderPath).toString(),
                file.getContentType()
        );
    }
}
