App.Theme = DS.Model.extend
  body: DS.attr 'string'
  sentimentScore: DS.attr 'number'
  sentimentPolarity: DS.attr 'string'
  project: DS.belongsTo('project')