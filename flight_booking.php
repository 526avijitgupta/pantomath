<?php

	$checked = $_POST['ch'];
	// echo sizeof($checked);
	for($i=0;$i<sizeof($checked);$i++) {
		echo $checked[$i];
	}

?>