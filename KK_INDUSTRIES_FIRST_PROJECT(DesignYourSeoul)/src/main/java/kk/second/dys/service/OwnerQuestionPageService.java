package kk.second.dys.service;

import kk.second.dys.model.entity.OwnerQuestion;
import kk.second.dys.model.netowrk.request.OwnerQuestionRequest;
import kk.second.dys.model.netowrk.response.OwnerQuestionResponse;
import kk.second.dys.repository.OwnerQuestionRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class OwnerQuestionPageService {

    @Autowired
    private OwnerQuestionRepository repository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    public Page<OwnerQuestion> findNoticeList(String account, Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
                return repository.findAllByOwnerUserAccount(account, pageable);
    }

    public Page<OwnerQuestion> searchAllNoticeList(Pageable pageable, String contains){
        return repository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<OwnerQuestion> searchTitleNoticeList(Pageable pageable, String contains){
        return repository.findAllByTitleContains(contains,pageable);
    }

    public Page<OwnerQuestion> searchContentNoticeList(Pageable pageable, String contains){
        return repository.findAllByContentContains(contains,pageable);
    }

    public OwnerQuestion findByOwnerQuestionNo(Long no) {
        return repository.findByOwnerQuestionNo(no);
    }

    public OwnerQuestionResponse create(OwnerQuestionRequest request) {

        OwnerQuestion ownerQuestion = OwnerQuestion.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .ownerUser(ownerUserRepository.getOne(request.getOwnerId()))
                .build();
        repository.save(ownerQuestion);
        return response(ownerQuestion);
    }

    private OwnerQuestionResponse response (OwnerQuestion question){
        OwnerQuestionResponse ownerQuestionResponse = OwnerQuestionResponse.builder()
                .title(question.getTitle())
                .content(question.getContent())
                .ownerId(question.getOwnerUser().getOwnerId())
                .build();
        return ownerQuestionResponse;

    }
}
