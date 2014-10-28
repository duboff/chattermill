# For more information see: http://emberjs.com/guides/routing/
App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map ()->
  @route 'welcome', path: '/'
  @route 'about', path: '/about'

  @resource 'user', path: '/users/:user_id'

  @resource 'companies', ->
    @route 'new'
    @resource 'company', path: '/:company_id', ->
      @route 'edit'
      @resource 'subscription', ->
        @route 'new'
        @route 'edit'
      @route 'dashboard'
  @resource 'projects', ->
    @route 'new'
    @resource 'project', path: '/:project_id'

