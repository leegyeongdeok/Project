package kk.second.dys.model.entity.question;

import kk.second.dys.model.entity.user.OwnerUser;
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
public class OwnerQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long questionNo;


    private String title;
    private String content;

    @CreatedDate
    private LocalDateTime registeredAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "owner_id")
    private OwnerUser ownerUser;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ownerQuestion")
    private List<OwnerQuestionReply> ownerQuestionReplyList;

}
