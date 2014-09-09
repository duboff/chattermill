# For more information see: http://emberjs.com/guides/routing/
App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map ()->
  # @resource('posts')

  @route 'welcome', path: '/'
  @route 'about', path: '/about'
  @resource 'user', path: '/users/:id'
  @resource 'companies', path: '/companies', ->
    @route 'new'
    @resource 'company', path: '/:id', ->
      @route 'edit'
  
  

