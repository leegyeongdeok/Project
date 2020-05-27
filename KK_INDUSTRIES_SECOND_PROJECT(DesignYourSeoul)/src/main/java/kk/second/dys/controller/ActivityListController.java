package kk.second.dys.controller;

import kk.second.dys.model.entity.Activity;
import kk.second.dys.service.ActivityListPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dys")
public class ActivityListController {

    @Autowired
   private ActivityListPageService service;

    @GetMapping({"/activityList"})
    public String cafeList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String  location,ModelMap modelMap,
                           @RequestParam(required = false) String id) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        if(location.equals("")){
            modelMap.addAttribute("activityList", service.findAll(pageable));
        }else{
            modelMap.addAttribute("activityList", service.findFood(pageable, location));
        }
        if(id == null){
            return "themelist/activityList";
        }else{
            return "themelistlogin/activityListLogin";
        }

    }

     @GetMapping("/activityDetail")
    public String activityDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
         Long number = Long.parseLong(no);
         Activity restaurant = service.findById(number);
         modelMap.addAttribute("activity", restaurant);
        return "detail/activityDetail";
    }

}
