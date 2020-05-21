package kk.second.dys.controller;

import kk.second.dys.model.entity.Activity;
import kk.second.dys.model.entity.FamousRestaurant;
import kk.second.dys.service.ActivityListPageService;
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
public class ActivityListController {

    @Autowired
   private ActivityListPageService service;

    @Autowired
    private ReviewService reviewService;

    @GetMapping({"/theme/activityList"})
    public String foodList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String location, ModelMap modelMap) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        Sort sort = new Sort(Sort.Direction.DESC, "recommend");
        modelMap.addAttribute("activityRank", service.ListReadForRank(sort));

        if (location.equals("")) {
            modelMap.addAttribute("activityList", service.findAll(pageable));
        } else {
            modelMap.addAttribute("activityList", service.findFood(pageable, location));
        }
        return "themeList/activityList";
    }

    @GetMapping("/theme/activityList/detail")
    public String foodDetail(@RequestParam(required = false) String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Activity activity = service.findById(number);
        modelMap.addAttribute("activity", activity);
        modelMap.addAttribute("reviewList", reviewService.findActivityReview(number) );

        return "themeList/detail/activityDetail";
    }

}
