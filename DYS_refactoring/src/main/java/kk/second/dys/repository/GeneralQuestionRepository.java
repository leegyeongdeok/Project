package kk.second.dys.repository;

import kk.second.dys.model.entity.GeneralQuestion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface GeneralQuestionRepository extends JpaRepository<GeneralQuestion, Long> {

    GeneralQuestion findByQuestionNo(Long generalQuestionNo);
    Page<GeneralQuestion> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<GeneralQuestion> findAllByContentContains(String content, Pageable pageable);
    Page<GeneralQuestion> findAllByTitleContains(String title, Pageable pageable);
}
