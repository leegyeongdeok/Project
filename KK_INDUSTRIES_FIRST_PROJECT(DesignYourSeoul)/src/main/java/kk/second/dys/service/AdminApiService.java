package kk.second.dys.service;

import kk.second.dys.model.entity.Admin;
import kk.second.dys.model.entity.OwnerUser;
import kk.second.dys.model.netowrk.request.OwnerUserApiRequest;
import kk.second.dys.model.netowrk.response.AdminResponse;
import kk.second.dys.model.netowrk.response.OwnerUserApiResponse;
import kk.second.dys.repository.AdminRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminApiService {

    @Autowired
    private AdminRepository repository;


    public AdminResponse getAccountAndPswd(String account, String pswd){

        return repository.findByAccountAndPassword(account, pswd)

                .map(user -> response(user))
                .orElse(null);
    }

    private AdminResponse response (Admin user){
        if(user == null){
            System.out.println("null");
            return null;
        }else{
            AdminResponse adminResponse = AdminResponse.builder()
                    .adminId(user.getAdminId())
                    .account(user.getAccount())
                    .password(user.getPassword())
                    .build();
            return adminResponse;
        }
    }


    public AdminResponse readForAccount(String account) {
        return response(repository.findByAccount(account));
    }
}
