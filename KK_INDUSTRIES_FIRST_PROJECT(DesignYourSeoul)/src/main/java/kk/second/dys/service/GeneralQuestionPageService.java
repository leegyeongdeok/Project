package kk.second.dys.service;

import kk.second.dys.model.entity.GeneralQuestion;
import kk.second.dys.model.entity.OwnerQuestion;
import kk.second.dys.model.netowrk.request.GeneralQuestionRequest;
import kk.second.dys.model.netowrk.request.OwnerQuestionRequest;
import kk.second.dys.model.netowrk.response.GeneralQuestionResponse;
import kk.second.dys.model.netowrk.response.OwnerQuestionResponse;
import kk.second.dys.repository.GeneralQuestionRepository;
import kk.second.dys.repository.GeneralUserRepository;
import kk.second.dys.repository.OwnerQuestionRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class GeneralQuestionPageService {

    @Autowired
    private GeneralQuestionRepository repository;

    @Autowired
    private GeneralUserRepository generalUserRepository;

    public Page<GeneralQuestion> findNoticeList(String account, Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
                return repository.findAll(pageable);
    }

    public Page<GeneralQuestion> searchAllNoticeList(Pageable pageable, String contains){
        return repository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<GeneralQuestion> searchTitleNoticeList(Pageable pageable, String contains){
        return repository.findAllByTitleContains(contains,pageable);
    }

    public Page<GeneralQuestion> searchContentNoticeList(Pageable pageable, String contains){
        return repository.findAllByContentContains(contains,pageable);
    }

    public GeneralQuestion findByGeneralQuestionNo(Long no) {

        return repository.findByGeneralQuestionNo(no);
    }



    public GeneralQuestionResponse create(GeneralQuestionRequest request) {
        GeneralQuestion generalQuestion = GeneralQuestion.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .generalUser(generalUserRepository.getOne(request.getGeneralId()))
                .build();
        repository.save(generalQuestion);
        return response(generalQuestion);
    }

    private GeneralQuestionResponse response (GeneralQuestion question){
        GeneralQuestionResponse generalQuestionResponse = GeneralQuestionResponse.builder()
                .title(question.getTitle())
                .content(question.getContent())
                .generalId(question.getGeneralUser().getGeneralId())
                .build();
        return generalQuestionResponse;

    }
}
