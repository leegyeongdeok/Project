package kk.second.dys.function;

import kk.second.dys.model.network.request.GeneralQuestionRequest;
import kk.second.dys.model.network.response.GeneralQuestionResponse;
import kk.second.dys.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/function")
public class QuestionFunction {

    @Autowired
    private QuestionService service;

    @PostMapping("/question/general/create")
    public GeneralQuestionResponse createOwner(@RequestBody GeneralQuestionRequest request) {

        return service.generalQuestionCreate(request);
    }

}
