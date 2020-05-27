package kk.second.dys.service;

import kk.second.dys.model.entity.OwnerBoard;
import kk.second.dys.model.entity.OwnerBoardReply;
import kk.second.dys.model.entity.OwnerQuestion;
import kk.second.dys.model.netowrk.request.OwnerBoardReplyRequest;
import kk.second.dys.model.netowrk.request.OwnerQuestionRequest;
import kk.second.dys.model.netowrk.response.OwnerBoardReplyResponse;
import kk.second.dys.model.netowrk.response.OwnerQuestionResponse;
import kk.second.dys.repository.OwnerBoardReplyRepository;
import kk.second.dys.repository.OwnerBoardRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class OwnerBoardReplyService {

    @Autowired
    private OwnerBoardReplyRepository repository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    @Autowired
    private OwnerBoardRepository ownerBoardRepository;

    public Page<OwnerBoardReply> findBoardList(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());

        return repository.findAll(pageable);
    }

    /*public Page<OwnerBoardReply> searchAllBoardList(Pageable pageable, String contains){
        return repository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<OwnerBoardReply> searchTitleBoardList(Pageable pageable, String contains){
        return repository.findAllByTitleContains(contains,pageable);
    }

    public Page<OwnerBoardReply> searchContentBoardList(Pageable pageable, String contains){
        return repository.findAllByContentContains(contains,pageable);
    }

    public Page<OwnerBoardReply> searchNameBoardList(Pageable pageable, String contains){
        return repository.findAllByOwnerUserName(contains,pageable);
    }*/

    /*public OwnerBoard findByOwnerBoardNo(Long no) {
        return repository.findByOwnerBoardNo(no);
    }*/

    public OwnerBoardReplyResponse create(OwnerBoardReplyRequest request) {

        OwnerBoardReply ownerBoardReply = OwnerBoardReply.builder()
                .reply(request.getReply())
                .ownerUser(ownerUserRepository.getOne(request.getOwnerId()))
                .ownerBoard(ownerBoardRepository.getOne(request.getOwnerBoardNo()))
                .build();

        repository.save(ownerBoardReply);
            return response(ownerBoardReply);
    }

    private OwnerBoardReplyResponse  response (OwnerBoardReply reply){
        OwnerBoardReplyResponse ownerQuestionResponse = OwnerBoardReplyResponse.builder()
                .ownerBoardReplyNo(reply.getOwnerBoardReplyNo())
                .reply(reply.getReply())
                .registeredAt(reply.getRegisteredAt())
                .updatedAt(reply.getUpdatedAt())
                .ownerBoardNo(reply.getOwnerBoard().getOwnerBoardNo())
                .ownerId(reply.getOwnerUser().getOwnerId())
                .build();
        return ownerQuestionResponse;

    }
}
