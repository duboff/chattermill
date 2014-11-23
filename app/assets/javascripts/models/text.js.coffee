App.Text = DS.Model.extend
  body: DS.attr 'string'
  project: DS.belongsTo 'project', async: true
  themes: DS.hasMany 'theme', async: true