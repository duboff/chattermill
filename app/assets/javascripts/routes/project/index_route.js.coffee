App.ProjectsRoute = Ember.Route.extend
  model: -> @modelFor('company').get('projects')
