<?php
/**
 * Created by PhpStorm.
 * User: kholzinger
 * Date: 04.03.2018
 * Time: 12:00
 */
# Our new data
$data = array(
    'email' => 'janek-4@live.de',
    'password' => 'janek'
);
# Create a connection
$url = 'http://test.hwr-bachelorball.de/webservice/login.php';
$ch = curl_init($url);
# Form data string
$postString = http_build_query($data, '', '&');
# Setting our options
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postString);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
# Get the response
$response = json_decode(curl_exec($ch), true);
echo $response;

if ($response["error"]) {
    echo "Das Login war nicht erfolgreich.";
} else {
    echo "Login erfolgreich";
    setcookie("loginKochbuch", $response["user"]["email"], time()+3600);
}
curl_close($ch);
