package kk.second.dys.service;

import kk.second.dys.model.entity.review.*;
import kk.second.dys.model.network.request.review.*;
import kk.second.dys.model.network.response.review.*;
import kk.second.dys.repository.*;
import kk.second.dys.repository.review.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReviewService {

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

    @Autowired
    private FamousRestaurantReviewRepository famousRestaurantReviewRepository;

    @Autowired
    private CafeReviewRepository cafeReviewRepository;

    @Autowired
    private ActivityReviewRepository activityReviewRepository;

    @Autowired
    private AttractionReviewRepository attractionReviewRepository;

    @Autowired
    private AccommodationReviewRepository accommodationReviewRepository;



// famous_restaurant
    public List<FamousRestaurantReviewApiResponse> findFoodReview(Long themeId) {
        List<FamousRestaurantReview>  famousRestaurantReviewList=  famousRestaurantReviewRepository.findAllByFamousRestaurant(famousRestaurantRepository.getOne(themeId));
        List<FamousRestaurantReviewApiResponse> result = new ArrayList<>();

        for (FamousRestaurantReview f:famousRestaurantReviewList){
            result.add(FoodReviewResponse(f));
        }
        return result;
    }

    private FamousRestaurantReviewApiResponse FoodReviewResponse (FamousRestaurantReview review){

        if(review == null){
            System.out.println("null");
            return null;
        }else{
            FamousRestaurantReviewApiResponse famousRestaurantReviewApiResponse = FamousRestaurantReviewApiResponse.builder()
                    .reviewId(review.getReviewId())
                    .content(review.getContent())
                    .registeredAt(review.getRegisteredAt())
                    .famousRestaurantId(review.getFamousRestaurant().getFamousRestaurantId())
                    .nickName(review.getGeneralUser().getNickname())
                    .build();
            return famousRestaurantReviewApiResponse;
        }
    }

    public FamousRestaurantReviewApiResponse createRestaurantReview(FamousRestaurantReviewApiRequest request) {
        FamousRestaurantReview review = FamousRestaurantReview.builder()
                .content(request.getContent())
                .famousRestaurant(famousRestaurantRepository.getOne(request.getFamousRestaurantId()))
                .generalUser(generalUserRepository.getOne(request.getUserId()))
                .build();
        famousRestaurantReviewRepository.save(review);

        return FoodReviewResponse(review);
    }

    //cafe
    public List<CafeReviewApiResponse> findCafeReview(Long themeId) {
        List<CafeReview>  cafeReviewList=  cafeReviewRepository.findAllByCafe(cafeRepository.getOne(themeId));
        List<CafeReviewApiResponse> result = new ArrayList<>();

        for (CafeReview c:cafeReviewList){
            result.add(CafeReviewResponse(c));
        }
        return result;
    }

    private CafeReviewApiResponse CafeReviewResponse (CafeReview review){

        if(review == null){
            System.out.println("null");
            return null;
        }else{
            CafeReviewApiResponse cafeReviewApiResponse = CafeReviewApiResponse.builder()
                    .reviewId(review.getReviewId())
                    .content(review.getContent())
                    .registeredAt(review.getRegisteredAt())
                    .cafeId(review.getCafe().getCafeId())
                    .nickName(review.getGeneralUser().getNickname())
                    .build();
            return cafeReviewApiResponse;
        }
    }

    public CafeReviewApiResponse createCafeReview(CafeReviewApiRequest request) {
        CafeReview review = CafeReview.builder()
                .content(request.getContent())
                .cafe(cafeRepository.getOne(request.getCafeId()))
                .generalUser(generalUserRepository.getOne(request.getUserId()))
                .build();
        cafeReviewRepository.save(review);

        return CafeReviewResponse(review);
    }



    //activity
    public List<ActivityReviewApiResponse> findActivityReview(Long themeId) {
        List<ActivityReview>  activityReviewList=  activityReviewRepository.findAllByActivity(activityRepository.getOne(themeId));
        List<ActivityReviewApiResponse> result = new ArrayList<>();

        for (ActivityReview ac:activityReviewList){
            result.add(ActivityReviewResponse(ac));
        }
        return result;
    }

    private ActivityReviewApiResponse ActivityReviewResponse (ActivityReview review){

        if(review == null){
            System.out.println("null");
            return null;
        }else{
            ActivityReviewApiResponse activityReviewApiResponse = ActivityReviewApiResponse.builder()
                    .reviewId(review.getReviewId())
                    .content(review.getContent())
                    .registeredAt(review.getRegisteredAt())
                    .activityId(review.getActivity().getActivityId())
                    .nickName(review.getGeneralUser().getNickname())
                    .build();
            return activityReviewApiResponse;
        }
    }

    public ActivityReviewApiResponse createActivityReview(ActivityReviewApiRequest request) {
        ActivityReview review = ActivityReview.builder()
                .content(request.getContent())
                .activity(activityRepository.getOne(request.getActivityId()))
                .generalUser(generalUserRepository.getOne(request.getUserId()))
                .build();
        activityReviewRepository.save(review);

        return ActivityReviewResponse(review);
    }


    //attraction
    public List<AttractionReviewApiResponse> findAttractionReview(Long themeId) {
        List<AttractionReview>  attractionReviewList=  attractionReviewRepository.findAllByAttraction(attractionRepository.getOne(themeId));
        List<AttractionReviewApiResponse> result = new ArrayList<>();

        for (AttractionReview att:attractionReviewList){
            result.add(AttractionReviewResponse(att));
        }
        return result;
    }

    private AttractionReviewApiResponse AttractionReviewResponse (AttractionReview review){

        if(review == null){
            System.out.println("null");
            return null;
        }else{
            AttractionReviewApiResponse attractionReviewApiResponse = AttractionReviewApiResponse.builder()
                    .reviewId(review.getReviewId())
                    .content(review.getContent())
                    .registeredAt(review.getRegisteredAt())
                    .attractionId(review.getAttraction().getAttractionId())
                    .nickName(review.getGeneralUser().getNickname())
                    .build();
            return attractionReviewApiResponse;
        }
    }

    public AttractionReviewApiResponse createAttractionReview(AttractionReviewApiRequest request) {
        AttractionReview review = AttractionReview.builder()
                .content(request.getContent())
                .attraction(attractionRepository.getOne(request.getAttractionId()))
                .generalUser(generalUserRepository.getOne(request.getUserId()))
                .build();
        attractionReviewRepository.save(review);

        return AttractionReviewResponse(review);
    }


    //accommodation
    public List<AccommodationReviewApiResponse> findAccommodationReview(Long themeId) {
        List<AccommodationReview>  accommodationReviewList=  accommodationReviewRepository.findAllByAccommodation(accommodationRepository.getOne(themeId));
        List<AccommodationReviewApiResponse> result = new ArrayList<>();

        for (AccommodationReview accomm:accommodationReviewList){
            result.add(AccommodationReviewResponse(accomm));
        }
        return result;
    }

    private AccommodationReviewApiResponse AccommodationReviewResponse (AccommodationReview review){

        if(review == null){
            System.out.println("null");
            return null;
        }else{
            AccommodationReviewApiResponse accommodationReviewApiResponse = AccommodationReviewApiResponse.builder()
                    .reviewId(review.getReviewId())
                    .content(review.getContent())
                    .registeredAt(review.getRegisteredAt())
                    .accommodationId(review.getAccommodation().getAccommodationId())
                    .nickName(review.getGeneralUser().getNickname())
                    .build();
            return accommodationReviewApiResponse;
        }
    }

    public AccommodationReviewApiResponse createAccommodationReview(AccommodationReviewApiRequest request) {
        AccommodationReview review = AccommodationReview.builder()
                .content(request.getContent())
                .accommodation(accommodationRepository.getOne(request.getAccommodationId()))
                .generalUser(generalUserRepository.getOne(request.getUserId()))
                .build();
        accommodationReviewRepository.save(review);

        return AccommodationReviewResponse(review);
    }

}
