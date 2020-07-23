package kk.second.dys.repository.question;

import kk.second.dys.model.entity.user.OwnerUser;
import kk.second.dys.model.entity.question.OwnerQuestion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OwnerQuestionRepository extends JpaRepository<OwnerQuestion, Long> {

    OwnerQuestion findByQuestionNo(Long ownerQuestionNo);
    Page<OwnerQuestion> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<OwnerQuestion> findAllByOwnerUserAccount(String account, Pageable pageable);
    Page<OwnerQuestion> findAllByContentContains(String content, Pageable pageable);
    Page<OwnerQuestion> findAllByTitleContains(String title, Pageable pageable);
    List<OwnerQuestion> findAllByOwnerUser(OwnerUser user);
    void deleteAllByOwnerUser(OwnerUser user);
}
