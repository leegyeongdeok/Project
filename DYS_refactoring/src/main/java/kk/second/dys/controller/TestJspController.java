package kk.second.dys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestJspController {

    @GetMapping("/dys/test/generalSide")
    public String generalSide() {
        return "include/generalSide";

    }

    @GetMapping("/dys/test/footer")
    public String footer() {
        return "include/footer";

    }
}
