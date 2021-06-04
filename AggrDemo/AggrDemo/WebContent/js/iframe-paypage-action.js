$(document).ready(function() {

	// Tooltip only Text
	var PageHeight = $(window).height();
	var PageWidth = $(window).width();
	$('.masterTooltip').hover(function(){
			var title = $(this).attr('title');
			$(this).data('tipText', title).removeAttr('title');
			$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
	}, function() {
			$(this).attr('title', $(this).data('tipText'));
			$('.tooltip').remove();
	}).mousemove(function(e) {
			if(PageWidth < 380){
				var mousex = e.pageX - 100;
			} else {
				var mousex = e.pageX; 
			}
			var mousey = e.pageY;
			$('.tooltip').css({top: mousey, left: mousex });
	});
});

