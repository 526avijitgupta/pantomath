<!DOCTYPE html>
<html>
<head>
	<title>Pantomath.com - Cab Booking</title>
	<link rel="stylesheet" href="Styles/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<link rel="stylesheet" href="Styles/datepicker.css">
	<script type="text/javascript" src="Scripts/jquery.js"></script>
	<script type="text/javascript" src="Scripts/link_active_assign.js"></script>
	<script type="text/javascript" src="Scripts/jquery-ui.js"></script>
	<script type="text/javascript" src="Scripts/connect_icon_hover.js"></script>
	<script type="text/javascript" src="Scripts/bootstrap-datepicker.js"></script>
	<script type="text/javascript">

	cabs_list = ["New Delhi", "Mumbai", "Chennai", "Bangalore", "Hyderabad", "Kolkata"];

	$(function(){

		//For Autocomplete
		$('#from').autocomplete({
			
			source: cabs_list
		});
		$('#to').autocomplete({
			
			source: cabs_list
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
					<h2><strong>Search cabs</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<br>
					<form class="inline-form" role="form" action="cabs.php" method="post">
						<div class="form-group col-sm-5">
							<label for="from">From</label>
							<input type="text" name="source" class="form-control" id="from" placeholder="Select a city">
						</div>
						<div class="form-group col-sm-5 inline-form-marginleft">
							<label for="to">To</label>
							<input type="text" name="destination" class="form-control" id="to" placeholder="Select a city">
						</div>
					<!-- </form> -->
					<!-- <form role="form"> -->
						<div class="form-group col-sm-4">
							<br>
							<label for="depart on">Depart on</label>
							<input type="text" class="form-control" id="depart-on" placeholder="Pick a date">
							<span class="ion-calendar pointer" id="date-picker"></span>
							<br>
						</div>
						</div>
							<button class="btn btn-warning" id="search-flights-btn" type="submit" formaction="cabs.php">Search Cabs</button>
						</div>
					</form>
					<div class="col-md-11" style="border-bottom:1px dotted silver;">
						<br>
					</div>
		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>



<?php
	// $source_city = "NULL";
	// $destination_city = "NULL";

 	if($_SERVER['REQUEST_METHOD']=='POST') {

 		// print_r($_POST);
		require_once('connection.php');
		// $children = $_POST['children'];
		// echo $children;
		$source_city = $_POST['source'];
		$destination_city = $_POST['destination'];

		// $query = "Select * from FlightCities where flight_source = " . '"' . $source_city . '"' . " and flight_destination =  " . '"' . $destination_city . '"' ;
		// $query = "Select route_id from FlightCities where flight_source = '$source_city' and flight_destination = '$destination_city'";
		$query = "select cn.cab_name , ct.cab_type, cp.cab_price from CabNames as cn, CabTypes as ct, CabPrices as cp where cp.cab_id = ct.cab_id and ct.cab_id = cn.cab_id and ct.cab_id in (Select cr.cab_id from CabRoutes as cr, CabCities as cc, CabTypes as ct where cr.route_id = cc.route_id and cc.route_id in (select route_id from CabCities where cab_source = '$source_city' and cab_destination = '$destination_city'));";
		// echo $query;
		$result = mysqli_query($con, $query);

		if( !$result ) {

			echo "The query returned nothing!";
		} else {
			// $row = mysqli_fetch_array($result,MYSQL_NUM);
			// echo $row[1];

			if(mysqli_num_rows($result)>0){  //if a table is returned, display the table 
      	print "<table border=1>";
          for($i=0;$i<mysqli_num_rows($result);$i++){

            $row = mysqli_fetch_array($result,MYSQL_NUM);
            print "<tr>";
            for($j=0;$j<count($row);$j++)
	            print "<td>$row[$j]</td>";
	          print "</tr>";
          }
        print "</table>"; 
      }
		}
	}
?>