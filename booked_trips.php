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
					<h2><strong>Booked buses</strong></h2>
				</div>
				<form role="form" action="booked_trips.php" method="post">
				<select name="select">
					<option value="BookedFlights">Booked Flights</option>
					<option value="BookedHotels">Booked Hotels</option>
					<option value="BookedCabs">Booked Cabs</option>
					<option value="BookedBuses">Booked Buses</option>
				</select>
				<!-- <input type="submit" name="submit"> -->
				<button type="submit" formaction="booked_trips.php" name="submit">Submit</button>
			</form>
				<div class="sub-container-forms inline-form-marginleft">
				  
				  <?php
             
		     	require("connection.php");
		     	//echo"hello";
		     	if($_SERVER['REQUEST_METHOD']=='POST')
		     	{
		     //	echo "hello";
         	$tablename=$_POST['select'];
         	//echo $tablename;
         	require("connection.php");
		     	$query="select * from $tablename";

				     $result=mysqli_query($con,$query);
             // $row = mysqli_fetch_array($result,MYSQL_NUM);
				     if ($result)
				     {
				   //  	echo "OKAY";
				     }
				     if(mysqli_num_rows($result)>0){  //if a table is returned, display the table 
				     //	echo "Hello";
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
				  ?>
				</div>
				<div class="col-md-11" style="border-bottom:1px dotted silver;">
				  <br>
				</div>
			</div>
		
		<?php
			require_once('footer.php');
		?>

		</div>
	</div>
</body>
</html>
