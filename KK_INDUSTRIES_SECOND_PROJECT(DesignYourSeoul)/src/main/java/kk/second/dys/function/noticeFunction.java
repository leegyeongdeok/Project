package kk.second.dys.function;

import kk.second.dys.model.entity.Notice;
import kk.second.dys.model.entity.board.GeneralBoard;
import kk.second.dys.model.network.request.NoticeRequest;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/function/notice")
public class noticeFunction {

    @Autowired
    private NoticeRepository repository;

    @PutMapping("/create")
    public void createNotice(@RequestBody NoticeRequest request) {
        Notice notice = Notice.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .registeredAt(request.getRegisteredAt())
                .updatedAt(request.getUpdatedAt())
                .build();
        repository.save(notice);
    }

    @PutMapping("/update/{id}")
    public void updateNotice(@PathVariable String id, @RequestBody NoticeRequest request) {
        Long noticeNo = Long.parseLong(id);
        Notice notice = repository.getOne(noticeNo);

        notice.setTitle(request.getTitle());
        notice.setContent(request.getContent());
        notice.setUpdatedAt(request.getUpdatedAt());
        repository.save(notice);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable String  id) {
        Long noticeNo = Long.parseLong(id);
        Notice notice = repository.getOne(noticeNo);
        repository.delete(notice);
    }
}
