App.ProjectsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'fields', {}

  # model: -> @store.find 'project'
