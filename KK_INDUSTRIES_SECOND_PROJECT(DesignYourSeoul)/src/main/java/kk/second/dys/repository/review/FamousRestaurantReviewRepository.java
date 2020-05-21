package kk.second.dys.repository.review;

import kk.second.dys.model.entity.FamousRestaurant;
import kk.second.dys.model.entity.review.FamousRestaurantReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FamousRestaurantReviewRepository extends JpaRepository<FamousRestaurantReview, Long> {

    List<FamousRestaurantReview> findAllByFamousRestaurant(FamousRestaurant famousRestaurant);

}
