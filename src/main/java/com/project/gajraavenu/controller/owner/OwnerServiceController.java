package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.service.owner.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/owner")
public class OwnerServiceController {

    @Autowired
    private OwnerService ownerService;

    @GetMapping("/services")
    public String showServices(Model model) {
        model.addAttribute("allProviders", ownerService.getAvailableServices());
        return "owner/Service";
    }
}