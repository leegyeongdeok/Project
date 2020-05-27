package kk.second.dys.function;

import kk.second.dys.model.netowrk.response.AdminResponse;
import kk.second.dys.model.netowrk.response.GeneralUserApiResponse;
import kk.second.dys.model.netowrk.response.OwnerUserApiResponse;
import kk.second.dys.service.AdminApiService;
import kk.second.dys.service.GeneralUserApiService;
import kk.second.dys.service.OwnerUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicReference;

@RestController
@RequestMapping("/function/login/")
public class LoginFunction {

    @Autowired
    private GeneralUserApiService gservice;

    @Autowired
    private OwnerUserApiService oservice;

    @Autowired
    private AdminApiService aservice;

    @GetMapping("{account}/{password}")
    public String Login(@PathVariable String account, @PathVariable String password){
        AtomicReference<String> result = new AtomicReference<>("false");
        GeneralUserApiResponse guser = gservice.getAccountAndPswd(account, password);
        OwnerUserApiResponse owuser = oservice.getAccountAndPswd(account, password);
        AdminResponse auser = aservice.getAccountAndPswd(account, password);

        if (guser == null) {

        }else{
            result.set("general");
        }

           if (owuser == null) {

        }else{
            result.set("owner");
        }if(auser == null){

        }else{
            result.set("admin");
        }
        return result.get();
    }
}
