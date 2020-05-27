package kk.second.dys.controller;

import kk.second.dys.model.entity.Accommodation;
import kk.second.dys.service.AccommodationPageService;
import kk.second.dys.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

    @Autowired
    private ReviewService reviewService;

    @GetMapping({"/theme/accomList"})
    public String foodList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String location, ModelMap modelMap) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        Sort sort = new Sort(Sort.Direction.DESC, "recommend");
        modelMap.addAttribute("accomRank", service.ListReadForRank(sort));

        if (location.equals("")) {
            modelMap.addAttribute("accomList", service.findAll(pageable));
        } else {
            modelMap.addAttribute("accomList", service.findFood(pageable, location));
        }
        return "themeList/accommodationList";
    }

    @GetMapping("/theme/accomList/detail")
    public String foodDetail(@RequestParam(required = false) String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Accommodation accommodation = service.findById(number);
        modelMap.addAttribute("accommodation", accommodation);
        modelMap.addAttribute("reviewList", reviewService.findAccommodationReview(number) );

        return "themeList/detail/accommodationDetail";
    }

}
