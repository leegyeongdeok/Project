package kk.second.dys.service;

import kk.second.dys.model.entity.*;
import kk.second.dys.model.netowrk.response.AccommodationResponse;
import kk.second.dys.model.netowrk.response.GeneralUserApiResponse;
import kk.second.dys.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class AdminPageService {

    @Autowired
    private GeneralUserRepository generalUserRepository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private GeneralQuestionRepository generalQuestionRepository;

    @Autowired
    private OwnerQuestionRepository ownerQuestionRepository;

    @Autowired
    private FamousRestaurantRepository famousRestaurantRepository;

    @Autowired
    private AttractionRepository attractionRepository;

    @Autowired
    private CafeRepository cafeRepository;

    @Autowired
    private AccommodationRepository accommodationRepository;

    @Autowired
    private ActivityRepository activityRepository;

    public Page<GeneralUser> findAllGeneral(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return generalUserRepository.findAll(pageable);
    }

    public Page<OwnerUser> findAllOwner(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return ownerUserRepository.findAll(pageable);
    }

    public  Page<Notice> findAllNotice(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return noticeRepository.findAll(pageable);
    }

    public  Page<GeneralQuestion> findAllGeneralQuestion(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return generalQuestionRepository.findAll(pageable);
    }

    public  Page<OwnerQuestion> findAllOwnerQuestion(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return ownerQuestionRepository.findAll(pageable);
    }

    public Page<FamousRestaurant> findAllRestaurant(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return famousRestaurantRepository.findAll(pageable);
    }

    public Page<Activity> findAllActivity(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return activityRepository.findAll(pageable);
    }

    public Page<Cafe> findAllCafe(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return cafeRepository.findAll(pageable);
    }

    public Page<Attraction> findAllAttraction(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return attractionRepository.findAll(pageable);
    }

}