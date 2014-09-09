App.CompaniesNewController = Ember.Controller.extend

  actions:
    createCompany: ->
      fields = @get('fields')
      company = @store.createRecord 'company', fields
      # user = 
      # company.get('users').addObject(user);
      
      company.save().then (company) =>
        @transitionToRoute 'company', company