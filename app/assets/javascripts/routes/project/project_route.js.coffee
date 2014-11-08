App.ProjectRoute = Ember.Route.extend
  renderTemplate: ->
    @render('project')
    @render('themes', {
      into: 'project',
      outlet: 'themes',
      model: @modelFor('project').get('themes')
    })