package org.example.internetshop.service;

import java.util.Optional;
import org.example.internetshop.model.User;

public interface UserService extends GenericService<User, Long> {
    Optional<User> findByLogin(String login);
}
