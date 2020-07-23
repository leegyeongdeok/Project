package kk.second.dys.repository.question;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.question.GeneralQuestion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface GeneralQuestionRepository extends JpaRepository<GeneralQuestion, Long> {

    GeneralQuestion findByQuestionNo(Long generalQuestionNo);
    Page<GeneralQuestion> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<GeneralQuestion> findAllByContentContains(String content, Pageable pageable);
    Page<GeneralQuestion> findAllByTitleContains(String title, Pageable pageable);
    void deleteAllByGeneralUser(GeneralUser user);

    List<GeneralQuestion> findAllByGeneralUser(GeneralUser user);
}
