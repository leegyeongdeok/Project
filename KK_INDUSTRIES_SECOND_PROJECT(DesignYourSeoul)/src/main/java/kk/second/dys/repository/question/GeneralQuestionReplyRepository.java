package kk.second.dys.repository.question;

import kk.second.dys.model.entity.question.GeneralQuestion;
import kk.second.dys.model.entity.question.GeneralQuestionReply;
import kk.second.dys.model.entity.question.OwnerQuestion;
import kk.second.dys.model.entity.question.OwnerQuestionReply;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface GeneralQuestionReplyRepository extends JpaRepository<GeneralQuestionReply, Long> {
    Optional<GeneralQuestionReply> findByGeneralQuestion(GeneralQuestion generalQuestion);
}
