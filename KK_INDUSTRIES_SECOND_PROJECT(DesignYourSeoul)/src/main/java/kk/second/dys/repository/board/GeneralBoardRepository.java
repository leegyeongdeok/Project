package kk.second.dys.repository.board;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.board.GeneralBoard;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface GeneralBoardRepository extends JpaRepository<GeneralBoard, Long> {

    GeneralBoard findByBoardNo(Long generalBoardNo);
    Page<GeneralBoard> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<GeneralBoard> findAllByContentContains(String content, Pageable pageable);
    Page<GeneralBoard> findAllByTitleContains(String title, Pageable pageable);
    Page<GeneralBoard> findAllByGeneralUserNickname(String nickName, Pageable pageable);
    void deleteAllByGeneralUser(GeneralUser user);

    List<GeneralBoard> findAllByGeneralUser(GeneralUser user);
}
