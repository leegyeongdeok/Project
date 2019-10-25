package kk.second.dys.model.entity;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Area {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long areaId;

    private String name;
    private String keyword;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    private List<FamousRestaurant> famousRestaurantList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    private List<Accommodation> accommodationList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    private List<Activity> activityList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    private List<Cafe> cafeList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    private List<Attraction> attractionList;


}
