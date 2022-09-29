<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

  if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
$selluser_id   = $_GET ['selluser_id '];
$selluser_name = $_GET ['selluser_name'];
$selluser_sname = $_GET ['selluser_sname'];
$selluser_email = $_GET ['selluser_email'];
$selluser_photo = $_GET ['selluser_photo'];
$selluser_phone = $_GET ['selluser_phone'];
$selluser_latitude = $_GET ['selluser_latitude'];
$selluser_longitude = $_GET ['selluser_longitude'];
$selluser_housenum = $_GET ['selluser_housenum'];
$selluser_district = $_GET ['selluser_district'];
$selluser_prefecture = $_GET ['selluser_prefecture'];
$selluser_city = $_GET ['selluser_city'];
$selluser_postid = $_GET ['selluser_postid'];
$selluser_password = $_GET ['selluser_password'];

$sql = "INSERT INTO sell_antiques(selluser_name,	selluser_sname,selluser_email,selluser_photo,selluser_latitude,selluser_longitude,selluser_housenum,selluser_district,selluser_prefecture,selluser_city,selluser_postid,selluser_phone,selluser_password) 
VALUES ('$selluser_name','$selluser_sname','$selluser_email','$selluser_photo','$selluser_latitude','$selluser_longitude','$selluser_housenum','$selluser_district','$selluser_prefecture','$selluser_city','$selluser_postid','$selluser_phone','$selluser_password')";
// use exec() because no results are returned
$result = mysqli_query($link, $sql);
if ($result) {
  echo "true";
} else {
  echo "false";
}

} else echo "Welcome Master UNG";

}
mysqli_close($link);



?>






