


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
				
    $buyuser_id  = $_GET ['buyuser_id'];
    $buyuser_name = $_GET ['buyuser_name'];
    $buyuser_sname = $_GET ['buyuser_sname'];
    $buyuser_email = $_GET ['buyuser_email'];
    $buyuser_shop = $_GET ['buyuser_shop'];
    $buyuser_photo = $_GET ['buyuser_photo'];
    $buyuser_time = $_GET ['buyuser_time'];
    $buyuser_phone = $_GET ['buyuser_phone'];
    $buyuser_charge = $_GET ['buyuser_charge'];
    $buyuser_latitude = $_GET ['buyuser_latitude'];
    $buyuser_longitude = $_GET ['buyuser_longitude'];
    $buyuser_housenum = $_GET ['buyuser_housenum'];
    $buyuser_district = $_GET ['buyuser_district'];
    $buyuser_prefecture = $_GET ['buyuser_prefecture'];
    $buyuser_city = $_GET ['buyuser_city'];
    $buyuser_postid = $_GET ['buyuser_postid'];	
    $buyuser_password = $_GET ['buyuser_password'];	
    
    $sql = "INSERT INTO buy_antiques(buyuser_name,	buyuser_sname,buyuser_email,buyuser_shop,buyuser_photo,buyuser_time,buyuser_phone,buyuser_charge,buyuser_latitude,buyuser_longitude,buyuser_housenum,buyuser_district,buyuser_prefecture,buyuser_city,buyuser_postid,buyuser_password) 
    VALUES ('$buyuser_name','$buyuser_sname','$buyuser_email','$buyuser_shop','$buyuser_photo','$buyuser_time','$buyuser_phone','$buyuser_charge','$buyuser_latitude','$buyuser_longitude','$buyuser_housenum','$buyuser_district','$buyuser_prefecture','$buyuser_city','$buyuser_postid','$buyuser_password')";

		$result = mysqli_query($link, $sql);
		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	}else echo "Welcome Master UNG";
   
}
	mysqli_close($link);
?>