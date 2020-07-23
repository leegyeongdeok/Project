package kk.second.dys.repository.question;

import kk.second.dys.model.entity.question.GeneralQuestionReply;
import kk.second.dys.model.entity.question.OwnerQuestion;
import kk.second.dys.model.entity.question.OwnerQuestionReply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface OwnerQuestionReplyRepository extends JpaRepository<OwnerQuestionReply, Long> {

    Optional<OwnerQuestionReply> findByOwnerQuestion(OwnerQuestion ownerQuestion);

    void deleteByOwnerQuestion(OwnerQuestion ownerQuestion);
}
