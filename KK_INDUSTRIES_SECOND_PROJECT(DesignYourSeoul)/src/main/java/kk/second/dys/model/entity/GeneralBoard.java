package kk.second.dys.model.entity;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class GeneralBoard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long generalBoardNo;

    private String title;
    private String content;

    @CreatedDate
    private LocalDateTime registeredAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "general_id")
    private GeneralUser generalUser;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "generalBoard")
    private List<GeneralBoardReply> generalBoardReplyList;
}
