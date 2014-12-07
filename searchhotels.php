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
					<h2><strong>Search results</strong></h2>
				</div>
				<div class="sub-container-forms inline-form-marginleft">
					<!-- <br> -->
				<?php

				 	if($_SERVER['REQUEST_METHOD']=='POST') {
				 		session_start();
						require_once('connection.php');

						$source_city = $_POST['source'];
						$check_in = $_POST['check-in'];
						$check_out = $_POST['check-out'];
						$adults = $_POST['adults'];
						$children = $_POST['children'];
						$rooms = $_POST['rooms'];
						$_SESSION['source'] = $source_city;
						$_SESSION['check-in'] = $check_in;
						$_SESSION['check-out'] = $check_out;
						$_SESSION['adults'] = $adults;
						$_SESSION['children'] = $children;
						$_SESSION['rooms'] = $rooms;

						$query = "call sh('$source_city')";
						$result = mysqli_query($con, $query);

						if( !$result ) {

							echo "The query returned nothing!";
						} else {

							if(mysqli_num_rows($result)>0){  //if a table is returned, display the table 
				      	print "<table border=1>";
				      	print "<form action='hotel_booking.php' method='post'>";
				      	print "<tr><td>Hotel Rating</td><td></td><td>Price</td><td></td><td>Name</td><td></td></tr>";
				          for($i=0;$i<mysqli_num_rows($result);$i++){

				            $row = mysqli_fetch_array($result,MYSQL_NUM);
				            $_SESSION['result'][$i] = $row;
				            print "<tr>";
				            for($j=0;$j<count($row);$j++)
					            print "<td>$row[$j]</td><td>";
					          print "<input type='checkbox' name='ch[]' value='{$i}'></input>";
					          print "</tr>";
				          }
			          print "<input type='submit' value='book' class='btn btn-success' style='position:absolute; top:300px; left:400px;'></td>";
        				print "</form>"; 
				        print "</table>"; 
				      }
						}
					}
				?>
		
		</div>
			<div class="col-md-11" style="border-bottom:1px dotted silver;"></div>
		</div>
		</div>

		<br><br>

		<?php
			require_once('footer.php');
		?>

	</div>
</body>
</html>
