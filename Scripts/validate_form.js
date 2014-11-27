$(function(){

	$('#search-flights-btn').on('click',function (event){
		event.preventDefault();

		var from_val = $('#from').val();
		var to_val = $('#to').val();
		var date_val = $('#depart-on').val();
		var flag = 0;
		var alert_message = "";

		if( !from_val ) {
			flag = 1;
			alert_message += "\nPlease provide the source!";	
			$('#from').focus();
		}
		if( !to_val ) {
			flag = 1;
			alert_message += "\nPlease provide the destination!";	
			$('#to').focus();
		}
		if( !date_val ) {
			alert_message += "\nPlease provide the date!";	
			$('#depart-on').focus();
		}

		if( from_val == to_val && flag==0 ) {
			alert_message += "\nThe source and destination cannot be the same!";
		}

		if(alert_message) {
			alert(alert_message);
		}

		else {
			$('#flights-content').hide();
			$('#search-results-container').show();
		}

	});

});