package kk.second.dys.function;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.LikeList;
import kk.second.dys.model.entity.user.OwnerUser;
import kk.second.dys.repository.GeneralUserRepository;
import kk.second.dys.repository.LikeListRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@RestController
@RequestMapping("/function/detailList/")
public class detailListOnloadFunction {

    @Autowired
    private GeneralUserRepository grepository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    @Autowired
    private LikeListRepository likeListRepository;

    @GetMapping("/getUserId/{Id}")
    public Long getUserId(@PathVariable String Id) {
        GeneralUser guser = grepository.findByAccount(Id);
        return guser.getGeneralId();
    }

    @GetMapping("/ownerUserId/{Id}")
    public Long getOwnerUserId(@PathVariable String Id) {
        OwnerUser ownerUser = ownerUserRepository.findByAccount(Id);
        return ownerUser.getOwnerId();
    }

    @GetMapping("/likePresenceOrAbsence/{Id}/{kind}/{no}")
    public String likePresenceOrAbsence(@PathVariable String Id, @PathVariable String kind, @PathVariable Long no) {

        AtomicReference<String> result = new AtomicReference<>("absence");
        Optional<LikeList> like =  likeListRepository.findByGeneralUserAndKindAndThemeId(grepository.findByAccount(Id), kind, no);

        like.ifPresent(likeList->{
            result.set("presence");
        });



        System.out.println(result.get());
        return result.get();
    }
}
