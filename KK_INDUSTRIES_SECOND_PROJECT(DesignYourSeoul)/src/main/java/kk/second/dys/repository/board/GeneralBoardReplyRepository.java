package kk.second.dys.repository.board;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.board.GeneralBoard;
import kk.second.dys.model.entity.board.GeneralBoardReply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface GeneralBoardReplyRepository extends JpaRepository<GeneralBoardReply, Long> {

    List<GeneralBoardReply> findAllByGeneralBoard(GeneralBoard generalBoard);


    void deleteAllByGeneralUser(GeneralUser user);

    void deleteAllByGeneralBoard(GeneralBoard board);
}
