package kk.second.dys.controller;

import kk.second.dys.model.netowrk.response.OwnerUserApiResponse;
import kk.second.dys.repository.OwnerUserRepository;
import kk.second.dys.service.OwnerUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dys")
public class OwnerPageController {

    @Autowired
    OwnerUserRepository repository;

    @Autowired
    OwnerUserApiService service;

    @GetMapping("owner/Info")
    public String ownerInfo(@RequestParam(required = false) String id, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("name", name);
        OwnerUserApiResponse ownerUser = service.getAccount(id);
        modelMap.addAttribute("ownerUser", ownerUser);
        return "ownerpage/ownerInfo";
    }
}
