define [], ->
	getCtrl = (schema) ->
		for parents of schema
			parents = parents
			if parents == 'allControllers'
				schema[parents]()
			if parents == 'controllers'
				for controller of schema[parents]
					if controller == alpha.controller
						for actions of schema[parents][controller]
							for action of schema[parents][controller][actions]
								if action == alpha.action
									schema[parents][controller][actions][action]()
		return
	getCtrl window.schema
	return