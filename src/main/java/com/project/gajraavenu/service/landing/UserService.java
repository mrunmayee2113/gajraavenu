package com.project.gajraavenu.service.landing;

import com.project.gajraavenu.model.landing.Contact;
import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.repository.landing.ContactRepository;
import com.project.gajraavenu.repository.landing.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository u_repo;
    @Autowired
    private ContactRepository c_repo;


    public User registerUser(User user) {
        return u_repo.save(user);
    }


    public User findByEmailOrFlat(String username) {
        return u_repo.findByEmail(username)
                .orElse(u_repo.findByFlat(username).orElse(null));
    }

    public void saveContact(Contact contact) {
        c_repo.save(contact);
    }


    public User getSecurityUser() {
        return u_repo.findByRole("security").orElse(null);
    }
    public void updateUser(User updatedUser) {

        User user = u_repo.findById(updatedUser.getId()).orElseThrow();

        user.setName(updatedUser.getName());
        user.setPhone(updatedUser.getPhone());
        user.setShift(updatedUser.getShift());


        if(updatedUser.getPassword() != null){
            user.setPassword(updatedUser.getPassword());
        }

        u_repo.save(user);
    }
}
