App.SubscriptionEditRoute = Ember.Route.extend
  model: -> @store.find 'plan'
