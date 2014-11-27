<!DOCTYPE html>
<html>
<head>
	<title>Book Cheap Air Tickets, Domestic Flight Ticket Booking at Lowest Airfare on Cleartrip.</title>
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<script type="text/javascript" src="bootstrap/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="Scripts/link_active_assign.js"></script>
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
					<h2><strong>Search trains</strong></h2>
					<small class="small" style="font-size:16px;">Indian Railways IRCTC Train Tickets Reservation</small>
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
						<div class="form-group col-sm-5">
							<br>
							<label for="class">Class</label>
							<br>
							<select id="class-select">
								<option value="" selected>Select Class</option>
								<option></option>
								<option></option>
							</select>
						</div>
						<div class="form-group col-sm-4 inline-form-marginleft">
							<br>
							<label for="depart on">Date</label>
							<input type="text" class="form-control" id="depart-on" placeholder="dd/mm/yy">
							<span class="ion-calendar pointer" id="date-picker"></span>
							<br>
						</div>
					</form>
					<form class="inline-form col-md-12" role="form">
						<div class="form-group col-sm-2">
							<br>
							<label for="adults">Adults</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="" selected>1</option>
								<option></option>
								<option></option>
							</select>
						</div>
						<div class="form-group col-sm-2 inline-form-select">
							<br>
							<label for="children">Children</label>
							<br>
							<select class="form-select-inline" id="children">
								<option value="" selected>0</option>
								<option></option>
								<option></option>
							</select>
							<small class="small">2-12 years</small>
						</div>
						<div class="form-group col-sm-3 inline-form-select">
							<br>
							<label for="senior-men">Senior Men</label>
							<br>
							<select class="form-select-inline" id="senior-men">
								<option value="" selected>0</option>
								<option></option>
								<option></option>
							</select>
							<small class="small"><br>60+ years</small>
						</div>
						<div class="form-group col-sm-3 inline-form-select" style="margin-left:-25px;">
							<br>
							<label for="senior-men">Senior Women</label>
							<br>
							<select class="form-select-inline" id="senior-women">
								<option value="" selected>0</option>
								<option></option>
								<option></option>
							</select>
							<small class="small"><br>58+ years</small>
							<br><br>
						</div>
					</form>
					<div class="col-md-11" style="border-bottom:1px dotted silver;">
						<br>
					</div>
				</div>
				<button class="btn btn-warning" id="search-flights-btn">Search Trains</button>
			</div>
		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>