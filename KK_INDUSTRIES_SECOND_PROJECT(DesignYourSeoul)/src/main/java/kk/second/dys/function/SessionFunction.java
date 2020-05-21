package kk.second.dys.function;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/function/session/")
public class SessionFunction {

    @PostMapping("setSession/account/{val}")
    public void setByAccount(@PathVariable String val, HttpServletRequest request){

        HttpSession session =  request.getSession();

        session.setAttribute("ACCOUNT", val);

    }

    @PostMapping("setSession/accountAndType/{account}/{type}")
    public void setByAccountAndType(@PathVariable String account, @PathVariable String type, HttpServletRequest request){

        HttpSession session =  request.getSession();

        session.setAttribute("ACCOUNT", account);
        session.setAttribute("TYPE", type);

    }
}
