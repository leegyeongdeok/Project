package kk.second.dys.repository;

import kk.second.dys.model.entity.OwnerBoard;
import kk.second.dys.model.entity.OwnerQuestion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OwnerBoardRepository extends JpaRepository<OwnerBoard, Long> {

    OwnerBoard findByBoardNo(Long ownerBoardNo);
    Page<OwnerBoard> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<OwnerBoard> findAllByOwnerUserAccount(String account, Pageable pageable);
    Page<OwnerBoard> findAllByContentContains(String content, Pageable pageable);
    Page<OwnerBoard> findAllByTitleContains(String title, Pageable pageable);

    Page<OwnerBoard> findAllByOwnerUserName(String contains, Pageable pageable);
}
