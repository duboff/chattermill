App.ProjectRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'project', params.project_id 
  renderTemplate: ->
    @render('project')
    @render('themes', {
      into: 'project',
      outlet: 'themes',
      model: @modelFor('project').get('themes')
    })