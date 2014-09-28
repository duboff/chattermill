App.User = DS.Model.extend
  company: DS.belongsTo('company')
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  email: DS.attr('string')
  fullName: ( ->
    @get('firstName') + ' ' + @get('lastName')
  ).property('firstName', 'lastName')
  company: DS.belongsTo('company', async: true)
  