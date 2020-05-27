package kk.second.dys.controller;


import kk.second.dys.model.entity.FamousRestaurant;
import kk.second.dys.repository.*;
import kk.second.dys.service.LikeListService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;




@Controller
@RequestMapping("/dys")
public class MyPageController {

    @Autowired
    private LikeListService likeListService;

    @Autowired
    private FamousRestaurantRepository famousRestaurantRepository;

    @Autowired
    private CafeRepository cafeRepository;

    @Autowired
    private AccommodationRepository accommodationRepository;

    @Autowired
    private ActivityRepository activityRepository;

    @Autowired
    private AttractionRepository attractionRepository;

    @GetMapping("/myPage/likeList")
    public String myLikeList(HttpServletRequest request, ModelMap modelMap) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");
        modelMap.addAttribute("LikeFamousRestaurantList", likeListService.getFamousRestaurant(account));
        modelMap.addAttribute("famousRestaurantList", famousRestaurantRepository.findAll());

        modelMap.addAttribute("LikeCafeList", likeListService.getCafe(account));
        modelMap.addAttribute("cafeList", cafeRepository.findAll());

        modelMap.addAttribute("LikeAccommList", likeListService.getAccommodation(account));
        modelMap.addAttribute("accommodationList", accommodationRepository.findAll());

        modelMap.addAttribute("LikeActivityList", likeListService.getActivity(account));
        modelMap.addAttribute("activityList", activityRepository.findAll());

        modelMap.addAttribute("LikeAttractionList", likeListService.getAttraction(account));
        modelMap.addAttribute("attractionList", attractionRepository.findAll());
        return "mypage/myLikeList";
    }
}
