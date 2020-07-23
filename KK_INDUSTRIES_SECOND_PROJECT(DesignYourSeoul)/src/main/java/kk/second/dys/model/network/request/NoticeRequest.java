package kk.second.dys.model.network.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoticeRequest {

    private Long noticeNo;
    private String title;
    private String content;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;

}
