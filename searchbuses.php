<!DOCTYPE html>
<html>
<head>
	<title>Pantomath.com - Bus Booking</title>
	<link rel="stylesheet" href="Styles/bootstrap.min.css">
	<link rel="stylesheet" href="Styles/main.css">
	<link rel="stylesheet" href="Styles/ionicons.css">
	<link rel="stylesheet" href="Styles/datepicker.css">
	<script type="text/javascript" src="Scripts/jquery.js"></script>
	<script type="text/javascript" src="Scripts/jquery-ui.js"></script>
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
					<h2><strong>Search results</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<br>

					<?php

					 	if($_SERVER['REQUEST_METHOD']=='POST') {

							require_once('connection.php');
							session_start();
							$source_city = $_POST['source'];
							$destination_city = $_POST['destination'];
							$date = $_POST['date'];
							$_SESSION['source'] = $source_city;
							$_SESSION['destination'] = $destination_city;
							$_SESSION['date'] = $date;

							$query = "call sb('$source_city', '$destination_city')";
							$result = mysqli_query($con, $query);

							if( !$result ) {

								echo "The query returned nothing!";
							} else {

								if(mysqli_num_rows($result)>0){  //if a table is returned, display the table 
					      	print "<table border=1>";
					      	print "<form action='bus_booking.php' method='post'>";
					      	print "<tr><td>Bus Type</td><td></td><td>Arrival Time</td><td></td><td>Departure Time</td><td></td><td>Price</td><td></td></tr>";
					          for($i=0;$i<mysqli_num_rows($result);$i++){

					            $row = mysqli_fetch_array($result,MYSQL_NUM);
					            $_SESSION['result'][$i] = $row;
					            print "<tr>";
					            for($j=0;$j<count($row);$j++)
						            print "<td>$row[$j]</td><td>";
						          print "<input type='checkbox' name='ch[]' value='{$i}'></input>";
						          print "</tr>";
					          }
				          print "<input type='submit' value='book' style='position:absolute; top:250px; left:400px;'></td>";
      						print "</form>"; 
					        print "</table>"; 
					      }
							}
						}
					?>
				</div>
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
