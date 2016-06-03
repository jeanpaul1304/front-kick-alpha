require([], () ->
	st =
		fileButton : '.file > a'
		fileInput : '.file > input'
	dom = {}
	catchDom = ->
		dom.fileButton = $(st.fileButton)
		dom.fileInput = $(st.fileInput)
		return
	suscribeEvents = ->
		dom.fileButton.on 'click', events.triggerInput
		dom.fileInput.on 'change', events.inputChanges
		return
	events =
		triggerInput : ()->
			$this = $(this)
			$this.next().trigger('click')
			return
		inputChanges : ()->
			$this = $(this)
			val = $this.val()
			$this.next().text(val)
			return
	catchDom()
	suscribeEvents()
	return
)