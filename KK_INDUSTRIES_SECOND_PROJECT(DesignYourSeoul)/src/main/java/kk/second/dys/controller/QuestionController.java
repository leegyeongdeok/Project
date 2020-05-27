package kk.second.dys.controller;

import kk.second.dys.model.entity.GeneralQuestion;
import kk.second.dys.model.entity.Notice;
import kk.second.dys.model.entity.OwnerQuestion;
import kk.second.dys.model.netowrk.request.GeneralQuestionRequest;
import kk.second.dys.model.netowrk.request.OwnerQuestionRequest;
import kk.second.dys.model.netowrk.response.GeneralQuestionResponse;
import kk.second.dys.model.netowrk.response.OwnerQuestionResponse;
import kk.second.dys.service.GeneralQuestionPageService;
import kk.second.dys.service.NoticePageService;
import kk.second.dys.service.OwnerQuestionPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dys")
public class QuestionController {

    @Autowired
    private OwnerQuestionPageService oservice;

    @Autowired
    private GeneralQuestionPageService gservice;

    @GetMapping({"/Question"})
    public String noticeList(@RequestParam(required = false) String type, @RequestParam(required = false, defaultValue = "")  String search,
                             @RequestParam(required = false, defaultValue = "all") String stype, @RequestParam(required = false) String id,
                             @PageableDefault Pageable pageable, ModelMap modelMap) {
        if(type.equals("owner")){
            modelMap.addAttribute("id", id);
            modelMap.addAttribute("stype", stype);
            modelMap.addAttribute("search", search);
            if (search.equals("")){
                modelMap.addAttribute("ownerQuestion", oservice.findNoticeList(id, pageable));
            }else{
                if(stype.equals("all")){
                    modelMap.addAttribute("ownerQuestion", oservice.searchAllNoticeList(pageable, search));
                }else if(stype.equals("title")){
                    modelMap.addAttribute("ownerQuestion", oservice.searchTitleNoticeList(pageable, search));
                }else{
                    modelMap.addAttribute("ownerQuestion", oservice.searchContentNoticeList(pageable, search));
                }
            }
            return "customerserviceowner/ownerQuestion";
        } else if (type.equals("general")){
            modelMap.addAttribute("id", id);
            modelMap.addAttribute("stype", stype);
            modelMap.addAttribute("search", search);
            if (search.equals("")){
                modelMap.addAttribute("generalQuestion", gservice.findNoticeList(id, pageable));
            }else{
                if(stype.equals("all")){
                    modelMap.addAttribute("generalQuestion", gservice.searchAllNoticeList(pageable, search));
                }else if(stype.equals("title")){
                    modelMap.addAttribute("generalQuestion", gservice.searchTitleNoticeList(pageable, search));
                }else{
                    modelMap.addAttribute("generalQuestion", gservice.searchContentNoticeList(pageable, search));
                }
            }
            return "customerservicelogin/loginQuestion";
        }else{
            return null;
        }

    }

    @GetMapping("/QuestionDetail")
    public String questionDetail(@RequestParam(required = false) String type, @RequestParam(required = false) String  no,
                                 ModelMap modelMap) {
        System.out.println("detail");

        if(type.equals("general")){
            Long number = Long.parseLong(no);
            GeneralQuestion question = gservice.findByGeneralQuestionNo(number);
            GeneralQuestion beforeQuestion = gservice.findByGeneralQuestionNo(number-1);
            GeneralQuestion afterQuestion = gservice.findByGeneralQuestionNo(number+1);
            modelMap.addAttribute("beforeQuestion", beforeQuestion);
            modelMap.addAttribute("afterQuestion", afterQuestion);
            modelMap.addAttribute("questionDetail", question);

            return "customerservicelogin/loginQuestionDetail";
        }else{
            Long number = Long.parseLong(no);
            OwnerQuestion question = oservice.findByOwnerQuestionNo(number);
            OwnerQuestion beforeQuestion = oservice.findByOwnerQuestionNo(number-1);
            OwnerQuestion afterQuestion = oservice.findByOwnerQuestionNo(number+1);
            modelMap.addAttribute("beforeQuestion", beforeQuestion);
            modelMap.addAttribute("afterQuestion", afterQuestion);
            modelMap.addAttribute("questionDetail", question);

            return "customerserviceowner/ownerQuestionDetail";
        }

    }

    @PostMapping("/Question/owner/create")
    public OwnerQuestionResponse createOwner(@RequestBody OwnerQuestionRequest request) {

        return oservice.create(request);
    }

    @PostMapping("/Question/general/create")
    public GeneralQuestionResponse createGeneral(@RequestBody GeneralQuestionRequest request) {

        return gservice.create(request);
    }

}
