require(['libTweenmax', 'libSuperscrollorama'], () ->
	st =
		body : 'body, html'
		slider : '.slider'

	dom = {}

	catchDom = ->
		dom.body = $(st.body)
		dom.slider = $(st.slider)
		return
	catchDom()

	controller = $.superscrollorama()

	controller
		.addTween('#section-3', TweenMax.from($('#section-3'), .5, {css: {opacity: .2}}))
		.addTween('#section-3', TweenMax.from($('#section-3 h2'), .5, {css: {bottom: '450px'}}))
		.addTween('#section-4', TweenMax.from($('#section-4 h2'), .5, {css: {bottom: '450px'}}))
		.addTween('#section-4', TweenMax.from($('.como-funciona > ul > li:nth-child(1)'), .5, {css: {opacity: 0, top: '450px'}}))
		.addTween('#section-4', TweenMax.from($('.como-funciona > ul > li:nth-child(2)'), .8, {css: {opacity: 0, top: '450px'}}))
		.addTween('#section-4', TweenMax.from($('.como-funciona > ul > li:nth-child(3)'), 1.1, {css: {opacity: 0, top: '450px'}}))
		.addTween('#section-5', TweenMax.from($('#section-5'), .5, {css: {opacity: 0}}))
		.addTween('#section-5', TweenMax.from($('#pager > a:nth-child(1)'), .5, {css: {rotation: 90}}))
		.addTween('#section-5', TweenMax.from($('#pager > a:nth-child(2)'), .8, {css: {rotation: 90}}))
		.addTween('#section-5', TweenMax.from($('#pager > a:nth-child(3)'), 1.1, {css: {rotation: 90}}))
		.addTween('#section-5', TweenMax.from($('#pager > a:nth-child(4)'), 1.4, {css: {rotation: 90}}))
		.addTween('#section-6', TweenMax.from($('#section-6 h2'), .5, {css: {opacity: 0}}))
		.addTween('#section-6', TweenMax.from($('#section-6 a'), 1, {css: {opacity: 0}}))
		.addTween('#section-6', TweenMax.from($('#section-6 img'), 1.5, {css: {opacity: 0}}))

	return
)