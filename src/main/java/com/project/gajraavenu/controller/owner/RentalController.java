package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.owner.Rental;
import com.project.gajraavenu.service.owner.RentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class RentalController {

    @Autowired
    private RentalService rentalService;



    @GetMapping("/add-rental")
    public String showAddRentalForm() {
        return "owner/add_rental"; // Do not start with a slash if your prefix ends with one
    }

    @PostMapping("/save-rental")
    public String saveRental(@ModelAttribute("rental") Rental rental) {
        rentalService.saveRental(rental);
        return "redirect:/societyUpdates";
    }
}
