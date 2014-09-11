App.CompaniesNewController = Ember.Controller.extend

  # needs: 'user'
  actions:
    createCompany: ->
      fields = @get('fields')
      company = @store.createRecord 'company', fields
      company.save().then (company) =>
        @transitionToRoute 'company', company
