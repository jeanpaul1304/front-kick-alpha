require([],() ->
	console.log "vendeindeopd vneidnienveo"
	st =
		body : 'body, html'
		scroll : '.scroll'

	dom = {}
	catchDom = ->
		dom.body = $(st.body)
		dom.scroll = $(st.scroll)
		return
	suscribeEvents = ->
		dom.scroll.on 'click', events.scrollTop
		return

	events =
		scrollTop : ->
			$this = $(this)
			top = $this.data('top')
			dom.body.animate(
				'scrollTop': top + 50
			, 1000)
			return
	catchDom()
	suscribeEvents()
	return
)