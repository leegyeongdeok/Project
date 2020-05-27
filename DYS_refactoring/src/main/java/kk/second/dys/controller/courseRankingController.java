package kk.second.dys.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dys")
public class courseRankingController {


    @GetMapping("/course/list")
    public String myCourseList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        return "course/courseList";
    }

    @GetMapping("/dys/saveCourseList")
    public String saveCourseList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/saveCourseList";
    }
}
