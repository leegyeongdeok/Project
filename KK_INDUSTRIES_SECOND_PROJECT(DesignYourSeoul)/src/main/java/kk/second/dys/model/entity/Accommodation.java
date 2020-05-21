package kk.second.dys.model.entity;

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
public class Accommodation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long accommodationId;

    private String name;
    private String callNumber;
    private String address;
    private String link;
    private Integer grade;
    private Integer recommend;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "area_id")
    private  Area area;
}
