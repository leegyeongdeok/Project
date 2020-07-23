package kk.second.dys.repository.board;

import kk.second.dys.model.entity.user.OwnerUser;
import kk.second.dys.model.entity.board.OwnerBoard;
import kk.second.dys.model.entity.board.OwnerBoardReply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface OwnerBoardReplyRepository extends JpaRepository<OwnerBoardReply, Long> {

    List<OwnerBoardReply> findAllByOwnerBoard(OwnerBoard ownerBoard);
    Optional<OwnerBoardReply> findByOwnerBoard(OwnerBoard ownerBoard);
    void deleteAllByOwnerUser(OwnerUser user);
    void deleteAllByOwnerBoard(OwnerBoard board);
}
