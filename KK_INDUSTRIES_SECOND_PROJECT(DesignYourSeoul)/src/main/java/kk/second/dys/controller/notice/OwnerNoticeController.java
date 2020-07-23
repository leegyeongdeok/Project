package kk.second.dys.controller.notice;

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
@RequestMapping("/dys/owner")
public class OwnerNoticeController {

    @Autowired
   private NoticePageService service;

    @GetMapping({"/notice"})
    public String noticeList(@RequestParam(required = false, defaultValue = "")  String search,
                             @RequestParam(required = false, defaultValue = "all") String searchType, @PageableDefault Pageable pageable, ModelMap modelMap) {
        modelMap.addAttribute("searchType", searchType);
        modelMap.addAttribute("search", search);
        
            if (searchType.equals("")){
                modelMap.addAttribute("generalNotice", service.findNoticeList(pageable));
            }else{
                if(searchType.equals("all")){
                    modelMap.addAttribute("generalNotice", service.searchAllNoticeList(pageable, search));
                }else if(searchType.equals("title")){
                    modelMap.addAttribute("generalNotice", service.searchTitleNoticeList(pageable, search));
                }else{
                    modelMap.addAttribute("generalNotice", service.searchContentNoticeList(pageable, search));
                }
            }
            return "ownerService/ownerNotice";
    }

    @GetMapping("/notice/detail")
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

        return "ownerService/noticeDetail";
    }

}
