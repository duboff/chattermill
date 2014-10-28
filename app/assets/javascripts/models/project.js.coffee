App.Project = DS.Model.extend
  name: DS.attr 'string'
  body: DS.attr 'string'
  sentiment_score: ( -> 
    themes = @get('themes')
    i = 0
    av = themes.reduce( ((prevValue, theme) ->
      i = i + 1
      prevValue + theme.get('sentiment_score')
    ), 0) / i
    Math.round(av * 100) / 100
  ).property('themes.@each.sentiment_score')
  themes: DS.hasMany 'theme', async: true
  company: DS.belongsTo 'company', async: true
  
