package kk.second.dys.controller;

import kk.second.dys.service.LikeListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/likeList")
public class likeListController {

    @Autowired
    private LikeListService service;


    @PostMapping("/create/{id}/{kind}/{no}")
    public void creatLikeList(@PathVariable String id, @PathVariable String kind, @PathVariable Long no) {

        service.create(id, kind, no);
    }

    @PutMapping("/updatePlus/{kind}/{no}")
    public void updatePlusRecommend(@PathVariable String kind, @PathVariable Long no) {
         service.updatePlus(kind, no);
    }

    @PutMapping("/updateMinus/{kind}/{no}")
    public void updateMinusRecommend(@PathVariable String kind, @PathVariable Long no) {
        service.updateMinus(kind, no);
    }

    @DeleteMapping("/delete/{id}/{kind}/{no}")
    public void delete(@PathVariable String id, @PathVariable String kind, @PathVariable Long no) {

        service.delete(id, kind, no);
    }
}
