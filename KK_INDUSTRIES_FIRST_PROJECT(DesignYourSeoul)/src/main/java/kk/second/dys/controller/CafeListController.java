package kk.second.dys.controller;

import kk.second.dys.model.entity.Cafe;
import kk.second.dys.service.CafeListPageService;
import kk.second.dys.service.FoodListPageService;
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
public class CafeListController {

    @Autowired
   private CafeListPageService service;

    @GetMapping({"/cafeList"})
    public String cafeList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String  location,ModelMap modelMap,
                           @RequestParam(required = false) String id) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        if(location.equals("")){
            modelMap.addAttribute("cafeList", service.findAll(pageable));
        }else{
            modelMap.addAttribute("cafeList", service.findFood(pageable, location));
        }
        if(id == null){
            return "themelist/cafeList";
        }else{
            return "themelistlogin/cafeListLogin";
        }
    }

    @GetMapping("/cafeDetail")
    public String foodDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Cafe cafe = service.findById(number);
        modelMap.addAttribute("cafe", cafe);

        return "detail/cafeDetail";
    }

}
