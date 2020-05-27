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
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long adminId;

    private String account;
    private String password;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "admin")
    private List<OwnerQuestionReply> ownerQuestionReplyList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "admin")
    private List<GeneralQuestionReply> generalQuestionReplyList;
}
