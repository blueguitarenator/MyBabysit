
if($) {
	$(document).ready(
		function() {
			//alert('jquery loaded');
			$(function() {
				$('#test').delay(2000).fadeOut();
			});
		});
}

$(function()
{
	Date.format = 'mm-dd-yyyy';
	Date.firstDayOfWeek = 0;
	$('#event_eventDate').datePicker();
});


