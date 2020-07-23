package kk.second.dys.controller.question;

import kk.second.dys.model.entity.question.OwnerQuestion;
import kk.second.dys.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/dys/owner")
public class OwnerQuestionController {

    @Autowired
    private QuestionService service;

    @GetMapping({"/question"})
    public String noticeList(@RequestParam(required = false, defaultValue = "") String search,
                             @RequestParam(required = false, defaultValue = "all") String searchType, @PageableDefault Pageable pageable, ModelMap modelMap,
                             HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");


        if (searchType.equals("")) {
            modelMap.addAttribute("question", service.findOwnerQuestion(account, pageable));
        } else {
            if (searchType.equals("all")) {
                modelMap.addAttribute("question", service.searchOwnerByContainsInAll(pageable, search));
            } else if (searchType.equals("title")) {
                modelMap.addAttribute("question", service.searchOwnerByContainsInTitle(pageable, search));
            } else {
                modelMap.addAttribute("question", service.searchOwnerByContainsInContain(pageable, search));
            }
        }


        return "ownerService/ownerQuestion";
    }


    @GetMapping("/question/detail")
    public String questionDetail(@RequestParam(required = false) String no, ModelMap modelMap) {

        Long number = Long.parseLong(no);

        OwnerQuestion question = service.findByOwnerQuestionNo(number);
        OwnerQuestion beforeQuestion = service.findByOwnerQuestionNo(number - 1);
        OwnerQuestion afterQuestion = service.findByOwnerQuestionNo(number + 1);
        modelMap.addAttribute("beforeQuestion", beforeQuestion);
        modelMap.addAttribute("afterQuestion", afterQuestion);
        modelMap.addAttribute("questionDetail", question);

        return "ownerService/ownerQuestionDetail";
    }

    @GetMapping("/question/write")
    public String questionWriting() {
        return "ownerService/ownerQuestionWriting";
    }


}






