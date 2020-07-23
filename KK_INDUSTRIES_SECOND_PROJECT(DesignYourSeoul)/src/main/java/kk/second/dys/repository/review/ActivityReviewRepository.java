package kk.second.dys.repository.review;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.themeList.Activity;
import kk.second.dys.model.entity.review.ActivityReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivityReviewRepository extends JpaRepository<ActivityReview, Long> {

    List<ActivityReview> findAllByActivity(Activity activity);
    void deleteAllByGeneralUser(GeneralUser user);
}
