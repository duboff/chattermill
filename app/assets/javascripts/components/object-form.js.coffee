App.ObjectFormComponent = Em.Component.extend
  buttonLabel: "Submit"

  actions:
    submit: ->
      @sendAction()
