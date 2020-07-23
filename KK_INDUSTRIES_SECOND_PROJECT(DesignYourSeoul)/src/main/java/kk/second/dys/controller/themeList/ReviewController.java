package kk.second.dys.controller.themeList;

import kk.second.dys.model.network.request.review.*;
import kk.second.dys.model.network.response.review.*;
import kk.second.dys.service.themeList.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/review")
public class ReviewController {

    @Autowired
    private ReviewService service;


    @PostMapping("/create/food")
    public FamousRestaurantReviewApiResponse createFoodReview(@RequestBody FamousRestaurantReviewApiRequest request) {

        return service.createRestaurantReview(request);
    }

    @PostMapping("/create/cafe")
    public CafeReviewApiResponse createCafeReview(@RequestBody CafeReviewApiRequest request) {

        return service.createCafeReview(request);
    }

    @PostMapping("/create/activity")
    public ActivityReviewApiResponse createCafeReview(@RequestBody ActivityReviewApiRequest request) {

        return service.createActivityReview(request);
    }

    @PostMapping("/create/attraction")
    public AttractionReviewApiResponse createAttractionReview(@RequestBody AttractionReviewApiRequest request) {

        return service.createAttractionReview(request);
    }

    @PostMapping("/create/accommodation")
    public AccommodationReviewApiResponse createAccommodationReview(@RequestBody AccommodationReviewApiRequest request) {

        return service.createAccommodationReview(request);
    }



}
