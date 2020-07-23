package kk.second.dys.controller;

import kk.second.dys.model.network.response.AdminResponse;
import kk.second.dys.service.AdminApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private AdminApiService service;

    @GetMapping("/get/{account}")
    public AdminResponse readForAccount(@PathVariable String account) {
        return service.readForAccount(account);
    }
}
