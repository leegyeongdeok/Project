package kk.second.dys.service;


import kk.second.dys.model.entity.*;
import kk.second.dys.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikeListService {

    @Autowired
    private LikeListRepository repository;

    @Autowired
    private GeneralUserRepository generalUserRepository;

    @Autowired
    private FamousRestaurantRepository famousRestaurantRepository;
    @Autowired
    private CafeRepository cafeRepository;
    @Autowired
    private ActivityRepository activityRepository;
    @Autowired
    private AttractionRepository attractionRepository;
    @Autowired
    private AccommodationRepository accommodationRepository;

    public void create(String id, String kind, Long themeId) {
        LikeList likeList = LikeList.builder()
                .generalUser(generalUserRepository.findByAccount(id))
                .kind(kind)
                .themeId(themeId)
                .build();
        repository.save(likeList);

    }

    public void delete(String id, String kind, Long themeId){
        LikeList likeList =  repository.findTopByGeneralUserAndKindAndThemeId(generalUserRepository.findByAccount(id), kind, themeId);
        repository.delete(likeList);
    }

    public void updatePlus(String kind, Long themeId){
       if(kind.equals("famousRestaurant")){
           FamousRestaurant theme = famousRestaurantRepository.getOne(themeId);
           theme.setRecommend(theme.getRecommend() + 1);
           famousRestaurantRepository.save(theme);
       }

        if(kind.equals("cafe")){
            Cafe theme = cafeRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() + 1);
            cafeRepository.save(theme);
        }

        if(kind.equals("accommodation")){
            Accommodation theme = accommodationRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() + 1);
            accommodationRepository.save(theme);
        }

        if(kind.equals("attraction")){
            Attraction theme = attractionRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() + 1);
            attractionRepository.save(theme);
        }

        if(kind.equals("activity")){
            Activity theme = activityRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() + 1);
            activityRepository.save(theme);
        }
    }

    public void updateMinus(String kind, Long themeId){
        if(kind.equals("famousRestaurant")){
            FamousRestaurant theme = famousRestaurantRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() - 1);
            famousRestaurantRepository.save(theme);
        }

        if(kind.equals("cafe")){
            Cafe theme = cafeRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() - 1);
            cafeRepository.save(theme);
        }

        if(kind.equals("accommodation")){
            Accommodation theme = accommodationRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() - 1);
            accommodationRepository.save(theme);
        }

        if(kind.equals("attraction")){
            Attraction theme = attractionRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() - 1);
            attractionRepository.save(theme);
        }

        if(kind.equals("activity")){
            Activity theme = activityRepository.getOne(themeId);
            theme.setRecommend(theme.getRecommend() - 1);
            activityRepository.save(theme);
        }
    }

  public List<LikeList> getFamousRestaurant(String account){
        return repository.findAllByGeneralUserAndKind(generalUserRepository.findByAccount(account), "famousRestaurant");
    }

    public List<LikeList> getCafe(String account){
        return repository.findAllByGeneralUserAndKind(generalUserRepository.findByAccount(account), "cafe");
    }

    public List<LikeList> getAccommodation(String account){
        return repository.findAllByGeneralUserAndKind(generalUserRepository.findByAccount(account), "accommodation");
    }
    public List<LikeList> getActivity(String account){
        return repository.findAllByGeneralUserAndKind(generalUserRepository.findByAccount(account), "activity");
    }
    public List<LikeList> getAttraction(String account){
        return repository.findAllByGeneralUserAndKind(generalUserRepository.findByAccount(account), "attraction");
    }




}
