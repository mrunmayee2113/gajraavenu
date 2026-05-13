package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.owner.Rental;
import com.project.gajraavenu.service.owner.RentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.project.gajraavenu.util.FileUploadUtil;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RentalController {

    @Autowired
    private RentalService rentalService;



    @GetMapping("/add-rental")
    public String showAddRentalForm() {
        return "owner/add_rental"; // Do not start with a slash if your prefix ends with one
    }

    @PostMapping("/save-rental")
    public String saveRental(@ModelAttribute Rental rental,
                             @RequestParam("imageFile") MultipartFile[] files) {

        System.out.println("FILES LENGTH: " + files.length);

        for (MultipartFile file : files) {
            System.out.println("FILE: " + file.getOriginalFilename());
        }
        String uploadDir = "C:/uploads/images/";

        List<String> imagePaths = new ArrayList<>();

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                String fileName = FileUploadUtil.upload(uploadDir, file);
                imagePaths.add(fileName);
            }
        }

        // If you want to store multiple images
        rental.setImagePaths(imagePaths); // you must create this in model

        rentalService.saveRental(rental);

        return "redirect:/rentals";
    }
}
