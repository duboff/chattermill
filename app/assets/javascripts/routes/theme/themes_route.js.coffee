App.ThemesRoute = Ember.Route.extend
  model: -> 
    @store.find 'theme'