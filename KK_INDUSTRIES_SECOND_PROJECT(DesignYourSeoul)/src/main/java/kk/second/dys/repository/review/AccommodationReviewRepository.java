package kk.second.dys.repository.review;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.themeList.Accommodation;
import kk.second.dys.model.entity.review.AccommodationReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccommodationReviewRepository extends JpaRepository<AccommodationReview, Long> {

    List<AccommodationReview> findAllByAccommodation(Accommodation accommodation);
    void deleteAllByGeneralUser(GeneralUser user);
}
