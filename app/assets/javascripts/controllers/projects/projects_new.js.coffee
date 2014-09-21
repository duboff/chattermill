App.ProjectsNewController = Ember.Controller.extend
  actions:
    createProject: ->
      fields = @get('fields')
      project = @store.createRecord 'project', fields
      project.save().then (project) =>
        @transitionToRoute 'project', project
