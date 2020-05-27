package kk.second.dys.service;

import kk.second.dys.model.entity.OwnerUser;
import kk.second.dys.model.netowrk.request.OwnerUserApiRequest;
import kk.second.dys.model.netowrk.response.OwnerUserApiResponse;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class OwnerUserApiService {

    @Autowired
    private OwnerUserRepository repository;

    public OwnerUserApiResponse create(OwnerUserApiRequest request) {
        OwnerUser user = OwnerUser.builder()
                .account(request.getAccount())
                .password(request.getPassword())
                .name(request.getName())
                .birth(request.getBirth())
                .email(request.getEmail())
                .phoneNum(request.getPhoneNum())
                .status(request.getStatus())
                .build();
        repository.save(user);

        return response(user);
    }

    public OwnerUserApiResponse getAccountAndPswd(String account, String pswd){

        return repository.findByAccountAndPassword(account, pswd)

                .map(user -> response(user))
                .orElse(null);

    }

    public OwnerUserApiResponse getAccount(String account){
        return response(repository.findByAccount(account));
    }



    public List<OwnerUserApiResponse> ListReadForNameAndPhone(String name, String phone) {
        List<OwnerUser>  ownerUserList=  repository.findAllByNameAndPhoneNum(name, phone);
        List<OwnerUserApiResponse> result = new ArrayList<>();

        for (OwnerUser o:ownerUserList){
            result.add(response(o));
        }
        return result;
    }

    public OwnerUserApiResponse updatePswd(String id, String pswd) {
        OwnerUser user =  repository.findByAccount(id);
        user.setPassword(pswd);
        repository.save(user);
        return response(user);
    }

    public OwnerUserApiResponse updateAccount(String account, String newAccount) {
        OwnerUser user =  repository.findByAccount(account);
        user.setAccount(newAccount);
        repository.save(user);
        return response(user);
    }

    public OwnerUserApiResponse delete(String account) {
        OwnerUser user =  repository.findByAccount(account);
        repository.delete(user);
        return response(user);
    }

    private OwnerUserApiResponse response (OwnerUser user){
        if(user == null){
            System.out.println("null");
            return null;
        }else{
            OwnerUserApiResponse ownerUserApiResponse = OwnerUserApiResponse.builder()
                    .account(user.getAccount())
                    .password(user.getPassword())
                    .name(user.getName())
                    .birth(user.getBirth())
                    .email(user.getEmail())
                    .phoneNum(user.getPhoneNum())
                    .registeredAt(user.getRegisteredAt())
                    .status(user.getStatus())
                    .build();
            return ownerUserApiResponse;
        }



    }



    private OwnerUserApiRequest request (OwnerUser user){
        OwnerUserApiRequest ownerUserApiRequest = OwnerUserApiRequest.builder()
                .account(user.getAccount())
                .password(user.getPassword())
                .name(user.getName())
                .birth(user.getBirth())
                .email(user.getEmail())
                .phoneNum(user.getPhoneNum())
                .registeredAt(user.getRegisteredAt())
                .status(user.getStatus())
                .build();

        return ownerUserApiRequest;

    }

    public OwnerUserApiResponse findFirstByNameAndPhoneNum(String account, String pswd){
        return repository.findFirstByNameAndPhoneNum(account, pswd)

                .map(user -> response(user))
                .orElse(null);

    }

    public OwnerUserApiResponse readForAccount(String account) {
        return response(repository.findByAccount(account));
    }

    public OwnerUserApiResponse findByOwnerId(Long number) {
        return response(repository.getOne(number));
    }
}
