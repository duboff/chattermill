App.SubscriptionNewController = Em.ArrayController.extend
  needs:        ['subscription']
  isUpdating:   Em.computed.alias 'controllers.subscription.isUpdating'
