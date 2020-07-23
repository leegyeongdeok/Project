package kk.second.dys.controller;
import kk.second.dys.repository.AreaRepository;
import kk.second.dys.repository.themeList.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/area")
public class AreaController {

    @Autowired
    private AreaRepository repository;

    @Autowired
    private FamousRestaurantRepository famousRestaurantRepository;

    @Autowired
    private AccommodationRepository accommodationRepository;

    @Autowired
    private CafeRepository cafeRepository;

    @Autowired
    private ActivityRepository activityRepository;

    @Autowired
    private AttractionRepository attractionRepository;

    @GetMapping("/get/restaurant/{id}")
    public Integer countRestaurant(@PathVariable String id) {

        Long number = Long.parseLong(id);
        return famousRestaurantRepository.countAllByArea(repository.getOne(number));
    }

    @GetMapping("/get/accommodation/{id}")
    public Integer countAccommodation(@PathVariable String id) {

        Long number = Long.parseLong(id);
        return accommodationRepository.countAllByArea(repository.getOne(number));
    }

    @GetMapping("/get/cafe/{id}")
    public Integer countCafe(@PathVariable String id) {
        Long number = Long.parseLong(id);
        return cafeRepository.countAllByArea(repository.getOne(number));
    }
    @GetMapping("/get/activity/{id}")
    public Integer countActivity(@PathVariable String id) {
        Long number = Long.parseLong(id);
        return activityRepository.countAllByArea(repository.getOne(number));
    }

    @GetMapping("/get/attraction/{id}")
    public Integer countAttraction(@PathVariable String id) {
        Long number = Long.parseLong(id);
        return attractionRepository.countAllByArea(repository.getOne(number));
    }
}
