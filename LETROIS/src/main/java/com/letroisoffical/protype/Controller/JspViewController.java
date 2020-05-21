package com.letroisoffical.protype.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class JspViewController {

    //메인
    @GetMapping("")
    public String Home() {
        return "index";
    }

    @GetMapping("/company")
    public String company() {
        return "menu/company";
    }

    @GetMapping("/project")
    public String about() {
        return "menu/project";
    }

    @GetMapping("/notice")
    public String notice() {
        return "menu/notice";
    }

    @GetMapping("/notice/detail")
    public String noticeDetail() {
        return "notice/noticeDetail";
    }

    @GetMapping("/clothes/2019Fw_1")
    public String clothesDetail_2019Fw_1() {
        return "clothes/first_2019fw_1";
    }

    @GetMapping("/waring")
    public String waring() {
        return "menu/waring";
    }


}
