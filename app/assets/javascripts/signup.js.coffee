$ ->
  $(".button-checkbox").each ->
    
    # Settings
    
    # Event Handlers
    
    # Actions
    updateDisplay = ->
      isChecked = $checkbox.is(":checked")
      
      # Set the button's state
      $button.data "state", (if (isChecked) then "on" else "off")
      
      # Set the button's icon
      $button.find(".state-icon").removeClass().addClass "state-icon " + settings[$button.data("state")].icon
      
      # Update the button's color
      if isChecked
        $button.removeClass("btn-default").addClass "btn-" + color + " active"
        $signup.removeClass('disabled')
      else
        $button.removeClass("btn-" + color + " active").addClass "btn-default"
      return
    
    # Initialization
    init = ->
      updateDisplay()
      
      # Inject the icon if applicable
      $button.prepend "<i class=\"state-icon " + settings[$button.data("state")].icon + "\"></i>"  if $button.find(".state-icon").length is 0
      return
    $widget = $(this)
    $button = $widget.find("button")
    $checkbox = $widget.find("input:checkbox")
    $signup = $('#register')
    color = $button.data("color")
    settings =
      on:
        icon: "glyphicon glyphicon-check"

      off:
        icon: "glyphicon glyphicon-unchecked"

    $button.on "click", ->
      
      $checkbox.prop "checked", not $checkbox.is(":checked")
      $checkbox.triggerHandler "change"
      updateDisplay()

    $checkbox.on "change", ->
      updateDisplay()

    init()
