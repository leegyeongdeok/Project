package kk.second.dys.repository;

import kk.second.dys.model.entity.GeneralBoardReply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface GeneralBoardReplyRepository extends JpaRepository<GeneralBoardReply, Long> {
}
