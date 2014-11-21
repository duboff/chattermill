App.ProjectsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'project'
  actions:
    createProject: ->
      company = @modelFor('company')
      @currentModel.set('company', company)
      @currentModel.save().then (model) =>
        @transitionTo 'project', model

    
    

