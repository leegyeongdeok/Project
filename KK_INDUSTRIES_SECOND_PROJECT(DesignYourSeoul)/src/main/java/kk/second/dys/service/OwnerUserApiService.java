package kk.second.dys.service;

import kk.second.dys.model.entity.user.OwnerUser;
import kk.second.dys.model.entity.board.OwnerBoard;
import kk.second.dys.model.entity.question.OwnerQuestion;
import kk.second.dys.model.enumclass.UserStatus;
import kk.second.dys.model.network.request.OwnerUserApiRequest;
import kk.second.dys.model.network.response.OwnerUserApiResponse;
import kk.second.dys.repository.OwnerUserRepository;
import kk.second.dys.repository.board.OwnerBoardReplyRepository;
import kk.second.dys.repository.board.OwnerBoardRepository;
import kk.second.dys.repository.question.OwnerQuestionReplyRepository;
import kk.second.dys.repository.question.OwnerQuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class OwnerUserApiService {

    @Autowired
    private OwnerUserRepository repository;

    @Autowired
    private OwnerBoardRepository boardRepository;

    @Autowired
    private OwnerBoardReplyRepository boardReplyRepository;

    @Autowired
    private OwnerQuestionRepository questionRepository;

    @Autowired
    private OwnerQuestionReplyRepository questionReplyRepository;

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

    public OwnerUserApiResponse updateName(String id, String name) {
        OwnerUser user =  repository.findByAccount(id);
        user.setName(name);
        repository.save(user);
        return response(user);
    }

    public OwnerUserApiResponse updateBirth(String id, String birth) {
        OwnerUser user =  repository.findByAccount(id);
        user.setBirth(birth);
        repository.save(user);
        return response(user);
    }

    public OwnerUserApiResponse updateEmail(String account, String email) {
        OwnerUser user =  repository.findByAccount(account);
        user.setEmail(email);
        repository.save(user);
        return response(user);
    }

    public OwnerUserApiResponse updatePhone(String account, String phone) {
        OwnerUser user =  repository.findByAccount(account);
        user.setPhoneNum(phone);
        repository.save(user);
        return response(user);
    }

    public OwnerUserApiResponse updateStatus(String account){
        OwnerUser user =  repository.findByAccount(account);
        int val = user.getStatus().getId();
        if(val == 0){
            user.setStatus(UserStatus.UNREGISTERED);
            repository.save(user);
        }else{
            user.setStatus(UserStatus.REGISTERED);
            repository.save(user);
        }
        return response(user);
    }

    @Transactional
    public OwnerUserApiResponse delete(String account) {
        OwnerUser user =  repository.findByAccount(account);
        List<OwnerQuestion> list = questionRepository.findAllByOwnerUser(user);
        List<OwnerBoard> boardList = boardRepository.findAllByOwnerUser(user);

        for(OwnerQuestion question : list){
            questionReplyRepository.findByOwnerQuestion(question).ifPresent(reply -> questionReplyRepository.delete(reply));
            questionRepository.delete(question);
        }

        for(OwnerBoard board : boardList){
            boardReplyRepository.deleteAllByOwnerBoard(board);
            boardRepository.delete(board);
        }


        boardReplyRepository.deleteAllByOwnerUser(user);
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
