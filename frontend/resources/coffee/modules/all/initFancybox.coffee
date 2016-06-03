require(['libFancybox'], () ->
	st =
		popup : '.popup'
		login : '.login_popup'
	dom = {}

	catchDom = ->
		dom.popup = $(st.popup)
		dom.login = $(st.login)
		return
	catchDom()

	functions =
		initFancybox: () ->
			dom.popup.fancybox(
				width: 468
			)
			dom.login.fancybox(
				width: 468
				beforeShow: ()->
					$('.fancybox-overlay').css('background','rgba(0, 0, 0, 0.68)')
			)
			return

	functions.initFancybox()
	return
)