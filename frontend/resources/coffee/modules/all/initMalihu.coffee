require(['libMalihu'], () ->
	$(".mCustomScrollbar").mCustomScrollbar
		autoHideScrollbar: true
		scrollInertia: 0
		mouseWheel: true
	console.log $(".mCustomScrollbar")
	console.log "algo"
	return
)