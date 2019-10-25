package kk.second.dys.controller;

import kk.second.dys.model.entity.Accommodation;
import kk.second.dys.service.AccommodationPageService;
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
public class AccommodationListController {

    @Autowired
   private AccommodationPageService service;

    @GetMapping({"/hotelList"})
    public String cafeList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String  location,ModelMap modelMap,
                           @RequestParam(required = false) String id) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        if(location.equals("")){
            modelMap.addAttribute("hotelList", service.findAll(pageable));
        }else{
            modelMap.addAttribute("hotelList", service.findFood(pageable, location));
        }

        if(id == null){
            return "themelist/hotelList";
        }else{
            return "themelistlogin/hotelListLogin";
        }

    }

    @GetMapping("/hotelDetail")
    public String foodDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Accommodation accommodation = service.findById(number);
        modelMap.addAttribute("hotel", accommodation);;
        return "detail/hotelDetail";
    }

}
