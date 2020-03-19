package kk.second.dys.function;

import kk.second.dys.model.netowrk.response.GeneralUserApiResponse;
import kk.second.dys.service.GeneralUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/function/MyPage/")
public class MyPageFunction {

    @Autowired
    private GeneralUserApiService service;

    @GetMapping("myInfo/{account}")
    public GeneralUserApiResponse findByAccount(@PathVariable String account){

        return service.readForAccount(account);
    }
}
