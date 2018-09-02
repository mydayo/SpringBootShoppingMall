
package com.app;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.jpa.repository.Query;

public interface IUser extends CrudRepository<User, Long> {
    @Query
    User findByUserId(String userId);
}

