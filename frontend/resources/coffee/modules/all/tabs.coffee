require([], () ->
	st =
		tab : '.tabs > ul > li'
		containers : '.tabs > div > div'
	dom = {}
	catchDom = ->
		dom.tab = $(st.tab)
		dom.containers = $(st.containers)
		return
	suscribeEvents = ->
		dom.tab.on 'click', events.changeTab
		return
	events =
		changeTab : ()->
			$this = $(this)
			$this
				.addClass('active')
				.siblings().removeClass('active')
			dom.containers.eq($this.index()).show().siblings().hide()
			return
	catchDom()
	suscribeEvents()
	return
)