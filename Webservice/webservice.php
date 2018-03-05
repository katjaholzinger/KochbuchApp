<?php
/**
 * Created by PhpStorm.
 * User: kholzinger
 * Date: 03.03.2018
 * Time: 12:24
 */
/* require the user as the parameter */
if(isset($_GET['user']) && intval($_GET['user'])) {

    /* connect to the db */
    $link = mysql_connect('rdbms.strato.de','U3276584','1-testPasswort') or die('Cannot connect to the DB');
    mysql_select_db('DB3276584',$link) or die('Cannot select the DB');

    /* grab the posts from the db */
    $query = "SELECT * FROM nutzerdaten";
    $result = mysql_query($query,$link) or die('Errant query:  '.$query);

    /* create one master array of the records */
    $posts = array();
    if(mysql_num_rows($result)) {
        while($post = mysql_fetch_assoc($result)) {
            $posts[] = array('post'=>$post);
        }
    }

    /* output in necessary format */
        header('Content-type: application/json');
        echo json_encode(array('posts'=>$posts));


    /* disconnect from the db */
    @mysql_close($link);
}