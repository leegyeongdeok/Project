package kk.second.dys.repository;

import kk.second.dys.model.entity.GeneralBoard;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface GeneralBoardRepository extends JpaRepository<GeneralBoard, Long> {

    GeneralBoard findByGeneralBoardNo(Long generalBoardNo);
    Page<GeneralBoard> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<GeneralBoard> findAllByContentContains(String content, Pageable pageable);
    Page<GeneralBoard> findAllByTitleContains(String title, Pageable pageable);
    Page<GeneralBoard> findAllByGeneralUserNickname(String nickName, Pageable pageable);
}
