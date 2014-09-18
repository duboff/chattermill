# # The ApplicationRoute is always active no matter which other routes
# # are also active. The model for the application route in this app is
# # the current session, and some of the actions on the route deal with
# # handling this

# App.ApplicationRoute = Ember.Route.extend
#   # beforeModel: ->
#   #   # if e.g. another window has altered the session,the CSRF token will change
#   #   # so we need to update the version we have for any requests to work
#   #   Em.$.ajaxPrefilter (options, originalOptions, xhr) =>
#   #     xhr.fail (jqXHR, textStatus, errorThrown) =>
#   #       # This callback must happen in the next runloop, as the session
#   #       # may be in the process of updating at the moment
#   #       Em.run.next =>
#   #         if jqXHR.responseText == "Invalid CSRF token"
#   #           @notifier.info 'Your session has been reset'
#   #           @send 'resetSession'


#   # model: ->
#   #   @store.find 'session', 'current'

#   setupController: (controller, session) ->
#     # App.CSRF_TOKEN = session.get 'csrfToken'
#     # @controllerFor('session').set 'model', session

#     companies = session.get 'user.company'
#     @controllerFor('companies').set 'model', company

#     currentCompany = Companies?.get 'firstObject'
#     if currentCompany?
#       @controllerFor('company').set 'content', currentCompany

#   # actions:
#   #   resetSession: ->
#   #     @currentModel.reload().then (session) =>
#   #       App.CSRF_TOKEN = session.get 'csrfToken'
#   #       @transitionTo 'index'

#   #   logout: ->
#   #     @currentModel.set('user', null).save().then =>
#   #       @notifier.success "You have been logged out"
#   #       @send 'resetSession'

#   #   switchOrganization: (organization) ->
#   #     @controllerFor('organization').set 'content', organization

