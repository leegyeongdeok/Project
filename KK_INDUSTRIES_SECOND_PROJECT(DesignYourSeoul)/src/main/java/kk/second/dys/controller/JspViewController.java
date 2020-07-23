package kk.second.dys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class JspViewController {

    //메인
    @GetMapping("/dys")
    public String loginHome() {
        return "home";
    }

    //로그인 헤더 버튼

    @GetMapping("/dys/company/intro")
    public String Loginintroduce() {
        return "company/introduction";

    }

    //로그인 페이지
    @GetMapping("/dys/login")
    public String login() {
        return "login/login";
    }

    @GetMapping("/dys/signUp")
    public String signUp() {
        return "login/signUp";
    }

    @GetMapping("/dys/generalUser")
    public String generalUserSignUP() {
        return "login/generalUser";
    }

    @GetMapping("/dys/ownerUser")
    public String ownerUserSignUp() {
        return "login/ownerUser";
    }

    @GetMapping("/dys/signUpSuccess")
    public String signUpSuccess() {
        return "login/signUpSuccess";
    }

    @GetMapping("/dys/find")
    public String findAccount() {
        return "login/find";
    }

    @GetMapping("/dys/findSuccess")
    public String findIdSuccess(@RequestParam(required = false) String name, @RequestParam(required = false) String phone, ModelMap modelMap) {
        modelMap.addAttribute("name", name);
        modelMap.addAttribute("phone", phone);
        return "login/findSuccess";
    }

    @GetMapping("/dys/findPswdSuccess")
    public String findPswdSuccess(@RequestParam(required = false) String id, @RequestParam(required = false) String userType,
                                  ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("userType", userType);
        return "login/findPswdSuccess";
    }


    //문의사항 글쓰기 페이지


    //게시판 글쓰기 페이지
    @GetMapping("/dys/BoardWriting")
    public String boardWriting(@RequestParam(required = false) String account, @RequestParam(required = false) String type, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("type", type);

        if (type.equals("owner")) {
            return "customerserviceowner/ownerBoardWriting";
        } else if (type.equals("general")) {
            return "customerservicelogin/loginBoardWriting";
        } else {
            return null;
        }
    }

    //코스 랭킹
    @GetMapping("/dys/course/ranking")
    public String courseHome(@RequestParam(required = false) String id, @RequestParam(required = false) String name) {
        if (id == null) {
            return "course/courseRanking";
        } else {
            return "course/loginCourseRanking";
        }
    }

    @GetMapping("/dys/course/ranking/detail")
    public String courseDetail(@RequestParam(required = false) String id, @RequestParam(required = false) String name) {
        if (id == null) {
            return "course/courseRankingDetail";
        } else {
            return "course/loginCourseRankingDetail";
        }
    }


}
