
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
	Date.format = 'yyyy-mm-dd';
	Date.firstDayOfWeek = 0;
	$('#event_eventDate').datePicker();
});


