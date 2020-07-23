package kk.second.dys.repository;
import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.LikeList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface LikeListRepository extends JpaRepository<LikeList, Long> {

    List<LikeList> findAllByGeneralUserAndKind(GeneralUser user, String kind);

    Optional<LikeList> findByGeneralUserAndKindAndThemeId(GeneralUser user, String kind, Long themeId);

    LikeList findTopByGeneralUserAndKindAndThemeId(GeneralUser user, String kind, Long themeId);

    void deleteAllByGeneralUser(GeneralUser user);
}
