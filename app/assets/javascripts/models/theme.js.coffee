App.Theme = DS.Model.extend
  body: DS.attr 'string'
  sentiment_score: DS.attr 'number'
  sentiment_polarity: DS.attr 'string'
  project: DS.belongsTo('project')