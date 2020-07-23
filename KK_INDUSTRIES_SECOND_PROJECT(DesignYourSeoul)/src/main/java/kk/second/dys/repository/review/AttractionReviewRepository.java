package kk.second.dys.repository.review;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.themeList.Attraction;
import kk.second.dys.model.entity.review.AttractionReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AttractionReviewRepository extends JpaRepository<AttractionReview, Long> {

    List<AttractionReview> findAllByAttraction(Attraction attraction);
    void deleteAllByGeneralUser(GeneralUser user);
}
