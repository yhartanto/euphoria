package com.euphoria.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.euphoria.data.repository.ServiceRepository;

@Controller
public class ServiceController {
    private static final String SERVICE = "SERVICE";
    private static final String SERVICES = "SERVICES";

    private static final String DEFAULT_VIEW = SERVICES;
    private static final String SERVICE_VIEW = SERVICE;
    private static final String PATH = "/" + SERVICE;
    private static final String DELETE_VIEW = "/" + SERVICE + "/delete";
    private static final String PAGE_MESSAGE = "message";

    @Autowired
    private ServiceRepository serviceRepository;

}
