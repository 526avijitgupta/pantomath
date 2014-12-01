


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

					require ('connection.php');
					session_start();
					$checked = $_POST['ch'];
					$source = $_SESSION['source'];
					$destination = $_SESSION['destination'];
					$date = $_SESSION['date'];
					echo $source;
					echo $destination;
					echo $date;
					if ($checked) {
						// echo "Checked array returned";
					}
					for($i=0;$i<sizeof($checked);$i++) {
						echo "The loop is running $i times";
						$row = $_SESSION['result'][$checked[$i]];
						// if($result) {

						// 	echo "The  successfullly";
						// }
						// echo $row[0];
						// 
						// 
						$query = "insert into BookedCabs(name, type, source, destination, date, price) values('$row[0]', '$row[1]', '$source', '$destination', '$date', '$row[2]');";
						// echo $query;
						$result = mysqli_query($con, $query);
						// if ($result) {
						// 	echo "Addition successfull";
						// }
						// $query = "insert into BookedCabIDs(cab_id) select cab_id from CabPrices, CabTypes, CabNames where CabPrices.cab_id = CabTypes.cab_id and CabNames.cab_id = CabPrices.cab_id and CabPrices.cab_price='$row[2]' and CabTypes.cab_type = '$row[1]' and CabNames.cab_name = '$row[1]';";
						// $query = "insert into BookedCabIDs(cab_id) select cr.cab_id from CabRoutes as cr where cb.route_id in (select cc.route_id  from CabCitites as cc where cc.acb_source = '$source' and cc.cab_destination = '$destination')";
						$query = "insert into BookedCabIDs(cab_id) select cr.cab_id from CabRoutes as cr where cr.route_id in (select cc.route_id from CabCities as cc where cc.cab_source = '$source' and cc.cab_destination = '$destination') and cr.cab_id in (select ct.cab_id from CabTypes as ct where ct.cab_type = '$row[1]');";
						$result = mysqli_query($con, $query);
						// if ($result) {
						// 	echo "Addition successfull od ids";
						// }
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