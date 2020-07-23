package kk.second.dys.model.network.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AttractionApiResponse {

    private Long attractionId;
    private String name;
    private String callNumber;
    private String address;
    private String link;
    private String attractionType;
    private Integer recommend;
    private Long areaId;
}
