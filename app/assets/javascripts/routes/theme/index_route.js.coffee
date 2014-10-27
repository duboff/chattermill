App.ThemesRoute = Ember.Route.extend
  model: -> @modelFor('project').get('themes')
