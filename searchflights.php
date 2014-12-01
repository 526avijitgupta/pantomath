

<!DOCTYPE html>
<html>
<head>
	<title>UseMe.com - Flight Booking</title>
	<link rel="stylesheet" href="Styles/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<link rel="stylesheet" href="Styles/datepicker.css">
	<script type="text/javascript" src="Scripts/jquery.js"></script>
	<script type="text/javascript" src="Scripts/jquery-ui.js"></script>
	<script type="text/javascript" src="Scripts/link_active_assign.js"></script>
	<script type="text/javascript" src="Scripts/connect_icon_hover.js"></script>
	<!-- <script type="text/javascript" src="Scripts/validate_form.js"></script> -->
	<script type="text/javascript" src="Scripts/bootstrap-datepicker.js"></script>
	<script type="text/javascript">

	airports_list = ["Delhi", "Mumbai", "Chennai", "Bangalore", "Goa"];

	$(function(){

		//For Autocomplete
		$('#from').autocomplete({
			source: airports_list
		});
		$('#to').autocomplete({
			source: airports_list
		});

		//For Datepicker
		$('#depart-on').datepicker();
	});

	</script>
</head>
<body>
	<div class="container col-xs-12"> 

		<?php
			require_once('header.php');
		?>

		<br><br>

		<div class="row content-container">

			<div style="height:500px; width:80px; background-color:rgb(245,245,245); display:inline-block; float:left;">

			</div>

			<?php
				require_once('left_sidenav.php');
			?>

			<div class="col-sm-7 content-sub-container" id="flights-content">
				<div class="content-head-wrap inline-form-marginleft">
					<h2><strong>Search results</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<br>
				<!-- <form method="POST" action="actions/selectflights.php"> -->

				<?php
					// $source_city = "NULL";
					// $destination_city = "NULL";
					// $GLOBALS['flag'] = 0;

				 	if($_SERVER['REQUEST_METHOD']=='POST') {

				 		// print_r($_POST);
				 		session_start();
						require_once('connection.php');
						// $children = $_POST['children'];
						// echo $children;
						$source_city = $_POST['source_input'];
						$destination_city = $_POST['destination_input'];
						$date = $_POST['date'];
						$_SESSION['source'] = $source_city;
						$_SESSION['destination'] = $destination_city;
						$_SESSION['date'] = $date;

						// $query = "Select * from FlightCities where flight_source = " . '"' . $source_city . '"' . " and flight_destination =  " . '"' . $destination_city . '"' ;
						// $query = "Select route_id from FlightCities where flight_source = '$source_city' and flight_destination = '$destination_city'";
						$query = "select fn.flight_name, fd.flight_arr_time, fd.flight_dept_time, fd.flight_price from FlightData as fd, FlightNames as fn where fn.flight_id = fd.flight_id and fn.flight_id in (select fr.flight_id from FlightRoutes as fr, FlightCities as fc where fc.route_id = fr.route_id and fc.route_id in (Select route_id from FlightCities where flight_source = '$source_city' and flight_destination = '$destination_city'))";
						// echo $query;
						$result = mysqli_query($con, $query);
						// echo gettype($result);

						if( !$result ) {

							echo "The query returned nothing!";
						} else {
							// $row = mysqli_fetch_array($result,MYSQL_NUM);
							// echo $row[1];
							// $GLOBALS['flag'] = 1;
							if(mysqli_num_rows($result)>0) {  //if a table is returned, display the table 
				      	print "<table border=1>";
				        print "<form action='flight_booking.php' method='post'>";
				          for($i=0;$i<mysqli_num_rows($result);$i++){

				            $row = mysqli_fetch_array($result, MYSQL_NUM);
				            $_SESSION['result'][$i] = $row;
				            print "<tr>";
				            for($j=0;$j<count($row);$j++)
					            print "<td>$row[$j]</td><td>";
					          // print "<input type='checkbox' name='ch_{$i}' value='{$i}'></input>";
					          print "<input type='checkbox' name='ch[]' value='{$i}'></input>";
					          print "</tr>";
				          }
					      print "<input type='submit' value='book'></td>";
				        print "</form>";
				        print "</table>"; 
				      }
						}
					}
				?>


		</div>
	</div>

		<br><br>
		<?php
			require_once('footer.php');
		?>
</div>
</body>
</html>


