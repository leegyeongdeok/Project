package kk.second.dys.repository;

import kk.second.dys.model.entity.OwnerQuestion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OwnerQuestionRepository extends JpaRepository<OwnerQuestion, Long> {

    OwnerQuestion findByOwnerQuestionNo(Long ownerQuestionNo);
    Page<OwnerQuestion> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<OwnerQuestion> findAllByOwnerUserAccount(String account, Pageable pageable);
    Page<OwnerQuestion> findAllByContentContains(String content, Pageable pageable);
    Page<OwnerQuestion> findAllByTitleContains(String title, Pageable pageable);
}
