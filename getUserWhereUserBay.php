<?php
	// include 'connected.php';
	
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");
    $link = mysqli_connect('localhost', 'root', '', "recycle_db");

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
		$buyuser_phone = $_GET['buyuser_phone'];

		$result = mysqli_query($link, "SELECT * FROM buy_antiques WHERE buyuser_phone = '$buyuser_phone'");

		if ($result) {

			while($row=mysqli_fetch_assoc($result)){
			$output[]=$row;

			}echo json_encode($output);

		} //if

	} else echo "Welcome Master ris";	// if2
   
}	// if1

mysqli_close($link);
?>

