package kk.second.dys.repository.review;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.themeList.Cafe;
import kk.second.dys.model.entity.review.CafeReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CafeReviewRepository extends JpaRepository<CafeReview, Long> {

    List<CafeReview> findAllByCafe(Cafe cafe);
    void deleteAllByGeneralUser(GeneralUser user);
}
