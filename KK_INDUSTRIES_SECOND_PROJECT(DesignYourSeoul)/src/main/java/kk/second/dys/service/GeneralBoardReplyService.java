package kk.second.dys.service;

import kk.second.dys.model.entity.GeneralBoardReply;
import kk.second.dys.model.network.request.GeneralBoardReplyRequest;
import kk.second.dys.model.network.response.GeneralBoardReplyResponse;
import kk.second.dys.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class GeneralBoardReplyService {

    @Autowired
    private GeneralBoardReplyRepository repository;

    @Autowired
    private GeneralUserRepository generalUserRepository;

    @Autowired
    private GeneralBoardRepository generalBoardRepository;

    public Page<GeneralBoardReply> findBoardList(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());

        return repository.findAll(pageable);
    }

    public GeneralBoardReplyResponse create(GeneralBoardReplyRequest request) {

        GeneralBoardReply generalBoardReply = GeneralBoardReply.builder()
                .reply(request.getReply())
                .generalUser(generalUserRepository.getOne(request.getGeneralId()))
                .generalBoard(generalBoardRepository.getOne(request.getGeneralBoardNo()))
                .build();

            repository.save(generalBoardReply);
            return response(generalBoardReply);
    }

    private GeneralBoardReplyResponse  response (GeneralBoardReply reply){
        GeneralBoardReplyResponse generalBoardReplyResponse = GeneralBoardReplyResponse.builder()
                .generalBoardReplyNo(reply.getGeneralBoardReplyNo())
                .reply(reply.getReply())
                .registeredAt(reply.getRegisteredAt())
                .updatedAt(reply.getUpdatedAt())
                .generalBoardNo(reply.getGeneralBoard().getBoardNo())
                .generalId(reply.getGeneralUser().getGeneralId())
                .build();
        return generalBoardReplyResponse;

    }
}
