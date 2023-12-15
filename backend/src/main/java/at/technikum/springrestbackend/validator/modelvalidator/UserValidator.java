package at.technikum.springrestbackend.validator.modelvalidator;

import at.technikum.springrestbackend.model.user.AppUser;
import at.technikum.springrestbackend.validator.Validator;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ValidationException;
import org.modelmapper.spi.ErrorMessage;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@Log4j2
public class UserValidator implements Validator<AppUser> {

    /**
     * Validates the user data
     *
     * @param appUser the object to validate
     */
    @Override
    public void validate(AppUser appUser) {

        log.info("Validating user: " + appUser.toString());
        List<ErrorMessage> errors = new ArrayList<>();

        if (appUser.getEmail() == null) {
            log.error("Email must not be null");
            errors.add(new ErrorMessage("Email must not be null"));
        }

        if (!errors.isEmpty()) {
            throw new ValidationException(errors);
        }

        log.info("User validated successfully");
    }
}
