<?php
/**
 * Created by PhpStorm.
 * User: kholzinger
 * Date: 03.03.2018
 * Time: 12:57
 */
class update_user_info {

    private $conn;

    // constructor
    function __construct() {
        require_once 'db_connect.php';
        // connecting to database
        $db = new db_connect();
        $this->conn = $db->connect();
    }

    // destructor
    function __destruct() {

    }

    /**
     * Storing new user
     * returns user details
     */
    public function StoreUserInfo($name, $email, $password) {
        $hash = $this->hashFunction($password);
        $encrypted_password = $hash["encrypted"]; // encrypted password
        $salt = $hash["salt"]; // salt

        $stmt = $this->conn->prepare("INSERT INTO nutzerdaten( mail, password, salt, name) VALUES(?, ?, ?, ?)");
        $stmt->bind_param("ssss", $email, $encrypted_password, $salt, $name);
        $result = $stmt->execute();
        $stmt->close();

        // check for successful store
        if ($result) {
            $stmt = $this->conn->prepare("SELECT mail, password, salt, name FROM nutzerdaten WHERE mail = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $stmt-> bind_result($token2,$token3,$token4,$token5);
            while ( $stmt-> fetch() ) {
                $user["name"] = $token5;
                $user["email"] = $token2;
            }
            $stmt->close();
            return $user;
        } else {
            return false;
        }
    }

    /**
     * Get user by email and password
     */
    public function VerifyUserAuthentication($email, $password) {

        $stmt = $this->conn->prepare("SELECT mail, password, salt, name FROM nutzerdaten WHERE mail = ?");

        $stmt->bind_param("s", $email);

        if ($stmt->execute()) {
            $stmt-> bind_result($token2,$token3,$token4,$token5);

            while ( $stmt-> fetch() ) {
                $user["name"] = $token5;
                $user["email"] = $token2;
                $user["encrypted_password"] = $token3;
                $user["salt"] = $token4;
            }

            $stmt->close();

            // verifying user password
            $salt = $token4;
            $encrypted_password = $token3;
            $hash = $this->CheckHashFunction($salt, $password);
            // check for password equality
            if ($encrypted_password == $hash) {
                // user authentication details are correct
                return $user;
            }
        } else {
            return NULL;
        }
    }

    /**
     * Check user is existed or not
     */
    public function CheckExistingUser($email) {
        $stmt = $this->conn->prepare("SELECT mail from nutzerdaten WHERE mail = ?");

        $stmt->bind_param("s", $email);

        $stmt->execute();

        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            // user existed
            $stmt->close();
            return true;
        } else {
            // user not existed
            $stmt->close();
            return false;
        }
    }

    /**
     * Encrypting password
     * @param password
     * returns salt and encrypted password
     */
    public function hashFunction($password) {

        $salt = sha1(rand());
        $salt = substr($salt, 0, 10);
        $encrypted = base64_encode(sha1($password . $salt, true) . $salt);
        $hash = array("salt" => $salt, "encrypted" => $encrypted);
        return $hash;
    }

    /**
     * Decrypting password
     * @param salt, password
     * returns hash string
     */
    public function checkHashFunction($salt, $password) {
        $hash = base64_encode(sha1($password . $salt, true) . $salt);
        return $hash;
    }

}