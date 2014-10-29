App.ThemeRoute = Ember.Route.extend
  model: (params) -> 
    @store.find 'theme', params.theme_id