
<?php
	// $source_city = "NULL";
	// $destination_city = "NULL";

 	if($_SERVER['REQUEST_METHOD']=='POST') {

 		print_r($_POST);
		require_once('connection.php');
		$children = $_POST['children'];
		echo $children;
		$source_city = $_POST['source_input'];
		if( !$source_city ) {

			echo "no source_city!";
		} else {

			echo $source_city;
		}
		$destination_city = $_POST['destination_input'];

		if( !$destination_city ) {

			echo "no source_city!";
		} else {

			echo $destination_city;
		}
		$query = "Select * from FlightData";
		$result = mysqli_query($con, $query);

		if( !$result ) {

			echo "The query returned nothing!";
		} else {
			$row = mysqli_fetch_array($result,MYSQL_NUM);
			echo $row[0];
		}
	}
?>