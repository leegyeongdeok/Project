package kk.second.dys.controller.themeList;

import kk.second.dys.model.entity.themeList.FamousRestaurant;
import kk.second.dys.service.themeList.FoodListPageService;
import kk.second.dys.service.themeList.ReviewService;
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
public class FoodListController {

    @Autowired
    private FoodListPageService service;

    @Autowired
    private ReviewService reviewService;

    @GetMapping({"/theme/foodList"})
    public String foodList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String location, ModelMap modelMap) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        Sort sort = new Sort(Sort.Direction.DESC, "recommend");
        modelMap.addAttribute("foodRank", service.ListReadForRank(sort));

        if (location.equals("")) {
            modelMap.addAttribute("foodList", service.findAll(pageable));
        } else {
            modelMap.addAttribute("foodList", service.findFood(pageable, location));
        }
        return "themeList/foodList";
    }

    @GetMapping("/theme/foodList/detail")
    public String foodDetail(@RequestParam(required = false) String no, ModelMap modelMap,  @PageableDefault Pageable pageable) {
        Long number = Long.parseLong(no);

        FamousRestaurant restaurant = service.findById(number);
        modelMap.addAttribute("restaurant", restaurant);
        modelMap.addAttribute("reviewList", reviewService.findFoodReview(number) );

        return "themeList/detail/foodDetail";
    }

}
