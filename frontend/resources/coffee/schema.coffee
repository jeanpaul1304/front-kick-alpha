require.config
	baseUrl: 'js/'
	waitSeconds: 5
	urlArgs: 'v=' + (new Date()).getTime()
	paths:
		'libSkrollr': 'vendor/skrollr/dist/skrollr.min'
		'libPlax': 'vendor/plax/js/plax'
		'libBxSlider': 'vendor/bxslider-4/dist/jquery.bxslider'
		'libParsley': 'vendor/parsleyjs/dist/parsley.min'
		'libMalihu': 'vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min'
		'es': 'vendor/parsleyjs/src/i18n/es'
		'libSuperscrollorama': 'vendor/SuperScrollorama/js/jquery.superscrollorama'
		'libTweenmax': 'vendor/SuperScrollorama/js/greensock/TweenMax.min'
		'libFancybox': 'vendor/fancybox/source/jquery.fancybox'
		'async': 'vendor/requirejs-plugins/src/async'
	callback: ()->
		require ['router']
define('jquery', [], () ->
	return jQuery
)
define [], ->
	window.schema = 
		controllers:
			'index':
				actions:
					index: ->
						require(['modules/all/tabs', 'modules/index/initBxSlider', 'modules/index/initParallax','modules/all/initFancybox'])
				allActions: ->
					return
			# 'faq':
			# 	actions:
			# 		index: ->
			# 			require(['modules/all/tabs','modules/all/initFancybox'])
			# 		registrate: ->
			# 			require(['modules/all/initMalihu'])		
			# 	allActions: ->
			# 		return
		allControllers: ->
			require(['modules/all/initParsley'])
			return
	return