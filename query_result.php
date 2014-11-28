<!--*********************************************************************
	This application executes the entered query on the entered database
    whenever this script receives the POST request through the form.
*************************************************************************-->
<html>
<head>
	<title>Sample Application</title>
</head>
<body>
	<form method="POST" action="query_result.php">
		<!-- <input type="text" name="database" placeholder="Enter database name..."/>
		<input type="text" name="query" placeholder="Enter query here..."/> -->
    <select name="select_name">
      <option val="1">1</option>
      <option val="2">2</option>
    </select>
		<input type="submit" value="Go"/>
	</form>
<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
  
  require_once("mysql_connect.php");  //Include file to connect to database

  $select = $_POST['select_name'];
  // echo $select;
  // $database = $_POST['database'];
  // $query = $_POST['query']; 
  /* The form method was POST so we use $_POST to access all name=something pairs
     of the form.
  */ 
  //if database exist we execute the query
  if(mysqli_select_db($con,"pantomath")){ 
        
        // echo ("call inparam(" + (int)$select + ")");
        // echo ("select" + "1");
        if(!$empty) {
          
          $result = mysqli_query($con,"call inparam(" . $select . ")");
        }
        
        if(!$result){
        	echo "<h3>Check your query again.</h3>";
        	//There is something wrong with the query.
        }else{
          echo "<h3>The query has executed successfully.</h3>";
          echo "<br>";
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
    }else{
    	echo "Database doesn't exist.";
    }
} 
?>