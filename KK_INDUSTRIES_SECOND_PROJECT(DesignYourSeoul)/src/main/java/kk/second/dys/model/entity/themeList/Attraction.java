package kk.second.dys.model.entity.themeList;

import kk.second.dys.model.entity.user.OwnerUser;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Attraction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long attractionId;

    private String name;
    private String callNumber;
    private String address;
    private String link;
    private String attractionType;
    private Integer recommend;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "area_id")
    private Area area;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "owner_id")
    private OwnerUser ownerUser;

}
