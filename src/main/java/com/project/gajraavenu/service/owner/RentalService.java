package com.project.gajraavenu.service.owner;


import com.project.gajraavenu.model.owner.Rental;
import com.project.gajraavenu.repository.owner.RentalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RentalService {
    @Autowired
    private RentalRepository rentalRepository;

    public void saveRental(Rental rental) {
        rentalRepository.save(rental);
    }

    public List<Rental> getAllRentals() {
        return rentalRepository.findAll();
    }
}
