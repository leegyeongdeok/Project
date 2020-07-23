package kk.second.dys.repository.board;

import kk.second.dys.model.entity.user.OwnerUser;
import kk.second.dys.model.entity.board.OwnerBoard;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OwnerBoardRepository extends JpaRepository<OwnerBoard, Long> {

    OwnerBoard findByBoardNo(Long ownerBoardNo);
    Page<OwnerBoard> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<OwnerBoard> findAllByOwnerUserAccount(String account, Pageable pageable);
    Page<OwnerBoard> findAllByContentContains(String content, Pageable pageable);
    Page<OwnerBoard> findAllByTitleContains(String title, Pageable pageable);

    Page<OwnerBoard> findAllByOwnerUserName(String contains, Pageable pageable);
    List<OwnerBoard> findAllByOwnerUser(OwnerUser user);

    void deleteAllByOwnerUser(OwnerUser user);
}
