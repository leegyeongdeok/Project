package kk.second.dys.controller;

import kk.second.dys.model.entity.*;
import kk.second.dys.model.entity.question.GeneralQuestion;
import kk.second.dys.model.entity.question.GeneralQuestionReply;
import kk.second.dys.model.entity.question.OwnerQuestion;
import kk.second.dys.model.entity.question.OwnerQuestionReply;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.model.network.response.OwnerUserApiResponse;
import kk.second.dys.model.network.response.questionReply.GeneralQuestionReplyResponse;
import kk.second.dys.model.network.response.questionReply.OwnerQuestionReplyResponse;
import kk.second.dys.repository.NoticeRepository;
import kk.second.dys.repository.question.GeneralQuestionReplyRepository;
import kk.second.dys.repository.question.OwnerQuestionReplyRepository;
import kk.second.dys.service.*;
import kk.second.dys.service.themeList.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/dys/admin")
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
    private QuestionService questionService;

    @Autowired
    private NoticeRepository noticeRepository;
    @Autowired
    private GeneralQuestionReplyRepository generalQuestionReplyRepository;

    @Autowired
    private OwnerQuestionReplyRepository ownerQuestionReplyRepository;




    @GetMapping("/home")
    public String adminPage(Pageable pageable, ModelMap modelMap) {
        modelMap.addAttribute("generalUser", service.findAllGeneral(pageable));
        modelMap.addAttribute("ownerUser", service.findAllOwner(pageable));
        modelMap.addAttribute("notice", noticeRepository.findAll());
        modelMap.addAttribute("generalOuest", service.findAllGeneralQuestion(pageable));
        modelMap.addAttribute("ownerOuest", service.findAllOwnerQuestion(pageable));
        modelMap.addAttribute("hotelList", accommodationPageService.findAll(pageable));
        modelMap.addAttribute("foodList", foodListPageService.findAll(pageable));
        modelMap.addAttribute("cafeList", cafeListPageService.findAll(pageable));
        modelMap.addAttribute("activity", activityListPageService.findAll(pageable));
        modelMap.addAttribute("attraction", attractionListPageService.findAll(pageable));

        return "adminPage/adminHome";
    }

    @GetMapping("/generalUserInfo")
    public String generalUserInfo(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        GeneralUserApiResponse general = generalUserApiService.findByGeneralId(number);
        modelMap.addAttribute("generalUser", general);

        return "adminPage/generalInfo";
    }

    @GetMapping("/ownerUserInfo")
    public String ownerUserInfo(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        OwnerUserApiResponse owner = ownerUserApiService.findByOwnerId(number);
        modelMap.addAttribute("ownerUser", owner);

        return "adminPage/ownerInfo";
    }

    @GetMapping("/noticeDetail")
    public String noticeDetail(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Notice notice = noticePageService.findByNoticeNo(number);
        modelMap.addAttribute("notice", notice);
        return "adminPage/noticeDetail";
    }

    @GetMapping("/noticeUpdate")
    public String noticeUpdate(@RequestParam String no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Notice notice = noticePageService.findByNoticeNo(number);
        modelMap.addAttribute("notice", notice);
        return "adminPage/noticeUpdate";
    }

    @GetMapping("/noticeWriting")
    public String noticeWriting() {
        return "adminPage/noticeWriting";
    }

    @GetMapping("/questionDetail")
    public String questionDetail(@RequestParam String no, @RequestParam String type, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        GeneralQuestion generalQuestion = questionService.findByGeneralQuestionNo(number);
        OwnerQuestion ownerQuestion = questionService.findByOwnerQuestionNo(number);
        OwnerQuestionReplyResponse ownerQuestionReply = ownerQuestionReplyRepository.findByOwnerQuestion(ownerQuestion)
                .map(reply -> questionService.responseOwnerReply(reply))
                .orElse(new OwnerQuestionReplyResponse().setAdmin(" ").setRegisteredAt(LocalDateTime.now()).setReply("답변이 없습니다."));

        GeneralQuestionReplyResponse generalQuestionReply = generalQuestionReplyRepository.findByGeneralQuestion(generalQuestion)
                .map(reply -> questionService.responseGeneralReply(reply))
                .orElse(new GeneralQuestionReplyResponse().setAdmin(" ").setRegisteredAt(LocalDateTime.now()).setReply("답변이 없습니다."));

        if (type.equals("owner")) {
            modelMap.addAttribute("questionDetail", ownerQuestion);
            modelMap.addAttribute("questionReply", ownerQuestionReply);

        } else {
            modelMap.addAttribute("questionDetail", generalQuestion);
            modelMap.addAttribute("questionReply", generalQuestionReply);
        }

        return "adminPage/questionDetail";
    }
}
