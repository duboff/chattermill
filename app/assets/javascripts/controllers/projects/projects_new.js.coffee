# App.ProjectsNewController = Ember.Controller.extend
#   actions:
#     createProject: (params) ->
#       company = @get('company')
#       fields = @get('fields')
#       project = @store.createRecord 'project', fields
#       project.set('company', @get('company'))
#       project.save().then (project) =>
#         @transitionToRoute 'project', project
