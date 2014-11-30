<!DOCTYPE html>
<html>
<head>
	<title>Pantomath.com - Hotel Booking</title>
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<link rel="stylesheet" href="Styles/datepicker.css">
	<script type="text/javascript" src="bootstrap/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src= "Scripts/link_active_assign.js"></script>
	<script type="text/javascript" src= "Scripts/jquery-ui.js"></script>
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
					<form role="form">
						<div class="form-group col-sm-11">
							<br>
							<label for="Where">Where</label>
							<input type="text" class="form-control" id="location" placeholder="Enter a city, area, landmark or hotel">
							<!-- <br> -->
						</div>
					</form>
					<form class="inline-form" role="form">
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
					</form>
				<div class="col-md-11" style="border-bottom:1px dotted silver;"></div>
				</div>
				<button class="btn btn-warning" id="search-flights-btn">Search Hotels</button>
			</div>
		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>