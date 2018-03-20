package com.hwr.kochbuch;

import com.google.firebase.database.IgnoreExtraProperties;

/**
 * Created by kholzinger on 11.03.2018.
 */
@IgnoreExtraProperties
public class User {

    public String userId;
    public String username;
    public String email;

    public User() {
        // Default constructor required for calls to DataSnapshot.getValue(User.class)
    }

    public User(String userId, String username, String email) {
        this.userId = userId;
        this.username = username;
        this.email = email;
    }

}