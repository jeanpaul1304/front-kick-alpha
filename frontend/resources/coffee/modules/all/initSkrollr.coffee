require(['libSkrollr'], (skrollr) ->
	w = $(window).width()
	if w > 550
		s = skrollr.init()
	$(window).on('resize', ()->
		w = $(window).width()
		if w > 550
			s = skrollr.init()
		else
			s = skrollr.init().destroy()
		return
	)
	return
)