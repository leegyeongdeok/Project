package kk.second.dys.controller;

import kk.second.dys.model.entity.GeneralBoard;
import kk.second.dys.model.entity.OwnerBoard;
import kk.second.dys.model.netowrk.request.GeneralBoardRequest;
import kk.second.dys.model.netowrk.request.OwnerBoardRequest;
import kk.second.dys.model.netowrk.response.GeneralBoardResponse;
import kk.second.dys.model.netowrk.response.OwnerBoardResponse;
import kk.second.dys.service.GeneralBoardPageService;
import kk.second.dys.service.OwnerBoardPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dys")
public class BoardController {

    @Autowired
    OwnerBoardPageService oservice;

    @Autowired
    GeneralBoardPageService gservice;

    @GetMapping({"/Board"})
    public String noticeList(@RequestParam(required = false) String type, @RequestParam(required = false, defaultValue = "") String search,
                             @RequestParam(required = false, defaultValue = "all") String stype, @RequestParam(required = false) String id,
                             @PageableDefault Pageable pageable, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("stype", stype);
        modelMap.addAttribute("search", search);
        if (type.equals("owner")) {
            if (search.equals("")) {
                modelMap.addAttribute("ownerBoard", oservice.findBoardList(pageable));
            } else {
                if (stype.equals("all")) {
                    modelMap.addAttribute("ownerBoard", oservice.searchAllBoardList(pageable, search));
                } else if (stype.equals("title")) {
                    modelMap.addAttribute("ownerBoard", oservice.searchTitleBoardList(pageable, search));

                } else if (stype.equals("content")){
                    modelMap.addAttribute("ownerBoard", oservice.searchContentBoardList(pageable, search));
                }else if(stype.equals("name")){
                    modelMap.addAttribute("ownerBoard", oservice.searchNameBoardList(pageable, search));
                }
            }
            return "customerserviceowner/ownerBoardList";
        } else if (type.equals("general")){
            if (search.equals("")) {
                modelMap.addAttribute("generalBoard", gservice.findBoardList(pageable));
            } else {
                if (stype.equals("all")) {
                    modelMap.addAttribute("generalBoard", gservice.searchAllBoardList(pageable, search));
                } else if (stype.equals("title")) {
                    modelMap.addAttribute("generalBoard", gservice.searchTitleBoardList(pageable, search));

                } else if (stype.equals("content")){
                    modelMap.addAttribute("generalBoard", gservice.searchContentBoardList(pageable, search));
                }else if(stype.equals("name")){
                    modelMap.addAttribute("generalBoard", gservice.searchNicknameBoardList(pageable, search));
                }
            }
            return "customerservicelogin/loginBoardList";
        }else{
            return null;
        }
    }

    @GetMapping("/BoardDetail")
    public String noticeDetail(@RequestParam(required = false) String type, @RequestParam(required = false) String  no, ModelMap modelMap) {
        if (type.equals("owner")){
            Long number = Long.parseLong(no);
            OwnerBoard ownerBoard = oservice.findByOwnerBoardNo(number);
            OwnerBoard beforeOwnerBoard = oservice.findByOwnerBoardNo(number-1);
            OwnerBoard afterOwnerBoard = oservice.findByOwnerBoardNo(number+1);
            modelMap.addAttribute("beforeOwnerBoard", beforeOwnerBoard);
            modelMap.addAttribute("afterOwnerBoard", afterOwnerBoard);
            modelMap.addAttribute("ownerBoardDetail", ownerBoard);

            return "customerserviceowner/ownerBoardDetail";
        }else if(type.equals("general")){
            Long number = Long.parseLong(no);
            GeneralBoard generalBoard = gservice.findByGeneralBoardNo(number);
            GeneralBoard beforeOwnerBoard = gservice.findByGeneralBoardNo(number-1);
            GeneralBoard afterOwnerBoard = gservice.findByGeneralBoardNo(number+1);
            modelMap.addAttribute("beforeGeneralBoard", beforeOwnerBoard);
            modelMap.addAttribute("afterGeneralBoard", afterOwnerBoard);
            modelMap.addAttribute("generalBoardDetail", generalBoard);

            return "customerservicelogin/loginBoardDetail";
        }else{
            return null;
        }
    }

    @PostMapping("/Board/owner/create")
    public OwnerBoardResponse ownerCreate(@RequestBody OwnerBoardRequest request) {

        return oservice.create(request);
    }

    @PostMapping("/Board/general/create")
    public GeneralBoardResponse generalCreate(@RequestBody GeneralBoardRequest request) {

        return gservice.create(request);
    }
}
