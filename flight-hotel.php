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
					<h2><strong>Search  flight + hotel</strong></h2>
					<small class="small" style="font-size:16px;">Book flight and hotels together and save big</small>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<br>
					<form class="inline-form" role="form">
						<div class="form-group col-sm-5">
							<label for="from">From</label>
							<input type="text" class="form-control" id="from" placeholder="Any worldwide city or airport">
						</div>
						<div class="form-group col-sm-5 inline-form-marginleft">
							<label for="to">To</label>
							<input type="text" class="form-control" id="to" placeholder="Any worldwide city or airport">
						</div>
					</form>
					<form class="inline-form" role="form">
						<div class="form-group col-sm-3">
							<br>
							<label for="depart-on">Depart on</label>
							<input type="text" class="form-control" id="from" placeholder="Pick a date">
						</div>
						<div class="form-group col-sm-3">
							<br>
							<label for="return-on">Return on</label>
							<input type="text" class="form-control" id="to" placeholder="Pick a date">
						</div>
						<div class="col-sm-6">
							<input type="checkbox">
							<label for="checkbox" style="font-weight:normal; font-size:13px; margin-top:10px; color:gray;"><br><br>My hotel stay is on different dates&nbsp;</label>
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
				<button class="btn btn-warning" id="search-flights-btn">Search Flight + Hotel</button>
			</div>
		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>