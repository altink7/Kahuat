package at.technikum.springrestbackend.model.generator;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;
import java.security.SecureRandom;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class QuizIdGenerator implements IdentifierGenerator {
    public static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        String randomString;

        SecureRandom random = new SecureRandom();
        randomString = IntStream.range(0, 8)
                .mapToObj(i -> String.valueOf(CHARACTERS.charAt(random.nextInt(CHARACTERS.length()))))
                .collect(Collectors.joining());

        return randomString;
    }
}