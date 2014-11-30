<!DOCTYPE html>
<html>
<head>
	<title>Pantomath.com - Hotel Booking</title>
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

	hotels_list = ["Delhi", "Mumbai", "Chennai", "Bangalore", "Goa", "Kolkata", "Lucknow"];

	$(function(){

		//For Autocomplete
		$('#location').autocomplete({
			source: hotels_list
		});

		//For Datepicker
		$('#check-in').datepicker();
		$('#check-out').datepicker();
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
					<h2><strong>Search hotels</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<!-- <br> -->
					<form role="form" action="hotels.php" method="post">
						<div class="form-group col-sm-11">
							<br>
							<label for="Where">Where</label>
							<input type="text" name="source" class="form-control" id="location" placeholder="Enter a city, area, landmark or hotel">
							<!-- <br> -->
						</div>
					<!-- </form> -->
					<!-- <form class="inline-form" role="form"> -->
						<div class="form-group col-sm-4">
							<br>
							<label for="check-in">Check In</label>
							<input type="text" class="form-control" id="check-in" placeholder="Pick a date">
							<span class="ion-calendar pointer" id="date-picker" style="margin-left:-7px;"></span>
							<br><br>
						</div>
						<div class="form-group col-sm-4 inline-form-marginleft">
							<br>
							<label for="check-out">Check Out</label>
							<input type="text" class="form-control" id="check-out" placeholder="Pick a date">
							<span class="ion-calendar pointer" id="date-picker" style="margin-left:-7px;"></span>
							<br><br>
						</div>
						<br>
					<!-- </form> -->
					<!-- <form class="inline-form col-md-12" role="form"> -->
						<div class="form-group col-sm-2">
							<br>
							<label for="adults">Rooms</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="" selected>1</option>
								<option>2</option>
								<option>3</option>
							</select>
						</div>
						<div class="form-group col-sm-2 inline-form-select" style="margin-left:60px;">
							<br>
							<label for="children">Adults</label>
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
							<small class="small">12+ years</small>
						</div>
						<div class="form-group col-sm-2 inline-form-select">
							<br>
							<label for="infants">Children</label>
							<br>
							<select class="form-select-inline" id="adults">
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
							<small class="small">0-11 years</small>
							<br><br>
						</div>
						</div>
							<button class="btn btn-warning" id="search-flights-btn" type="submit" formaction="hotels.php">Search Hotels</button>
						</div>
					</form>
				<div class="col-md-11" style="border-bottom:1px dotted silver;"></div>
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

		// $query = "Select * from FlightCities where flight_source = " . '"' . $source_city . '"' . " and flight_destination =  " . '"' . $destination_city . '"' ;
		// $query = "Select route_id from FlightCities where flight_source = '$source_city' and flight_destination = '$destination_city'";
		$query = "select hr.hotel_rating, hp.hotel_price, hd.hotel_name from HotelRatings as hr, HotelPrices as hp, HotelData as hd where hr.hotel_id = hp.hotel_id and hd.hotel_id = hp.hotel_id and hd.location_id in (select hc.location_id from HotelCities as hc, HotelData as hd where hc.location_id = hd.location_id and hd.location_id in(select location_id from HotelCities where location = '$source_city'));";
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