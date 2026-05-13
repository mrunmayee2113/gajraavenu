package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.owner.Visitor;
import com.project.gajraavenu.repository.owner.VisitorRepository;
import com.project.gajraavenu.service.owner.VisitorService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class VisitorController {

    @Autowired
    private VisitorService visitorService;
    @Autowired
    private VisitorRepository visitorRepository;

    @GetMapping("/add-visitor")
    public String showVisitorForm(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        Visitor visitor = new Visitor();

        // ✅ THIS LINE IS MANDATORY
        visitor.setFlatNumber(user.getFlatNumber());

        model.addAttribute("visitor", visitor);

        return "owner/addVisitor";
    }

    @GetMapping("/visitor-history")
    public String getVisitorHistory(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        List<Visitor> visitors = visitorRepository.findByFlatNumber(user.getFlatNumber());
        model.addAttribute("visitors", visitors);

        return "owner/visitorHistory"; // ✅ CORRECT JSP PAGE
    }

    // This is the line that was failing in your screenshot
    @GetMapping("/edit-visitor/{id}")
    public String editVisitor(@PathVariable Long id, Model model, HttpSession session) {

        Visitor visitor = visitorService.getVisitorById(id);

        User user = (User) session.getAttribute("loggedUser");

        // Ensure flat number still belongs to logged user
        visitor.setFlatNumber(user.getFlatNumber());

        model.addAttribute("visitor", visitor);

        return "owner/addVisitor";
    }

    @GetMapping("/delete-visitor/{id}")
    public String deleteVisitor(@PathVariable("id") Long id) {
        visitorService.deleteById(id);
        return "redirect:/visitor-history"; // Removed the /owner/ prefix
    }
    @PostMapping("/save-visitor")
    public String saveVisitor(@ModelAttribute Visitor visitor, HttpSession session) {
        User user = (User) session.getAttribute("loggedUser");
        visitor.setFlatNumber(user.getFlatNumber());
        visitor.setOwner(user);
        visitorService.save(visitor);

        // Redirecting back to /dashboard ensures OwnerController re-runs
        // the logic to fetch the correct bill status.
        return "redirect:/dashboard";
    }


}