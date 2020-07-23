package kk.second.dys.controller.board;

import kk.second.dys.model.entity.board.OwnerBoard;
import kk.second.dys.model.network.request.OwnerBoardRequest;
import kk.second.dys.model.network.response.OwnerBoardResponse;
import kk.second.dys.service.board.BoardReplyService;
import kk.second.dys.service.board.OwnerBoardPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/dys/owner")
public class OwnerBoardController {

    @Autowired
    OwnerBoardPageService oservice;

    @Autowired
    private BoardReplyService boardReplyService;


    @GetMapping("/board")
    public String noticeList(@RequestParam(required = false, defaultValue = "") String search,
                             @RequestParam(required = false, defaultValue = "all") String searchType, @PageableDefault Pageable pageable, ModelMap modelMap,
                             HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");

        modelMap.addAttribute("search", search);

        if (search.equals("")) {
            modelMap.addAttribute("board", oservice.findBoardList(pageable));
        } else {
            if (searchType.equals("all")) {
                modelMap.addAttribute("board", oservice.searchAllBoardList(pageable, search));
            } else if (searchType.equals("title")) {
                modelMap.addAttribute("board", oservice.searchTitleBoardList(pageable, search));

            } else if (searchType.equals("content")) {
                modelMap.addAttribute("board", oservice.searchContentBoardList(pageable, search));
            } else if (searchType.equals("name")) {
                modelMap.addAttribute("board", oservice.searchNameBoardList(pageable, search));
            }
        }

        return "ownerService/ownerBoard";
    }

    @GetMapping("/board/detail")
    public String noticeDetail(@RequestParam(required = false) String no, ModelMap modelMap, HttpServletRequest request) {

        String account = (String) request.getSession().getAttribute("ACCOUNT");

        Long number = Long.parseLong(no);

        OwnerBoard ownerBoard = oservice.findByOwnerBoardNo(number);
        OwnerBoard beforeOwnerBoard = oservice.findByOwnerBoardNo(number - 1);
        OwnerBoard afterOwnerBoard = oservice.findByOwnerBoardNo(number + 1);
        modelMap.addAttribute("beforeBoard", beforeOwnerBoard);
        modelMap.addAttribute("afterBoard", afterOwnerBoard);
        modelMap.addAttribute("boardDetail", ownerBoard);
        modelMap.addAttribute("replyList", boardReplyService.findOwnerBoardReply(number));

        return "ownerService/ownerBoardDetail";

    }

    @GetMapping("/board/write")
    public String questionWriting() {
        return "ownerService/ownerBoardWriting";
    }

}
