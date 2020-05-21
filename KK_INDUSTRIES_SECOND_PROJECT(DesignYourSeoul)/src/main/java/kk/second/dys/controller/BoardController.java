package kk.second.dys.controller;

import kk.second.dys.model.entity.GeneralBoard;
import kk.second.dys.model.entity.OwnerBoard;
import kk.second.dys.model.network.request.GeneralBoardRequest;
import kk.second.dys.model.network.request.OwnerBoardRequest;
import kk.second.dys.model.network.response.GeneralBoardResponse;
import kk.second.dys.model.network.response.OwnerBoardResponse;
import kk.second.dys.service.GeneralBoardPageService;
import kk.second.dys.service.OwnerBoardPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/dys")
public class BoardController {

    @Autowired
    OwnerBoardPageService oservice;

    @Autowired
    GeneralBoardPageService gservice;

    @GetMapping("/board")
    public String noticeList(@RequestParam(required = false, defaultValue = "") String search,
                             @RequestParam(required = false, defaultValue = "all") String searchType, @PageableDefault Pageable pageable, ModelMap modelMap,
                             HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");
        String type = (String) request.getSession().getAttribute("TYPE");
        if(type == null){
            type = "general";
        }

        modelMap.addAttribute("search", search);
        if (type.equals("owner")) {
            if (search.equals("")) {
                modelMap.addAttribute("board", oservice.findBoardList(pageable));
            } else {
                if (searchType.equals("all")) {
                    modelMap.addAttribute("board", oservice.searchAllBoardList(pageable, search));
                } else if (searchType.equals("title")) {
                    modelMap.addAttribute("board", oservice.searchTitleBoardList(pageable, search));

                } else if (searchType.equals("content")){
                    modelMap.addAttribute("board", oservice.searchContentBoardList(pageable, search));
                }else if(searchType.equals("name")){
                    modelMap.addAttribute("board", oservice.searchNameBoardList(pageable, search));
                }
            }

        } else{
            if (search.equals("")) {
                modelMap.addAttribute("board", gservice.findBoardList(pageable));
            } else {
                if (searchType.equals("all")) {
                    modelMap.addAttribute("board", gservice.searchAllBoardList(pageable, search));
                } else if (searchType.equals("title")) {
                    modelMap.addAttribute("board", gservice.searchTitleBoardList(pageable, search));

                } else if (searchType.equals("content")){
                    modelMap.addAttribute("board", gservice.searchContentBoardList(pageable, search));
                }else if(searchType.equals("name")){
                    modelMap.addAttribute("board", gservice.searchNicknameBoardList(pageable, search));
                }
            }
        }
        return "customerService/board";
    }

    @GetMapping("/board/detail")
    public String noticeDetail(@RequestParam(required = false) String no, ModelMap modelMap, HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");
        String type = (String) request.getSession().getAttribute("TYPE");
        if(type == null){
            type = "general";
        }

        if (type.equals("owner")){
            Long number = Long.parseLong(no);
            OwnerBoard ownerBoard = oservice.findByOwnerBoardNo(number);
            OwnerBoard beforeOwnerBoard = oservice.findByOwnerBoardNo(number-1);
            OwnerBoard afterOwnerBoard = oservice.findByOwnerBoardNo(number+1);
            modelMap.addAttribute("beforeBoard", beforeOwnerBoard);
            modelMap.addAttribute("afterBoard", afterOwnerBoard);
            modelMap.addAttribute("boardDetail", ownerBoard);

            return "customerService/boardDetail";
        }else{
            Long number = Long.parseLong(no);
            GeneralBoard generalBoard = gservice.findByGeneralBoardNo(number);
            GeneralBoard beforeOwnerBoard = gservice.findByGeneralBoardNo(number-1);
            GeneralBoard afterOwnerBoard = gservice.findByGeneralBoardNo(number+1);
            modelMap.addAttribute("beforeBoard", beforeOwnerBoard);
            modelMap.addAttribute("afterBoard", afterOwnerBoard);
            modelMap.addAttribute("boardDetail", generalBoard);

            return "customerService/boardDetail";
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
