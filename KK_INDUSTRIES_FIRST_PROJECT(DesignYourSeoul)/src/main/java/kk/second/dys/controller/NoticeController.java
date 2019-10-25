package kk.second.dys.controller;

import kk.second.dys.model.entity.Notice;
import kk.second.dys.service.NoticePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dys")
public class NoticeController {

    @Autowired
   private NoticePageService service;

    @GetMapping({"/Notice"})
    public String noticeList(@RequestParam(required = false) String type, @RequestParam(required = false, defaultValue = "")  String search,
                             @RequestParam(required = false, defaultValue = "all") String stype, @PageableDefault Pageable pageable, ModelMap modelMap) {
        modelMap.addAttribute("stype", stype);
        modelMap.addAttribute("search", search);
        modelMap.addAttribute("type", type);

        if(type.equals("owner")){
            if (search.equals("")){
                modelMap.addAttribute("ownerNotice", service.findNoticeList(pageable));
            }else{
                if(stype.equals("all")){
                    modelMap.addAttribute("ownerNotice", service.searchAllNoticeList(pageable, search));
                }else if(stype.equals("title")){
                    modelMap.addAttribute("ownerNotice", service.searchTitleNoticeList(pageable, search));
                    System.out.println("title");
                }else{
                    modelMap.addAttribute("ownerNotice", service.searchContentNoticeList(pageable, search));
                }
            }

            return "customerserviceowner/ownerNotice";
        }else if(type.equals("general")){
            if (search.equals("")){
                modelMap.addAttribute("generalNotice", service.findNoticeList(pageable));
            }else{
                if(stype.equals("all")){
                    modelMap.addAttribute("generalNotice", service.searchAllNoticeList(pageable, search));
                }else if(stype.equals("title")){
                    modelMap.addAttribute("generalNotice", service.searchTitleNoticeList(pageable, search));
                    System.out.println("title");
                }else{
                    modelMap.addAttribute("generalNotice", service.searchContentNoticeList(pageable, search));
                }
            }
            return "customerservicelogin/loginNotice";
        }else{
            return null;
        }

    }

    @GetMapping("/NoticeDetail")
    public String noticeDetail(@RequestParam(required = false) String  no, ModelMap modelMap) {
        Long number = Long.parseLong(no);
        Notice notice = service.findByNoticeNo(number);
        Notice beforeNotice = service.findByNoticeNo(number-1);
        Notice afterNotice = service.findByNoticeNo(number+1);
        System.out.println(beforeNotice);
        System.out.println(notice);
        System.out.println(afterNotice);
        modelMap.addAttribute("beforeNotice", beforeNotice);
        modelMap.addAttribute("afterNotice", afterNotice);
        modelMap.addAttribute("noticeDetail", notice);

        return "customerserviceowner/ownerNoticeDetail";
    }

}
