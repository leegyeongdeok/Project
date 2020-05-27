package kk.second.dys.function;

import kk.second.dys.model.netowrk.request.GeneralBoardReplyRequest;
import kk.second.dys.model.netowrk.request.OwnerBoardReplyRequest;
import kk.second.dys.model.netowrk.response.GeneralBoardReplyResponse;
import kk.second.dys.model.netowrk.response.OwnerBoardReplyResponse;
import kk.second.dys.service.GeneralBoardReplyService;
import kk.second.dys.service.OwnerBoardReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/function/reply/")
public class RelyFunction {


    @Autowired
    private OwnerBoardReplyService oservice;


    @Autowired
    private GeneralBoardReplyService gservice;

    @PostMapping("ownerBoard")
    public OwnerBoardReplyResponse ownerReply(@RequestBody OwnerBoardReplyRequest reply) {
        return oservice.create(reply);
    }

    @PostMapping("generalBoard")
    public GeneralBoardReplyResponse generalReply(@RequestBody GeneralBoardReplyRequest reply) {
        return gservice.create(reply);
    }
}
