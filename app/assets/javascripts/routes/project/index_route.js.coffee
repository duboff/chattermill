App.ProjectsIndexRoute = Ember.Route.extend
  model: -> @modelFor('company').get('projects')
