package kk.second.dys;

import kk.second.dys.function.UserFormFunction;
import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.repository.GeneralUserRepository;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;


public class UserRepositoryTest extends DysApplicationTests {

    @Autowired
    private GeneralUserRepository repository;


    private UserFormFunction function;

    @Test
    public void create() {

        GeneralUser user = new GeneralUser();

        user.setGeneralId("sdfsdf");
        user.setPassword("!23123");
        user.setNickname("sdfsdf");
        user.setEmail("fty0923@naverr.conm");
        user.setPhoneNum("01089003309");
        user.setBirth("19970918");
        user.setName("Sdfsdf");


        GeneralUser newUser = repository.save(user);

        Assert.assertNotNull(newUser);
        System.out.println(newUser.toString());

    }

    @Test
    public void read() {

       Optional<GeneralUser> user =  repository.findFirstByGeneralId("sdfsdf");
                // 2. user -> userApiResponse
                user.ifPresent(nuser->{
                    System.out.println("Not null");
                });
                // 3. user X -> Header return ERROR


    }

    @Test
    public void run(){
        function = new UserFormFunction();
        function.duplicateCheck("fty0918");
    }


}
