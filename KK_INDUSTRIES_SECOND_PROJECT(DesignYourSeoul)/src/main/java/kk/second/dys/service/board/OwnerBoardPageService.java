package kk.second.dys.service.board;

import kk.second.dys.model.entity.board.OwnerBoard;
import kk.second.dys.model.network.request.OwnerBoardRequest;
import kk.second.dys.model.network.response.OwnerBoardResponse;
import kk.second.dys.repository.board.OwnerBoardRepository;
import kk.second.dys.repository.OwnerUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class OwnerBoardPageService {

    @Autowired
    private OwnerBoardRepository repository;

    @Autowired
    private OwnerUserRepository ownerUserRepository;

    public Page<OwnerBoard> findBoardList(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());

        return repository.findAll(pageable);
    }

    public Page<OwnerBoard> searchAllBoardList(Pageable pageable, String contains) {
        return repository.findAllByTitleContainsOrContentContains(contains, contains, pageable);
    }

    public Page<OwnerBoard> searchTitleBoardList(Pageable pageable, String contains) {
        return repository.findAllByTitleContains(contains, pageable);
    }

    public Page<OwnerBoard> searchContentBoardList(Pageable pageable, String contains) {
        return repository.findAllByContentContains(contains, pageable);
    }

    public Page<OwnerBoard> searchNameBoardList(Pageable pageable, String contains) {
        return repository.findAllByOwnerUserName(contains, pageable);
    }

    public OwnerBoard findByOwnerBoardNo(Long no) {
        return repository.findByBoardNo(no);
    }

    public OwnerBoardResponse create(OwnerBoardRequest request) {
        OwnerBoard ownerBoard = OwnerBoard.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .ownerUser(ownerUserRepository.getOne(request.getOwnerId()))
                .build();
        repository.save(ownerBoard);
        return response(ownerBoard);
    }

    private OwnerBoardResponse response(OwnerBoard ownerBoard) {
        OwnerBoardResponse ownerBoardResponse = OwnerBoardResponse.builder()
                .ownerBoardNo(ownerBoard.getBoardNo())
                .title(ownerBoard.getTitle())
                .content(ownerBoard.getContent())
                .registeredAt(ownerBoard.getRegisteredAt())
                .updatedAt(ownerBoard.getUpdatedAt())
                .ownerId(ownerBoard.getOwnerUser().getOwnerId())
                .build();
        return ownerBoardResponse;

    }
}
