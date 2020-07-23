package kk.second.dys.function;

import kk.second.dys.model.entity.LikeList;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.service.GeneralUserApiService;
import kk.second.dys.service.LikeListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/function/MyPage/")
public class MyPageFunction {

    @Autowired
    private GeneralUserApiService generalUserApiService;

    @Autowired
    private LikeListService likeListService;

    @GetMapping("myInfo/{account}")
    public GeneralUserApiResponse findByAccount(@PathVariable String account){

        return generalUserApiService.readForAccount(account);
    }



}
