package kk.second.dys.service;

import kk.second.dys.model.entity.question.GeneralQuestion;
import kk.second.dys.model.entity.question.GeneralQuestionReply;
import kk.second.dys.model.entity.question.OwnerQuestion;
import kk.second.dys.model.entity.question.OwnerQuestionReply;
import kk.second.dys.model.network.request.GeneralQuestionRequest;
import kk.second.dys.model.network.request.OwnerQuestionRequest;
import kk.second.dys.model.network.response.GeneralQuestionResponse;
import kk.second.dys.model.network.response.OwnerQuestionResponse;
import kk.second.dys.model.network.response.questionReply.GeneralQuestionReplyResponse;
import kk.second.dys.model.network.response.questionReply.OwnerQuestionReplyResponse;
import kk.second.dys.repository.question.GeneralQuestionRepository;
import kk.second.dys.repository.GeneralUserRepository;
import kk.second.dys.repository.question.OwnerQuestionRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {
    @Autowired
    private OwnerQuestionRepository ownerQuestionRepository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    @Autowired
    private GeneralQuestionRepository generalQuestionRepository;

    @Autowired
    private GeneralUserRepository generalUserRepository;

    public Page<OwnerQuestion> findOwnerQuestion(String account, Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return ownerQuestionRepository.findAllByOwnerUserAccount(account, pageable);
    }

    public Page<OwnerQuestion> searchOwnerByContainsInAll(Pageable pageable, String contains){
        return ownerQuestionRepository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<OwnerQuestion> searchOwnerByContainsInTitle(Pageable pageable, String contains){
        return ownerQuestionRepository.findAllByTitleContains(contains,pageable);
    }

    public Page<OwnerQuestion> searchOwnerByContainsInContain(Pageable pageable, String contains){
        return ownerQuestionRepository.findAllByContentContains(contains,pageable);
    }

    public OwnerQuestion findByOwnerQuestionNo(Long no) {
        return ownerQuestionRepository.findByQuestionNo(no);
    }

    public OwnerQuestionResponse createOwnerQuestion(OwnerQuestionRequest request) {

        OwnerQuestion ownerQuestion = OwnerQuestion.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .ownerUser(ownerUserRepository.getOne(request.getOwnerId()))
                .build();
        ownerQuestionRepository.save(ownerQuestion);
        return responseOwnerQuestion(ownerQuestion);
    }

    private OwnerQuestionResponse responseOwnerQuestion (OwnerQuestion question){
        OwnerQuestionResponse ownerQuestionResponse = OwnerQuestionResponse.builder()
                .title(question.getTitle())
                .content(question.getContent())
                .ownerId(question.getOwnerUser().getOwnerId())
                .build();
        return ownerQuestionResponse;

    }

    public OwnerQuestionReplyResponse responseOwnerReply(OwnerQuestionReply reply){
        OwnerQuestionReplyResponse response = OwnerQuestionReplyResponse.builder()
                .reply(reply.getReply())
                .registeredAt(reply.getRegisteredAt())
                .updatedAt(reply.getUpdatedAt())
                .admin(reply.getAdmin().getAccount())
                .build();
        return response;
    }

    //general question

    public Page<GeneralQuestion> findGeneralQuestion(String account, Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return generalQuestionRepository.findAll(pageable);
    }

    public Page<GeneralQuestion> searchGeneralByContainsInAll(Pageable pageable, String contains){
        return generalQuestionRepository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<GeneralQuestion> searchGeneralByContainsInTitle(Pageable pageable, String contains){
        return generalQuestionRepository.findAllByTitleContains(contains,pageable);
    }

    public Page<GeneralQuestion> searchGeneralByContainsInContain(Pageable pageable, String contains){
        return generalQuestionRepository.findAllByContentContains(contains,pageable);
    }

    public GeneralQuestion findByGeneralQuestionNo(Long no) {

        return generalQuestionRepository.findByQuestionNo(no);
    }



    public GeneralQuestionResponse generalQuestionCreate(GeneralQuestionRequest request) {
        GeneralQuestion generalQuestion = GeneralQuestion.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .generalUser(generalUserRepository.getOne(request.getGeneralId()))
                .build();
        generalQuestionRepository.save(generalQuestion);
        return generalQuestionResponse(generalQuestion);
    }

    private GeneralQuestionResponse generalQuestionResponse (GeneralQuestion question){
        GeneralQuestionResponse generalQuestionResponse = GeneralQuestionResponse.builder()
                .title(question.getTitle())
                .content(question.getContent())
                .generalId(question.getGeneralUser().getGeneralId())
                .build();
        return generalQuestionResponse;

    }

    public GeneralQuestionReplyResponse responseGeneralReply(GeneralQuestionReply reply){
        GeneralQuestionReplyResponse response = GeneralQuestionReplyResponse.builder()
                .reply(reply.getReply())
                .registeredAt(reply.getRegisteredAt())
                .updatedAt(reply.getUpdatedAt())
                .admin(reply.getAdmin().getAccount())
                .build();
        return response;
    }

}
