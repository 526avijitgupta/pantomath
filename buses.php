<!DOCTYPE html>
<html>
<head>
	<title>Pantomath.com - Bus Booking</title>
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<link rel="stylesheet" href="Styles/datepicker.css">
	<link rel="stylesheet" href="datePicker/jqueryCalendar.css">
	<script type="text/javascript" src="bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Scripts/jquery-ui.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="Scripts/link_active_assign.js"></script>
	<script type="text/javascript" src="Scripts/connect_icon_hover.js"></script>
	<script type="text/javascript" src="Scripts/bootstrap-datepicker.js"></script>
	<script type="text/javascript">

	buses_list = ["Delhi", "Mumbai", "Chennai", "Bangalore", "Goa", "Lucknow", "Hyderabad", "Kanpur"];

	$(function(){

		//For Autocomplete
		$('#from').autocomplete({
			
			source: buses_list
		});
		$('#to').autocomplete({
			
			source: buses_list
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
					<h2><strong>Search  buses</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<br>
					<form class="inline-form" role="form">
						<div class="form-group col-sm-5">
							<label for="from">From</label>
							<input type="text" class="form-control" id="from" placeholder="Select a city">
						</div>
						<div class="form-group col-sm-5 inline-form-marginleft">
							<label for="to">To</label>
							<input type="text" class="form-control" id="to" placeholder="Select a city">
						</div>
					</form>
					<form role="form">
						<div class="form-group col-sm-4">
							<br>
							<label for="depart on">Depart on</label>
							<input type="text" class="form-control" id="depart-on" placeholder="Pick a date">
							<span class="ion-calendar pointer" id="date-picker"></span>
							<br>
						</div>
					</form>
					<div class="col-md-11" style="border-bottom:1px dotted silver;">
						<br>
					</div>
				</div>
				<button class="btn btn-warning" id="search-flights-btn">Search Buses</button>
			</div>
		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>