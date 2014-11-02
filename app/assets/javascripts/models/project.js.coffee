App.Project = DS.Model.extend
  name: DS.attr 'string'
  body: DS.attr 'string'
  sentimentScore: ( -> 
    themes = @get('themes')
    i = 0
    av = themes.reduce( ((prevValue, theme) ->
      i = i + 1
      prevValue + theme.get('sentimentScore')
    ), 0) / i
    Math.round(av * 100) / 100
  ).property('themes.@each.sentimentScore')
  themes: DS.hasMany 'theme', async: true
  company: DS.belongsTo 'company', async: true
  
