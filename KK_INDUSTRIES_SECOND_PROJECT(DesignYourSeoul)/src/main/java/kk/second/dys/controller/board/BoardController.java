package kk.second.dys.controller.board;

import kk.second.dys.model.entity.board.GeneralBoard;
import kk.second.dys.service.board.BoardReplyService;
import kk.second.dys.service.board.GeneralBoardPageService;
import kk.second.dys.service.board.OwnerBoardPageService;
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

    @Autowired
    private BoardReplyService boardReplyService;

    @GetMapping("/board")
    public String noticeList(@RequestParam(required = false, defaultValue = "") String search,
                             @RequestParam(required = false, defaultValue = "all") String searchType, @PageableDefault Pageable pageable, ModelMap modelMap,
                             HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");
        String type = (String) request.getSession().getAttribute("TYPE");

        modelMap.addAttribute("search", search);

        if (search.equals("")) {
            modelMap.addAttribute("board", gservice.findBoardList(pageable));
        } else {
            if (searchType.equals("all")) {
                modelMap.addAttribute("board", gservice.searchAllBoardList(pageable, search));
            } else if (searchType.equals("title")) {
                modelMap.addAttribute("board", gservice.searchTitleBoardList(pageable, search));

            } else if (searchType.equals("content")) {
                modelMap.addAttribute("board", gservice.searchContentBoardList(pageable, search));
            } else if (searchType.equals("name")) {
                modelMap.addAttribute("board", gservice.searchNicknameBoardList(pageable, search));
            }
        }
        return "customerService/board";
    }

    @GetMapping("/board/detail")
    public String noticeDetail(@RequestParam(required = false) String no, ModelMap modelMap, HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");
        String type = (String) request.getSession().getAttribute("TYPE");


        Long number = Long.parseLong(no);
        GeneralBoard generalBoard = gservice.findByGeneralBoardNo(number);
        GeneralBoard beforeOwnerBoard = gservice.findByGeneralBoardNo(number - 1);
        GeneralBoard afterOwnerBoard = gservice.findByGeneralBoardNo(number + 1);
        modelMap.addAttribute("beforeBoard", beforeOwnerBoard);
        modelMap.addAttribute("afterBoard", afterOwnerBoard);
        modelMap.addAttribute("boardDetail", generalBoard);
        modelMap.addAttribute("replyList", boardReplyService.findGeneralBoardReply(number));

        return "customerService/boardDetail";

    }

    @GetMapping("/board/write")
    public String questionWriting() {
        return "customerService/boardWriting";
    }

}
