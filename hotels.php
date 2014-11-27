<!DOCTYPE html>
<html>
<head>
	<title>Book Cheap Air Tickets, Domestic Flight Ticket Booking at Lowest Airfare on Cleartrip.</title>
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<script type="text/javascript" src="bootstrap/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src= "Scripts/link_active_assign.js"></script>
	<script type="text/javascript" src="Scripts/connect_icon_hover.js"></script>
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

			<div class="col-sm-6 content-sub-container" id="flights-content">
				<div class="content-head-wrap inline-form-marginleft">
					<h2><strong>Search for hotels</strong></h2>
					<small class="small" style="font-size:16px;">Over 100,000 hotels around the world</small>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<form role="form">
							<br>
							<label class="checkbox-inline">
								<input type="radio" name="radio-filter" id="flights-form-radio-1" value="one-way" checked>
								Hotels
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="radio-filter" id="flights-form-radio-1" value="round-trip">
								Weekend Getaways
							</label>
					</form>
					<br>
					<form role="form">
						<div class="form-group col-sm-11">
							<br>
							<label for="Where">Where</label>
							<input type="text" class="form-control" placeholder="Enter a city, area, landmark or hotel">
							<br>
						</div>
					</form>
					<form class="inline-form" role="form">
						<div class="form-group col-sm-3">
							<label for="check-in">Check In</label>
							<input type="text" class="form-control" id="check-in" placeholder="Pick a date">
						</div>
						<div class="form-group col-sm-3">
							<label for="check-out">Check Out</label>
							<input type="text" class="form-control" id="check-out" placeholder="Pick a date">
						</div>
					</form>
					<form class="inline-form col-md-12" role="form">
						<div class="form-group col-sm-2">
							<br>
							<label for="adults">Rooms</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="" selected>1</option>
								<option></option>
								<option></option>
							</select>
						</div>
						<div class="form-group col-sm-2 inline-form-select" style="margin-left:60px;">
							<br>
							<label for="children">Adults</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="" selected>0</option>
								<option></option>
								<option></option>
							</select>
							<small class="small">12+ years</small>
						</div>
						<div class="form-group col-sm-2 inline-form-select">
							<br>
							<label for="infants">Children</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="" selected>1</option>
								<option></option>
								<option></option>
							</select>
							<small class="small">0-11 years</small>
							<br><br>
						</div>
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