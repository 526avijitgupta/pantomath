<!DOCTYPE html>
<html>
<head>
	<title>Book Cheap Air Tickets, Domestic Flight Ticket Booking at Lowest Airfare on Cleartrip.</title>
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<link rel="stylesheet" href="Styles/datepicker.css">
	<script type="text/javascript" src="bootstrap/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="Scripts/jquery-ui.js"></script>
	<script type="text/javascript" src= "Scripts/link_active_assign.js"></script>
	<script type="text/javascript" src="Scripts/connect_icon_hover.js"></script>
	<script type="text/javascript" src="Scripts/validate_form.js"></script>
	<script type="text/javascript" src="Scripts/bootstrap-datepicker.js"></script>
	<script type="text/javascript">

		airports_list = ["New Delhi","Mumbai","New York","Chennai","Kolkata","London","Tokyo","Madrid","Paris","Maldives","Singapore","Beijing","Jakarta","Dubai"];

		$(function(){

	// 		$.ajax({
	// 		type: "POST",
	// 		url: "",//"sqldata.php",
	// 		success: function (result) {
	// 			if(result) {

	// 				var ajax_airport_list = JSON.parse(result);
	// 				var counter = 0;
	// 				while(ajax_airports_list[counter]) {
	// 					airports_list.push(ajax_airports_list[counter]);
	// 					counter += 1;
	// 				}

	// 				$('#from').autocomplete({
	// 					source: airports_list
	// 				});
	// 				$('#to').autocomplete({
	// 					source: airports_list
	// 				});
	// 			}
	// 		}
	// });

	//For Autocomplete
	$('#from').autocomplete({
		source: airports_list
	});
	$('#to').autocomplete({
		source: airports_list
	});

	//For Datepicker
	$('#depart-on').datepicker();

	//For Round Trip
	// $('input[type="radio"]').on('click',function() {
	// 	if ( $('input[type="radio"]:checked').val() == "round-trip" ) {
	// 			$('#return-on-wrap').show();
	// 	}	else {
	// 		$('#return-on-wrap').hide();
	// 	}
	// });

	// if ('#return-on-wrap:visible') {
	// 		var depart_date =	$('#depart-on').val();
	// 		$(this).datepicker('startDate',depart_date);
	// }

	$('#more-options').on('click',function(){
			$('#more-opt-form').show();
	});

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

			<div class="col-sm-6 content-sub-container" id="flights-content">
				<div class="content-head-wrap inline-form-marginleft">
					<h2><strong>Search  flights</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<!-- <form role="form">
							<br>
							<label class="checkbox-inline">
								<input type="radio" name="radio-filter" id="flights-form-radio-1" value="one-way" checked>
								One Way
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="radio-filter" id="flights-form-radio-2" value="round-trip">
								Round Trip
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="radio-filter" id="flights-form-radio-3" value="multicity">
								Multicity
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="radio-filter" id="flights-form-radio-4" value="flight-hotel">
								Flight + Hotel
							</label>
					</form> -->
					<br>
					<form class="inline-form" role="form">
						<div class="form-group col-sm-5">
							<label for="from">From</label>
							<input type="text" class="form-control" id="from" placeholder="Any worldwide city or airport">
						</div>
						<span class="ion-android-arrow-forward" id="from-to"></span>
						<div class="form-group col-sm-5 inline-form-marginleft">
							<label for="to">To</label>
							<input type="text" class="form-control" id="to" placeholder="Any worldwide city or airport">
						</div>
					</form>
					<form class="inline-form" role="form">
						<div class="form-group col-sm-4">
							<br>
							<label for="depart on">Depart on</label>
							<input type="text" class="form-control" id="depart-on" placeholder="Pick a date" data-date-format="dd-mm-yy">
							<!-- <span class="ion-calendar pointer" id="date-picker"></span> -->
							<br>
						</div>
						<div class="form-group col-sm-4" id="return-on-wrap" style="display:none; margin-left:110px;">
							<br>
							<label for="return on">Return on</label>
							<input type="text" class="form-control" id="return-on" placeholder="Pick a date" data-date-format="dd-mm-yy">
							<!-- <span class="ion-calendar pointer" id="date-picker"></span> -->
							<br>
						</div>
					</form>
					<form class="inline-form col-md-12" role="form">
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
							<small class="small">2-12 years</small>
						</div>
						<!-- <div class="form-group col-sm-2 inline-form-select">
							<br>
							<label for="infants">Infants</label>
							<br>
							<select class="form-select-inline" id="adults">
								<option value="0" selected>0</option>
								<option value="1">1</option>
							</select>
							<small class="small">Below 2 years</small>
							<br><br>
						</div> -->
					</form>
					<!-- <div class="col-md-11" style="border-bottom:1px dotted silver;">
						<a id="more-options" href="#more-opt-form">
							<strong>More Options: </strong>
							Class of travel, Airline preference
						</a>
						<br><br>
					</div>
					<form class="inline-form" id="more-opt-form" role="form" style="display:none;">
						<div class="form-group col-sm-4">
							<br>
							<label for="class of travel">Class of Travel</label>
							<br>
							<select class="form-select-inline" id="travel-class">
								<option value="economy" selected>Economy</option>
								<option value="business">Business</option>
								<option value="first">First</option>
								<option value="premium-business">Premium Business</option>
							</select>
						</div>						
						<div class="form-group col-sm-4">
							<br>
							<label for="class of travel">Preferred Airline</label>
							<br>
							<input type="text" class="form-control" id="preferred-airline">
						</div>
					</form> -->
				</div>
				<button class="btn btn-warning" id="search-flights-btn">Search Flights</button>
			</div>

			<div class="col-sm-6 content-sub-container" id="search-results-container" style="display:none;">
				<div class="content-head-wrap"> <!--  inline-form-marginleft -->
					<h2><strong>Search  results</strong></h2>
				</div>
				<!-- Results appended here -->
				<div class="results-div-wrap"></div>		
			</div>

		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>