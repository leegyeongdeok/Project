package kk.second.dys.repository;

import kk.second.dys.model.entity.OwnerBoardReply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OwnerBoardReplyRepository extends JpaRepository<OwnerBoardReply, Long> {
}
