package kk.second.dys.controller;


import kk.second.dys.repository.themeList.*;
import kk.second.dys.service.LikeListService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;




@Controller
@RequestMapping("/dys/myPage")
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

    @GetMapping("/Home")
    public String myPageHome() {
        return "myPage/myPageHome";
    }

    @GetMapping("/myInfo")
    public String myInfo() {
        return "myPage/myInfo";
    }

    @GetMapping("/likeList")
    public String likeList(HttpServletRequest request, ModelMap modelMap) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");
        System.out.println(account);

        modelMap.addAttribute("likeFamousRestaurantList", likeListService.getFamousRestaurant(account));
        modelMap.addAttribute("famousRestaurantList", famousRestaurantRepository.findAll());

        modelMap.addAttribute("likeCafeList", likeListService.getCafe(account));
        modelMap.addAttribute("cafeList", cafeRepository.findAll());

        modelMap.addAttribute("likeAccommList", likeListService.getAccommodation(account));
        modelMap.addAttribute("accommodationList", accommodationRepository.findAll());

        modelMap.addAttribute("likeActivityList", likeListService.getActivity(account));
        modelMap.addAttribute("activityList", activityRepository.findAll());

        modelMap.addAttribute("likeAttractionList", likeListService.getAttraction(account));
        modelMap.addAttribute("attractionList", attractionRepository.findAll());

        return "myPage/myLikeListHome";
    }

    @GetMapping("/signOut")
    public String memberCancel() {

        return "myPage/signOut";
    }

    @GetMapping("/myCourseList")
    public String myCourseList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myCourseList";
    }

    @GetMapping("/saveCourseList")
    public String saveCourseList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/saveCourseList";
    }






    //my info change
    @GetMapping("/myInfo/birth")
    public String birthChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myInfo/birthChange";
    }

    @GetMapping("/myInfo/email")
    public String emailChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myInfo/emailChange";    }


    @GetMapping("/myInfo/name")
    public String nameChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myInfo/nameChange";
    }

    @GetMapping("/myInfo/nickName")
    public String nickNameChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myInfo/nickNameChange";
    }

    @GetMapping("/myInfo/phone")
    public String phoneChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myInfo/phoneChange";
    }

    @GetMapping("/myInfo/passWord")
    public String pwChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myPage/myInfo/pwChange";
    }

    //myLikeList


}
