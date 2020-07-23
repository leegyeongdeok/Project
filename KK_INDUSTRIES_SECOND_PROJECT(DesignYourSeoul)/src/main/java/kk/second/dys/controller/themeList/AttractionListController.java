package kk.second.dys.controller.themeList;

import kk.second.dys.model.entity.themeList.Attraction;
import kk.second.dys.service.themeList.AttractionListPageService;
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
public class AttractionListController {

    @Autowired
   private AttractionListPageService service;

    @Autowired
    private ReviewService reviewService;

    @GetMapping({"/theme/attractionList"})
    public String foodList(@RequestParam(required = false) String type, @PageableDefault Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String location, ModelMap modelMap) {
        modelMap.addAttribute("type", type);
        modelMap.addAttribute("location", location);
        Sort sort = new Sort(Sort.Direction.DESC, "recommend");
        modelMap.addAttribute("attractionRank", service.ListReadForRank(sort));

        if (location.equals("")) {
            modelMap.addAttribute("attractionList", service.findAll(pageable));
        } else {
            modelMap.addAttribute("attractionList", service.findFood(pageable, location));
        }
        return "themeList/attractionList";
    }

    @GetMapping("/theme/attractionList/detail")
    public String foodDetail(@RequestParam(required = false) String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Attraction attraction = service.findById(number);
        modelMap.addAttribute("attraction", attraction);
        modelMap.addAttribute("reviewList", reviewService.findAttractionReview(number) );

        return "themeList/detail/attractionDetail";
    }

}
