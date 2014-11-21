Ember.Handlebars.helper 'titleize', (text) ->
  text.titleize()

String::titleize = ->
  @underscore().replace(/_/g, " ").capitalize()
