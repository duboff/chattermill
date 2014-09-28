App.Company = DS.Model.extend
  name: DS.attr 'string'
  website: DS.attr 'string'
  users: DS.hasMany('user', async: true)
  plan: DS.belongsTo 'plan'
  projects: DS.hasMany('project', async: true)
