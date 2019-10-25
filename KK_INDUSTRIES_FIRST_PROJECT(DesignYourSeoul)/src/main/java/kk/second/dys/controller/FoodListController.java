package kk.second.dys.controller;

import kk.second.dys.model.entity.FamousRestaurant;
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
public class FoodListController {

    @Autowired
   private FoodListPageService service;

    @GetMapping({"/foodList"})
    public String foodList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String  location,ModelMap modelMap,
                           @RequestParam(required = false) String id) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("location", location);
        if(location.equals("")){
            modelMap.addAttribute("foodList", service.findAll(pageable));
        }else{
            modelMap.addAttribute("foodList", service.findFood(pageable, location));
        }
        if(id == null){
            return "themelist/foodList";
        }else{
            return "themelistlogin/foodListLogin";
        }

    }

    @GetMapping("/foodDetail")
    public String foodDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        FamousRestaurant restaurant = service.findById(number);
        modelMap.addAttribute("restaurant", restaurant);

        return "detail/foodDetail";
    }

}
