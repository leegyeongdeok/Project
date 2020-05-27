package kk.second.dys.controller;
import kk.second.dys.model.network.request.OwnerUserApiRequest;
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

    @PutMapping("/update/account/{account}/{newAccount}")
    public OwnerUserApiResponse updateAccount(@PathVariable String account, @PathVariable String newAccount) {
        return service.updateAccount(account, newAccount);
    }

    @DeleteMapping("/delete/{account}")
    public OwnerUserApiResponse delete(@PathVariable String account) {
        return service.delete(account);
    }


}
