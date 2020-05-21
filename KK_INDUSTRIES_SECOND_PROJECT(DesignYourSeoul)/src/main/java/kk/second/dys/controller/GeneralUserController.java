package kk.second.dys.controller;

import kk.second.dys.model.network.request.GeneralUserApiRequest;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.service.GeneralUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/generalUser")
public class GeneralUserController  {

    @Autowired
    private GeneralUserApiService service;


    @PostMapping("/create")
    public GeneralUserApiResponse create(@RequestBody GeneralUserApiRequest request) {

        return service.create(request);
    }

    @GetMapping("/get/findUser/{name}/{phone}")
    public List<GeneralUserApiResponse> ListReadForNameAndPhone(@PathVariable String name, @PathVariable String phone) {

        List<GeneralUserApiResponse> list = service.ListReadForNameAndPhone(name, phone);

        return list;
    }

    @GetMapping("/get/{account}")
    public GeneralUserApiResponse readForAccount(@PathVariable String account) {

        return service.readForAccount(account);
    }

    @PutMapping("/update/pswd/{id}/{newPswd}")
    public GeneralUserApiResponse updatePswd(@PathVariable String id, @PathVariable String newPswd) {
        return service.updatePswd(id, newPswd);
    }

    @PutMapping("/update/account/{account}/{newAccount}")
    public GeneralUserApiResponse updateAccount(@PathVariable String account, @PathVariable String newAccount) {
        return service.updateAccount(account, newAccount);
    }

    @PutMapping("/update/nick/{id}/{newNickname}")
    public GeneralUserApiResponse updateNickName(@PathVariable String id, @PathVariable String newNickname) {
        return service.updateNickName(id, newNickname);
    }

    @PutMapping("/update/name/{id}/{newName}")
    public GeneralUserApiResponse updateName(@PathVariable String id, @PathVariable String newName) {
        return service.updateName(id, newName);
    }

    @PutMapping("/update/birth/{id}/{newBirth}")
    public GeneralUserApiResponse updateBirth(@PathVariable String id, @PathVariable String newBirth) {
        return service.updateBirth(id, newBirth);
    }

    @PutMapping("/update/email/{id}/{newEmail}")
    public GeneralUserApiResponse updateEmail(@PathVariable String id, @PathVariable String newEmail) {
        return service.updateEmail(id, newEmail);
    }

    @PutMapping("/update/phone/{id}/{newPhoneNum}")
    public GeneralUserApiResponse updatePhoneNum(@PathVariable String id, @PathVariable String newPhoneNum) {
        return service.updatePhoneNum(id, newPhoneNum);
    }

    @DeleteMapping("/delete/{account}")
    public GeneralUserApiResponse delete(@PathVariable String  account) {

        return service.delete(account);
    }



}
