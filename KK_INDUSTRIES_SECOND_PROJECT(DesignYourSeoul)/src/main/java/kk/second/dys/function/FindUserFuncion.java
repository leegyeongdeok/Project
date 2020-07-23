package kk.second.dys.function;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.user.OwnerUser;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.model.network.response.OwnerUserApiResponse;
import kk.second.dys.repository.GeneralUserRepository;
import kk.second.dys.repository.OwnerUserRepository;
import kk.second.dys.service.GeneralUserApiService;
import kk.second.dys.service.OwnerUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;


@RestController
@RequestMapping("/function/find/")
public class FindUserFuncion {
    @Autowired
    private GeneralUserApiService gservice;

    @Autowired
    private OwnerUserApiService oservice;

    @Autowired
    private GeneralUserRepository grepository;

    @Autowired
    private OwnerUserRepository orepository ;


    @GetMapping("id/{name}/{phone}")
    public String findId(@PathVariable String name, @PathVariable String phone){

        AtomicReference<String> result = new AtomicReference<>("false");

        GeneralUserApiResponse guser = gservice.findFirstByNameAndPhoneNum(name, phone);
        OwnerUserApiResponse owuser = oservice.findFirstByNameAndPhoneNum(name, phone);

        if (guser == null) {

        }else{
            result.set("general");
        }

        if (owuser == null) {

        }else{
            result.set("owner");
        }

        return result.get();
    }



    @GetMapping("pswd/{name}/{id}/{phone}")
    public String findPswd(@PathVariable String name, @PathVariable String id, @PathVariable String phone){

        AtomicReference<String> result = new AtomicReference<>("false");

        Optional<GeneralUser> guser =  grepository.findFirstByNameAndAccountAndPhoneNum(name, id, phone);
        Optional<OwnerUser> ouser = orepository.findFirstByNameAndAccountAndPhoneNum(name, id, phone);

        guser.ifPresent(user->{
            result.set("general");
        });

        ouser.ifPresent(user->{
            result.set("owner");
        });

        return result.get();
    }

    @GetMapping("ownerId/{account}")
    public Long findOwnerId(@PathVariable String account){
       OwnerUser ownerUser =  orepository.findByAccount(account);
       return ownerUser.getOwnerId();
    }

    @GetMapping("generalId/{account}")
    public Long findGeneralId(@PathVariable String account){
        GeneralUser GeneralUser =  grepository.findByAccount(account);
        return GeneralUser.getGeneralId();
    }
}
