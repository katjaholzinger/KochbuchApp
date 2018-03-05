<?php
/**
 * Created by PhpStorm.
 * User: kholzinger
 * Date: 03.03.2018
 * Time: 12:53
 */
class db_connect {
    private $conn;

    // Connecting to database
    public function connect() {
        require_once 'db_config.php';

        // Connecting to mysql database
        $this->conn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);
        // return database object
        return $this->conn;
    }
}
?>