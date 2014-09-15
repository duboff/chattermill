App.CompaniesNewController = Ember.Controller.extend
  actions:
    createCompany: ->
      fields = @get('fields')
      company = @store.createRecord 'company', fields
      company.save().then (company) =>
        @transitionToRoute 'company', company
