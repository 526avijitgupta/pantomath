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
					<h2><strong>Search  flights</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<br>
				<!-- <form method="POST" action="actions/selectflights.php"> -->
				
				<form method="POST" role="form" action="index.php" method="POST" target="_self">
					<!-- <form class="inline-form" role="form"> -->
						<div class="form-group col-sm-5">
							<label for="from">From</label>
							<input type="text" name="source_input" class="form-control" id="from" placeholder="Select a city">
						</div>
						<div class="form-group col-sm-5 inline-form-marginleft">
							<label for="to">To</label>
							<input type="text" name="destination_input" class="form-control" id="to" placeholder="Select a city">
						</div>
					<!-- </form> -->
					<!-- <form class="inline-form" role="form"> -->
						<div class="form-group col-sm-4">
							<br>
							<label for="depart on">Depart on</label>
							<input type="text" name="depart_date" class="form-control" id="depart-on" placeholder="Pick a date" data-date-format="dd-mm-yy">
							<span class="ion-calendar pointer" id="date-picker"></span>
							<br>
							<br>
						</div>
					<!-- </form> -->
					<!-- <form class="inline-form col-md-12" role="form"> -->
						<div class="form-group col-sm-2">
							<br>
							<label for="adults">Adults</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>
						</div>
						<div class="form-group col-sm-2 inline-form-select">
							<br>
							<label for="children">Children</label>
							<br>
							<select class="form-select-inline" name="children" id="adults">
								<option value="0" selected>0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
							<small class="small">2-12 years</small>
						</div>
					<!-- </form> -->
					<div class="col-md-11" style="border-bottom:1px dotted silver;"></div>
						<button class="btn btn-warning" type="submit" formaction="index.php" id="search-flights-btn">Search Flights</button>
					</div>
				</form>
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
		$source_city = $_POST['source_input'];
		$destination_city = $_POST['destination_input'];

		// $query = "Select * from FlightCities where flight_source = " . '"' . $source_city . '"' . " and flight_destination =  " . '"' . $destination_city . '"' ;
		// $query = "Select route_id from FlightCities where flight_source = '$source_city' and flight_destination = '$destination_city'";
		$query = "select fn.flight_name, fd.flight_arr_time, fd.flight_dept_time, fd.flight_price from FlightData as fd, FlightNames as fn where fn.flight_id = fd.flight_id and fn.flight_id in (select fr.flight_id from FlightRoutes as fr, FlightCities as fc where fc.route_id = fr.route_id and fc.route_id in (Select route_id from FlightCities where flight_source = '$source_city' and flight_destination = '$destination_city'))";
		// echo $query;
		$result = mysqli_query($con, $query);

		if( !$result ) {

			echo "The query returned nothing!";
		} else {
			// $row = mysqli_fetch_array($result,MYSQL_NUM);
			// echo $row[1];

			if(mysqli_num_rows($result)>0) {  //if a table is returned, display the table 
      	print "<table border=1>";
        print "<form action='flight_booking.php' method='post'>";
          for($i=0;$i<mysqli_num_rows($result);$i++){

            $row = mysqli_fetch_array($result,MYSQL_NUM);
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