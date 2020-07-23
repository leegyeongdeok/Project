package kk.second.dys.controller.question;

import kk.second.dys.model.entity.question.GeneralQuestion;
import kk.second.dys.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/dys")
public class QuestionController {

    @Autowired
    private QuestionService service;

    @GetMapping({"/question"})
    public String noticeList(@RequestParam(required = false, defaultValue = "") String search,
                             @RequestParam(required = false, defaultValue = "all") String searchType, @PageableDefault Pageable pageable, ModelMap modelMap,
                             HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");

        if (searchType.equals("")) {
            modelMap.addAttribute("question", service.findGeneralQuestion(account, pageable));
        } else {
            if (searchType.equals("all")) {
                modelMap.addAttribute("question", service.searchGeneralByContainsInAll(pageable, search));
            } else if (searchType.equals("title")) {
                modelMap.addAttribute("question", service.searchGeneralByContainsInTitle(pageable, search));
            } else {
                modelMap.addAttribute("question", service.searchGeneralByContainsInContain(pageable, search));
            }
        }


        return "customerService/question";
    }


    @GetMapping("/question/detail")
    public String questionDetail(@RequestParam(required = false) String no, ModelMap modelMap) {

        Long number = Long.parseLong(no);

        GeneralQuestion question = service.findByGeneralQuestionNo(number);
        GeneralQuestion beforeQuestion = service.findByGeneralQuestionNo(number - 1);
        GeneralQuestion afterQuestion = service.findByGeneralQuestionNo(number + 1);
        modelMap.addAttribute("beforeQuestion", beforeQuestion);
        modelMap.addAttribute("afterQuestion", afterQuestion);
        modelMap.addAttribute("questionDetail", question);

        return "customerService/questionDetail";
    }

    @GetMapping("/question/write")
    public String questionWriting() {
        return "customerService/questionWriting";
    }


}






