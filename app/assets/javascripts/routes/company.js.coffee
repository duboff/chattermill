App.CompanyRoute = Ember.Route.extend

  model: (params) -> 
    @store.find 'company', params.company_id