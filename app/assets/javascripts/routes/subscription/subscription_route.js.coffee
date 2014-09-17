App.SubscriptionRoute = Ember.Route.extend
  beforeModel: ->
    # Only load the stripe javascript once
    @checkoutJS ||= Em.$.getScript "
      https://checkout.stripe.com/v3/checkout.js
    "

  model: -> @modelFor 'company'


  stripeCheckout: (options) ->
    # Open the checkout popup and wrap it in a promise that resolves
    # with the card token once the user has filled it in successfully
    new Em.RSVP.Promise (resolve) =>
      StripeCheckout.open
        name:             App.config.applicationName
        key:              App.config.stripeKey
        image:            App.config.checkoutLogoUrl
        amount:           options.amount
        currency:         options.currency
        description:      options.description
        panelLabel:       options.panelLabel
        allowRememberMe:  false
        # email:            @controllerFor('session').get('user.email')

        token: (response) ->
          resolve response.id

  # Once the billing details have been collected from stripe if
  # necessary, then save the changes to the plan back to the server
  updateSubscription: (opts) ->
    @controller.set 'isUpdating', true

    company = @modelFor 'company'

    company.setProperties opts

    company.save().then =>
      @transitionTo "subscription"
    .then null, (xhr) =>
      # Updating the subscription failed
      message = xhr.responseJSON?.error || "Modifying subscription
        failed, please try again"
      @notifier.error message
      company.rollback()
    .then =>
      @controller.set 'isUpdating', false
      company.set 'cardToken', null


  actions:
    # Subscribe to a plan given that no plan is currently active for
    # this company
    subscribe: (plan) ->
      @stripeCheckout
        amount:      plan.get 'amount'
        currency:    plan.get 'currency'
        description: "#{plan.get 'name'} plan"
        panelLabel:  "#{plan.get('interval').capitalize()}ly"
      .then (cardToken) =>
        @updateSubscription
          plan:       plan
          cardToken:  cardToken

    # Move to a new plan assuming the organization is already
    # subscribed to one
    changeSubscription: (plan) ->
      if confirm "Are you sure you want to change subscription plan?"
        @updateSubscription plan: plan

    # Update the card that will be billed without chaning the current
    # subscription plan
    changeCard: ->
      @stripeCheckout
        panelLabel:  'Update card'
      .then (cardToken) =>
        @updateSubscription cardToken: cardToken

    # Cancel an active subscription
    cancelSubscription: ->
      if confirm "Are you sure you want to cancel your subscription?"
        @updateSubscription plan: null
