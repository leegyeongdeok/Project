package kk.second.dys.model.network.response;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LikeListApiResponse {

    private Long likeListId;
    private Long userId;
    private Long themeId;
    private String kind;
}
