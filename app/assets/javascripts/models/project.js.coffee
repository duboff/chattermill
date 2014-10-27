App.Project = DS.Model.extend
  name: DS.attr 'string'
  body: DS.attr 'string'
  themes: DS.hasMany('theme', async: true)
  company: DS.belongsTo('company')