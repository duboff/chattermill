App.Project = DS.Model.extend
  name: DS.attr 'string'
  body: DS.attr 'string'
  sentiment_score: DS.attr 'number'
  themes: DS.hasMany('theme', {async: true})
  company: DS.belongsTo('company', {async: true})