package kk.second.dys.function;

import kk.second.dys.model.network.request.GeneralBoardRequest;
import kk.second.dys.model.network.request.GeneralQuestionRequest;
import kk.second.dys.model.network.request.OwnerBoardRequest;
import kk.second.dys.model.network.request.OwnerQuestionRequest;
import kk.second.dys.model.network.response.GeneralBoardResponse;
import kk.second.dys.model.network.response.GeneralQuestionResponse;
import kk.second.dys.model.network.response.OwnerBoardResponse;
import kk.second.dys.model.network.response.OwnerQuestionResponse;
import kk.second.dys.service.board.GeneralBoardPageService;
import kk.second.dys.service.board.OwnerBoardPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/function")
public class BoardFunction {

    @Autowired
    private GeneralBoardPageService generalBoardPageService;

    @Autowired
    private OwnerBoardPageService ownerBoardPageService;

    @PostMapping("/board/general/create")
    public GeneralBoardResponse createGeneral(@RequestBody GeneralBoardRequest request) {

        return generalBoardPageService.create(request);
    }

    @PostMapping("/board/owner/create")
    public OwnerBoardResponse createOwner(@RequestBody OwnerBoardRequest request) {

        return ownerBoardPageService.create(request);
    }

}
