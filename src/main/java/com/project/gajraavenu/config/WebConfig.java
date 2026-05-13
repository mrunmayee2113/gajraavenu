package com.project.gajraavenu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // For uploaded images
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:C:/uploads/images/");
    }
}