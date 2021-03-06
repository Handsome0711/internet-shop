package org.example.internetshop.model;

import java.util.Objects;
import java.util.Set;

public class User {
    private Long id;
    private String name;
    private String surname;
    private String login;
    private String password;
    private Set<Role> roles;
    private byte[] salt;

    public User(Long id, String name, String surname,
                String login, String password, Set<Role> roles, byte[] salt) {
        this(name, surname, login, password, roles);
        this.id = id;
        this.salt = salt;
    }

    public User(String name, String surname, String login, String password, Set<Role> roles) {
        this.login = login;
        this.name = name;
        this.surname = surname;
        this.password = password;
        this.roles = roles;
    }

    public byte[] getSalt() {
        return salt;
    }

    public void setSalt(byte[] salt) {
        this.salt = salt;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public String getSurname() {
        return surname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return id.equals(user.id)
                && name.equals(user.name)
                && login.equals(user.login)
                && password.equals(user.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, login, password);
    }

    @Override
    public String toString() {
        return "User{"
                + "id=" + id
                + ", name='" + name + '\''
                + ", login='" + login + '\''
                + '}';
    }
}

