App.Theme = DS.Model.extend
  body: DS.attr 'string'
  sentimentScore: DS.attr 'number'
  weight: DS.attr 'number'
  sentimentPolarity: DS.attr 'string'
  project: DS.belongsTo 'project', async: true
  texts: DS.hasMany 'text', async: true