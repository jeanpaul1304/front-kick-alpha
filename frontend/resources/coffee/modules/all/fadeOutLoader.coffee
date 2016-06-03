define(['modules/all/domReady'], (domReady) ->
	console.log 'fade1...'
	st =
		body : 'body, html'
		loader : '#loader'

	dom = {}
	catchDom = ->
		dom.body = $(st.body)
		dom.loader = $(st.loader)
		return
	catchDom()

	functions =
		fadeLoader : ->
			dom.loader.children('div').animate(
				'top': '150%'
			, 500,
			() ->
				dom.loader.fadeOut()
				return
			)
			return
	domReady(() ->
		functions.fadeLoader()
	)
	return
)