package kk.second.dys.service;

import kk.second.dys.model.entity.Notice;
import kk.second.dys.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class NoticePageService {

    @Autowired
    private NoticeRepository repository;

    public Page<Notice> findNoticeList(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());

                return repository.findAll(pageable);
    }

    public Page<Notice> searchAllNoticeList(Pageable pageable, String contains){
        return repository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<Notice> searchTitleNoticeList(Pageable pageable, String contains){
        return repository.findAllByTitleContains(contains,pageable);
    }

    public Page<Notice> searchContentNoticeList(Pageable pageable, String contains){
        return repository.findAllByContentContains(contains,pageable);
    }

    public Notice findByNoticeNo(Long no) {
        return repository.findById(no).orElse(new Notice());
    }
}
