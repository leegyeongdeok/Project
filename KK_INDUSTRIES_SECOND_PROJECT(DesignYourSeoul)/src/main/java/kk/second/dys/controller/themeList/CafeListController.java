package kk.second.dys.controller.themeList;

import kk.second.dys.model.entity.themeList.Cafe;
import kk.second.dys.service.themeList.CafeListPageService;
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
public class CafeListController {

    @Autowired
   private CafeListPageService service;

    @Autowired
    private ReviewService reviewService;

    @GetMapping({"/theme/cafeList"})
    public String cafeList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String location, ModelMap modelMap) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        Sort sort = new Sort(Sort.Direction.DESC, "recommend");
        modelMap.addAttribute("cafeRank", service.ListReadForRank(sort));

        if (location.equals("")) {
            modelMap.addAttribute("cafeList", service.findAll(pageable));
        } else {
            modelMap.addAttribute("cafeList", service.findCafe(pageable, location));
        }
        return "themeList/cafeList";
    }

    @GetMapping("/theme/cafeList/detail")
    public String foodDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Cafe cafe = service.findById(number);
        modelMap.addAttribute("cafe", cafe);
        modelMap.addAttribute("reviewList", reviewService.findCafeReview(number) );

        return "themeList/detail/cafeDetail";
    }

}
