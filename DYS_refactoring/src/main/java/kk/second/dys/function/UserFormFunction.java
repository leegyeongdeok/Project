package kk.second.dys.function;

import kk.second.dys.model.entity.GeneralUser;
import kk.second.dys.model.entity.OwnerUser;
import kk.second.dys.repository.GeneralUserRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@RestController
@RequestMapping("/function/user/")
public class UserFormFunction {

    @Autowired
    private GeneralUserRepository grepository;

    @Autowired
    private OwnerUserRepository orepository;

    @GetMapping("/duplicateId/{checkId}")
    public String duplicateCheck(@PathVariable String checkId){

        AtomicReference<String> result = new AtomicReference<>("멋진 아이디네요!!");
        Optional<GeneralUser> guser =  grepository.findFirstByAccount(checkId);
        Optional<OwnerUser> ouser = orepository.findFirstByAccount(checkId);

        guser.ifPresent(user->{
                result.set("중복된 아이디입니다. 다른 아이디를 사용하세요");
        });

        ouser.ifPresent(user->{
            result.set("중복된 아이디입니다. 다른 아이디를 사용하세요");
        });

        System.out.println(result.get());
        return result.get();
    }

    @GetMapping("/duplicateNick/{checkNick}")
    public String duplicateNickCheck(@PathVariable String checkNick){

        AtomicReference<String> result = new AtomicReference<>("멋진 닉네임이네요!!");
        Optional<GeneralUser> guser =  grepository.findFirstByNickname(checkNick);

        guser.ifPresent(user->{
            result.set("중복된 닉네임입니다. 다른 닉네임을 사용하세요");
        });

        System.out.println(result.get());
        return result.get();
    }

    @GetMapping("/get/general/{account}")
    public Long getGeneralUserId(@PathVariable String account){
        return grepository.findByAccount(account).getGeneralId();
    }
}
