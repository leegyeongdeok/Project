package kk.second.dys.controller;

import kk.second.dys.model.entity.*;
import kk.second.dys.model.netowrk.response.GeneralUserApiResponse;
import kk.second.dys.model.netowrk.response.OwnerUserApiResponse;
import kk.second.dys.repository.CafeRepository;
import kk.second.dys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dys/admin/")
public class AdminPageController {


    @Autowired
    private AdminPageService service;

    @Autowired
    private AccommodationPageService accommodationPageService;

    @Autowired
    private FoodListPageService foodListPageService;

    @Autowired
    private CafeListPageService cafeListPageService;

    @Autowired
    private AttractionListPageService attractionListPageService;

    @Autowired
    private ActivityListPageService activityListPageService;

    @Autowired
    private GeneralUserApiService generalUserApiService;

    @Autowired
    private OwnerUserApiService ownerUserApiService;

    @Autowired
    private NoticePageService noticePageService;

    @Autowired
    private GeneralQuestionPageService generalQuestionPageService;

    @Autowired
    private OwnerQuestionPageService ownerQuestionPageService;


    @GetMapping("Home")
    public String adminPage(Pageable pageable,ModelMap modelMap) {
        modelMap.addAttribute("generalUser", service.findAllGeneral(pageable));
        modelMap.addAttribute("ownerUser", service.findAllOwner(pageable));
        modelMap.addAttribute("notice", service.findAllNotice(pageable));
        modelMap.addAttribute("generalOuest", service.findAllGeneralQuestion(pageable));
        modelMap.addAttribute("ownerOuest", service.findAllOwnerQuestion(pageable));
        modelMap.addAttribute("hotelList", accommodationPageService.findAll(pageable));
        modelMap.addAttribute("foodList", foodListPageService.findAll(pageable));
        modelMap.addAttribute("cafeList", cafeListPageService.findAll(pageable));
        modelMap.addAttribute("activity", activityListPageService.findAll(pageable));
        modelMap.addAttribute("attraction", attractionListPageService.findAll(pageable));

        return "adminpage/adminPage";
    }

    @GetMapping("generalUserInfo")
    public String generalUserInfo(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        GeneralUserApiResponse general = generalUserApiService.findByGeneralId(number);
        modelMap.addAttribute("generalUser", general);

        return "adminpage/adminGeneralInfo";
    }

    @GetMapping("ownerUserInfo")
    public String ownerUserInfo(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        OwnerUserApiResponse owner = ownerUserApiService.findByOwnerId(number);
        modelMap.addAttribute("ownerUser", owner);

        return "adminpage/adminOwnerInfo";
    }

    @GetMapping("adminNoticeDetail")
    public String noticeDetail(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Notice notice = noticePageService.findByNoticeNo(number);
        modelMap.addAttribute("notice", notice);
        return "adminpage/adminNoticeDetail";
    }

    @GetMapping("adminQuestionDetail")
    public String adminQuestinDetail(@RequestParam String no, @RequestParam String type ,ModelMap modelMap) {
        Long number = Long.parseLong(no);
        GeneralQuestion generalQuestion = generalQuestionPageService.findByGeneralQuestionNo(number);
        OwnerQuestion ownerQuestion = ownerQuestionPageService.findByOwnerQuestionNo(number);
        if(type.equals("owner")){
            modelMap.addAttribute("ownerQuest", ownerQuestion);
            return "adminpage/adminOwnerQuestionDetail";
        }else{
            modelMap.addAttribute("generalQuest", generalQuestion);
            return "adminpage/adminQuestionDetail";
        }


    }
}
