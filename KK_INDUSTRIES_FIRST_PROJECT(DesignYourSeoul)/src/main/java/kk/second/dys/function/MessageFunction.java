package kk.second.dys.function;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RestController
public class MessageFunction {

    @RequestMapping(value = "/sendSms")
    public void sendSms(HttpServletRequest request) throws CoolsmsException {

        String api_key = "NCSFHIDZFXHVBZNR";
        String api_secret = "WLYVLE3HJHM8GWOFCETVFKLFFAIN5XGM";
        String phone = (String)request.getParameter("phone");
        String txt = (String)request.getParameter("text");

        System.out.println("run");

        Message message =  new Message(api_key, api_secret);

        HashMap<String, String> set = new HashMap<String, String>();

        set.put("from", "03180039952"); // 보내는사람
        set.put("to", (String)request.getParameter("phone"));// 받는 사람
        set.put("text", (String)request.getParameter("text")); // 문자내용
        set.put("type", "sms"); // 문자 타입

        System.out.println(set);
        message.send(set);
    }
}
