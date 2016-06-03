require(['libBxSlider'], () ->
	st =
		body : 'body, html'
		slider : '.slider'

	dom = {}

	catchDom = ->
		dom.body = $(st.body)
		dom.slider = $(st.slider)
		return
	catchDom()

	functions =
		initBxSlider: () ->
			dom.slider.children('ul').bxSlider(
				'controls': true
				'auto': false
				'infiniteLoop': true
				'pagerCustom': '#pager'
				'mode': 'fade'
			)
			return

	functions.initBxSlider()
	return
)