App.SubscriptionNewRoute = Ember.Route.extend
  model: -> @store.find 'plan'
