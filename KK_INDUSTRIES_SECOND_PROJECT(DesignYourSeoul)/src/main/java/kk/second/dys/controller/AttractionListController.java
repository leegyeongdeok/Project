package kk.second.dys.controller;

import kk.second.dys.model.entity.Attraction;
import kk.second.dys.service.AttractionListPageService;
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
public class AttractionListController {

    @Autowired
   private AttractionListPageService service;

    @GetMapping({"/attractionList"})
    public String cafeList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String  location,ModelMap modelMap,
                           @RequestParam(required = false) String id) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        if(location.equals("")){
            modelMap.addAttribute("AttractionList", service.findAll(pageable));
        }else{
            modelMap.addAttribute("AttractionList", service.findFood(pageable, location));
        }
        if(id == null){
            return "themelist/attractionList";
        }else{
            return "themelistlogin/attractionListLogin";
        }

    }

    @GetMapping("/attractionDetail")
    public String attractionDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Attraction attraction = service.findById(number);
        modelMap.addAttribute("attraction", attraction);

        return "detail/attractionDetail";
    }

}
