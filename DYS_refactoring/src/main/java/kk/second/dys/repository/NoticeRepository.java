package kk.second.dys.repository;

import kk.second.dys.model.entity.Notice;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;


@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {

    Notice findByNoticeNo(Long no);
    Page<Notice> findAllByTitleContainsOrContentContains(String title, String content, Pageable pageable);
    Page<Notice> findAllByContentContains(String content, Pageable pageable);
    Page<Notice> findAllByTitleContains(String title, Pageable pageable);
}
