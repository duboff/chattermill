App.ProjectsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'fields', {}
    controller.set 'company', @modelFor('company')

    
    

