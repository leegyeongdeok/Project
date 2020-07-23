package kk.second.dys.controller.board;

import kk.second.dys.model.network.request.boardReply.GeneralBoardReplyRequest;
import kk.second.dys.model.network.request.boardReply.OwnerBoardReplyRequest;
import kk.second.dys.model.network.response.boardReply.GeneralBoardReplyResponse;
import kk.second.dys.model.network.response.boardReply.OwnerBoardReplyResponse;
import kk.second.dys.service.board.BoardReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/reply")
public class ReplyController {

    @Autowired
    private BoardReplyService service;


    @PostMapping("/create/general")
    public GeneralBoardReplyResponse createGeneralBoardReply(@RequestBody GeneralBoardReplyRequest request) {

        return service.createGeneralReply(request);
    }

    @PostMapping("/create/owner")
    public OwnerBoardReplyResponse createOwnerBoardReply(@RequestBody OwnerBoardReplyRequest request) {

        return service.createOwnerReply(request);
    }

}
