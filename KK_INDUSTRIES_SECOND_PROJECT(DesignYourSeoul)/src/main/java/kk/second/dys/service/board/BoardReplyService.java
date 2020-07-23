package kk.second.dys.service.board;

import kk.second.dys.model.entity.board.GeneralBoardReply;
import kk.second.dys.model.entity.board.OwnerBoardReply;
import kk.second.dys.model.network.request.boardReply.GeneralBoardReplyRequest;
import kk.second.dys.model.network.request.boardReply.OwnerBoardReplyRequest;
import kk.second.dys.model.network.response.boardReply.GeneralBoardReplyResponse;
import kk.second.dys.model.network.response.boardReply.OwnerBoardReplyResponse;
import kk.second.dys.repository.*;
import kk.second.dys.repository.board.GeneralBoardReplyRepository;
import kk.second.dys.repository.board.GeneralBoardRepository;
import kk.second.dys.repository.board.OwnerBoardReplyRepository;
import kk.second.dys.repository.board.OwnerBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BoardReplyService {

    @Autowired
    private GeneralUserRepository generalUserRepository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    @Autowired
    private GeneralBoardRepository generalBoardRepository;

    @Autowired
    private OwnerBoardRepository ownerBoardRepository;

    @Autowired
    private GeneralBoardReplyRepository generalBoardReplyRepository;

    @Autowired
    private OwnerBoardReplyRepository ownerBoardReplyRepository;


    //general board

    public List<GeneralBoardReplyResponse> findGeneralBoardReply(Long boardId) {

        List<GeneralBoardReply>  generalList=  generalBoardReplyRepository.findAllByGeneralBoard(generalBoardRepository.getOne(boardId));
        List<GeneralBoardReplyResponse> result = new ArrayList<>();

        for (GeneralBoardReply g : generalList){
            result.add(generalBoardReplyResponse(g));
        }
        return result;
    }

    private GeneralBoardReplyResponse generalBoardReplyResponse (GeneralBoardReply reply){

        if(reply == null){
            System.out.println("null");
            return null;
        }else{
            GeneralBoardReplyResponse generalBoardReplyResponse = GeneralBoardReplyResponse.builder()
                    .replyNo(reply.getReplyNo())
                    .reply(reply.getReply())
                    .registeredAt(reply.getRegisteredAt())
                    .generalBoardNo(reply.getGeneralBoard().getBoardNo())
                    .nickname(reply.getGeneralUser().getNickname())
                    .build();
            return generalBoardReplyResponse;
        }
    }

    public GeneralBoardReplyResponse createGeneralReply(GeneralBoardReplyRequest request) {
        GeneralBoardReply reply = GeneralBoardReply.builder()
                .reply(request.getReply())
                .generalBoard(generalBoardRepository.getOne(request.getBoardNo()))
                .generalUser(generalUserRepository.getOne(request.getUserId()))
                .build();

        generalBoardReplyRepository.save(reply);

        return generalBoardReplyResponse(reply);
    }




    //Owner Board

    public List<OwnerBoardReplyResponse> findOwnerBoardReply(Long boardId) {

        List<OwnerBoardReply>  ownerList=  ownerBoardReplyRepository.findAllByOwnerBoard(ownerBoardRepository.getOne(boardId));
        List<OwnerBoardReplyResponse> result = new ArrayList<>();

        for (OwnerBoardReply o : ownerList){
            result.add(ownerBoardReplyResponse(o));
        }
        return result;
    }

    private OwnerBoardReplyResponse ownerBoardReplyResponse (OwnerBoardReply reply){

        if(reply == null){
            System.out.println("null");
            return null;
        }else{
            OwnerBoardReplyResponse ownerBoardReplyResponse = OwnerBoardReplyResponse.builder()
                    .replyNo(reply.getReplyNo())
                    .reply(reply.getReply())
                    .registeredAt(reply.getRegisteredAt())
                    .ownerBoardNo(reply.getOwnerBoard().getBoardNo())
                    .name(reply.getOwnerUser().getName())
                    .build();
            return ownerBoardReplyResponse;
        }
    }


    public OwnerBoardReplyResponse createOwnerReply(OwnerBoardReplyRequest request) {
        OwnerBoardReply reply = OwnerBoardReply.builder()
                .reply(request.getReply())
                .ownerBoard(ownerBoardRepository.getOne(request.getBoardNo()))
                .ownerUser(ownerUserRepository.getOne(request.getUserId()))
                .build();

        ownerBoardReplyRepository.save(reply);

        return ownerBoardReplyResponse(reply);
    }
}
