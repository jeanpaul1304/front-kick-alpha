alpha = window.alpha
window.flagIsLoad = false
window.onload = ()->
	window.flagIsLoad = true
if typeof alpha == 'undefined'
	alpha = {}
do ->
	mod = alpha.module
	ctrl = alpha.controller
	act = alpha.action
	console.log '%c ==> module: ' + mod + ' - controller: ' + ctrl + ' - action: ' + act, 'background: #222; color: #bada55'
	return
require ['schema']