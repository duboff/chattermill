App.PlanController = Em.ObjectController.extend
  needs: ['company']
  isCurrent: (->
    @get('model') == @get('controllers.company.plan')
  ).property 'controllers.company.plan'