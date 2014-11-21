App.CompaniesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'company'
  actions:
    createCompany: ->
      @currentModel.save().then (model) =>
        @transitionTo 'company', model
      
  
