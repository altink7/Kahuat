package at.technikum.springrestbackend.serviceimpl;

import at.technikum.springrestbackend.exceptions.UserStatisticNotFoundException;
import at.technikum.springrestbackend.model.UserStatistic;
import at.technikum.springrestbackend.repository.UserStatisticDao;
import at.technikum.springrestbackend.service.UserStatisticService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@Log4j2
public class UserStatisticServiceImpl implements UserStatisticService {
    private final UserStatisticDao userStatisticDao;

    @Autowired
    public UserStatisticServiceImpl(UserStatisticDao userStatisticDao) {
        this.userStatisticDao = userStatisticDao;
    }

    @Override
    public UserStatistic getUserStatisticByUserId(Long userId) {
        Optional<UserStatistic> userStatistic = userStatisticDao.findByUserId(userId);
        userStatistic.ifPresent(UserStatistic::calculateTransientFields);
        log.info("User statistic: " + userStatistic);
        return userStatistic.orElseThrow(UserStatisticNotFoundException::new);
    }

    @Override
    public UserStatistic updateUserStatisticByUserId(Long userId, int newPoints) {
        UserStatistic userStatistic = userStatisticDao.findByUserId(userId).orElseThrow(UserStatisticNotFoundException::new);
        userStatistic.setPoints(newPoints);
        return userStatisticDao.save(userStatistic);
    }

}
