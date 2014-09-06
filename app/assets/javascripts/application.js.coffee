#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require handlebars
#= require ember
#= require ember-data
#= require ember-devise-simple-auth/globals
#= require_self
#= require app

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
  deviseEmberAuth:
    signInPath: "/sign-in"
    userModelType: "user" # **ember-data only** name of the model that represents your user; same thing you'd pass to `store.find("...")` in a route
    deviseSignInPath: "/users/sign_in" # the URL to POST to for creating a session
    deviseSignOutPath: "/users/sign_out" # the URL to DELETE to for signing out
    currentSessionPath: "/sessions/current" # the URL for getting the current signed-in state; this is currently added by the gem
  )

