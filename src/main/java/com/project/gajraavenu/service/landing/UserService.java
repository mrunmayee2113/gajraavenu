package com.project.gajraavenu.service.landing;

import com.project.gajraavenu.model.landing.Contact;
import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.repository.landing.ContactRepository;
import com.project.gajraavenu.repository.landing.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ContactRepository contactRepository;

    /**
     * REGISTER USER
     * Saves to the 'users' table only.
     */

    public User findByFlatNumber(String flatNumber) {
        return userRepository.findByFlatNumber(flatNumber);
    }
    public User registerUser(User user) {
        return userRepository.save(user);
    }
    public List<Contact> getAllContacts() {
        return contactRepository.findAll();
    }
    /**
     * LOGIN / SEARCH LOOKUP
     */
    public User findByEmailOrFlat(String username) {

        User user = userRepository.findByEmail(username).orElse(null);

        if (user != null) {
            return user;
        }

        User userByFlat = userRepository.findByFlatNumber(username);

        if (userByFlat != null) {
            return userByFlat;
        }

        return null;
    }

    /**
     * SAVE CONTACT REQUESTS
     */
    public void saveContact(Contact contact) {
        contactRepository.save(contact);
    }
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    /**
     * FETCH SECURITY STAFF
     */
    public User getSecurityUser() {
        return userRepository.findFirstByRole("Security").orElse(null);
    }

    /**
     * UPDATE USER PROFILE
     */
    public void updateUser(User updatedUser) {
        User user = userRepository.findById(updatedUser.getId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        user.setName(updatedUser.getName());
        user.setPhone(updatedUser.getPhone());

        if (updatedUser.getShift() != null) user.setShift(updatedUser.getShift());
        if (updatedUser.getWing() != null) user.setWing(updatedUser.getWing());
        if (updatedUser.getFlatNumber() != null) user.setFlatNumber(updatedUser.getFlatNumber());

        if (updatedUser.getPassword() != null && !updatedUser.getPassword().trim().isEmpty()) {
            user.setPassword(updatedUser.getPassword());
        }

        userRepository.save(user);
    }
}