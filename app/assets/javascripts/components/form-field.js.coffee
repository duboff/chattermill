# The form field component is a simple component representing a
# field in a form, allowing easy creation of forms with a less
# verbose syntax

App.FormFieldComponent = Em.Component.extend
  # automatically use a password field if the field name includes
  # the word "password"
  type: (->
    if @get('for').match(/password/)
      "password"
    else
      "text"
  ).property 'for'

  # you can override this if you like, e.g.
  # {{form-field for='email' label="Your email address"}}
  label: (->
    @get('for').titleize()
  ).property 'for'

  # a unique field id is required so that the label element can be
  # associated with the correct input element
  fieldId: (->
    "#{Em.guidFor @get('object')}-input-#{@get('for')}"
  ).property 'object', 'for'

  isTextArea: Em.computed.equal 'type', 'textarea'

  # The form-field component must be wrapped in an {{object-form}}
  # component, which is passed the object that the form represents
  object: Em.computed.alias 'parentView.for'


  # dynamically bind the value field to the right field on the object
  # needed because the field is provided as a string

  # This is just to make the api nicer to use, you could pass in both
  # the string and the value into the component to avoid this magic.

  # So by setting up these bindings, you can write in your template:
  # {{form-field for="email"}}
  # instead of
  # {{form-field label="email" value=email}}
  setupBindings: (->
    @binding?.disconnect @ # Disconnect old binding if present

    # Create a binding between the value property of the component,
    # and the correct field name on the model object.
    @binding = Em.Binding.from("object.#{@get 'for'}").to('value')

    # Activate the binding
    @binding.connect @

  ).on('init').observes 'for', 'object'

