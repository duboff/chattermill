App.Project = DS.Model.extend
  name: DS.attr 'string'
  body: DS.attr 'string'
  # texts: DS.hasMany('text')
  company: DS.belongsTo('company')