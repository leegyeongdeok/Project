package kk.second.dys.controller;
import kk.second.dys.model.network.request.OwnerUserApiRequest;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.model.network.response.OwnerUserApiResponse;
import kk.second.dys.service.OwnerUserApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ownerUser")
public class OwnerUserController {

    @Autowired
    private OwnerUserApiService service;

    @PostMapping("/create")
    public OwnerUserApiResponse create(@RequestBody OwnerUserApiRequest request) {

        return service.create(request);
    }

    @GetMapping("/get/findUser/{name}/{phone}")
    public List<OwnerUserApiResponse> ListReadForNameAndPhone(@PathVariable String name, @PathVariable String phone) {

        List<OwnerUserApiResponse> list = service.ListReadForNameAndPhone(name, phone);

        return list;
    }

    @GetMapping("/get/{account}")
    public OwnerUserApiResponse readForAccount(@PathVariable String account) {
        return service.readForAccount(account);
    }

    @PutMapping("/update/pswd/{id}/{newPswd}")
    public OwnerUserApiResponse updatePswd(@PathVariable String id, @PathVariable String newPswd) {
        return service.updatePswd(id, newPswd);
    }

    @PutMapping("/update/name/{id}/{newName}")
    public OwnerUserApiResponse updateName(@PathVariable String id, @PathVariable String newName) {
        return service.updateName(id, newName);
    }

    @PutMapping("/update/birth/{id}/{newBirth}")
    public OwnerUserApiResponse updateBirth(@PathVariable String id, @PathVariable String newBirth) {
        return service.updateBirth(id, newBirth);
    }

    @PutMapping("/update/email/{id}/{newEmail}")
    public OwnerUserApiResponse updateEmail(@PathVariable String id, @PathVariable String newEmail) {
        return service.updateEmail(id, newEmail);
    }

    @PutMapping("/update/phone/{id}/{newPhoneNum}")
    public OwnerUserApiResponse updatePhoneNum(@PathVariable String id, @PathVariable String newPhoneNum) {
        return service.updatePhone(id, newPhoneNum);
    }

    @PutMapping("/update/status/{id}")
    public OwnerUserApiResponse updateStatus(@PathVariable String id) {
        return service.updateStatus(id);
    }


    @DeleteMapping("/delete/{account}")
    public OwnerUserApiResponse delete(@PathVariable String account) {
        return service.delete(account);
    }


}
