package kk.second.dys.function;

import kk.second.dys.model.network.response.OwnerUserApiResponse;
import kk.second.dys.repository.OwnerUserRepository;
import kk.second.dys.service.OwnerUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/function/ownerPage/")
public class OwnerPageFunction {
    @Autowired
    OwnerUserRepository repository;

    @Autowired
    OwnerUserApiService service;

    @GetMapping("ownerInfo/{account}")
    public OwnerUserApiResponse ownerInfo(@PathVariable String account){

        return service.readForAccount(account);
    }


}
