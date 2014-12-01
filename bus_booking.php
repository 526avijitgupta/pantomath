


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

				<?php

					require ('connection.php');
					session_start();
					$checked = $_POST['ch'];
					$source = $_SESSION['source'];
					$destination = $_SESSION['destination'];
					$date = $_SESSION['date'];
					echo $source;
					echo $destination;
					echo $date;
					for($i=0;$i<sizeof($checked);$i++) {

						echo "The loop is running $i times";
						$row = $_SESSION['result'][$checked[$i]];
						$query = "insert into BookedBuses(source, destination, arrival_time, departure_time, price) values('$source', '$destination', '$row[1]', '$row[2]','$row[3]');";
						$result = mysqli_query($con, $query);
						$query = "insert into BookedBusIDs(bus_id) select br.bus_id from BusRoutes as br where br.route_id in (select bc.route_id from BusCities as bc where bc.bus_source = '$source' and bc.bus_destination = '$destination') and br.bus_id in (select bt.bus_id from BusTypes as bt where bt.bus_type = '$row[0]');";
						$result = mysqli_query($con, $query);
						echo "<h4>Booking successful!</h4>";
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