package kk.second.dys.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dys/owner")
public class OwnerPageController {

    @GetMapping("/home")
    public String ownerHome() {
        return "ownerPage/ownerHome";
    }

    @GetMapping("/Info")
    public String ownerInfo() {
        return "ownerPage/ownerInfo";
    }

    @GetMapping("/Intro")
    public String introduce() {
        return "ownerPage/ownerIntro";
    }


    @GetMapping("/signOut")
    public String ownerCanel(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        return "ownerPage/ownerSignOut";
    }

    @GetMapping("/storeChoice")
    public String ownerStoreChoice(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        return "ownerPage/storeChoice";
    }

    @GetMapping("/storeList")
    public String ownerStoreList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        return "ownerPage/storeList";
    }

    //오너체인지 페이지

    @GetMapping("/Info/birth")
    public String BirthChange(@RequestParam(required = false) String account, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "ownerPage/ownerInfo/birthChange";
    }

    @GetMapping("/Info/email")
    public String EmailChange(@RequestParam(required = false) String account, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "ownerPage/ownerInfo/emailChange";    }

    @GetMapping("/Info/name")
    public String NameChange(@RequestParam(required = false) String account, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "ownerPage/ownerInfo/nameChange";
    }

    @GetMapping("/Info/phone")
    public String PhoneChange(@RequestParam(required = false) String account, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "ownerPage/ownerInfo/phoneChange";
    }

    @GetMapping("/Info/passWord")
    public String PswdChange(@RequestParam(required = false) String account, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "ownerPage/ownerInfo/pwChange";
    }
}
