package kk.second.dys.model.network.response.review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CafeReviewApiResponse {

    private Long reviewId;
    private String nickName;
    private String content;
    private LocalDateTime registeredAt;
    private Long cafeId;
}
