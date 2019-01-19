require_relative 'lib/race'
require_relative 'lib/controller'
require_relative 'router'

race = Race.new
controller = Controller.new(race)
router = Router.new(controller)

# Start the app
router.run
