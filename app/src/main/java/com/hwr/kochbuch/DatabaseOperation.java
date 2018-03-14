package com.hwr.kochbuch;
import android.util.Log;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

/**
 * Created by kholzinger on 10.03.2018.
 */

class DatabaseOperation {
    DatabaseReference database = FirebaseDatabase.getInstance().getReference();

    public void setNewUser(String id, String name, String mail) {
        Log.d("Database", "Erstelle neuen Benutzer...");
        User user = new User(name, mail);
        Log.d("Database", "Füge neuen Benutzer hinzu...");
        database.child("users").child(id).setValue(user);

    }
}
