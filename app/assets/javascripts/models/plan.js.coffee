App.Plan = DS.Model.extend
  name:     DS.attr 'string'
  currency: DS.attr 'string'
  amount:   DS.attr 'number'
  limit:    DS.attr 'number'
  interval: DS.attr 'string'

  formattedAmount: (->
    unit = (@get('amount') / 100).toFixed(2)
    "#{@get 'curencySymbol'} #{unit}"
  ).property 'amount', 'curencySymbol'

  curencySymbol: (->
    {
      usd: "$",
      gbp: "£"
    }[@get 'currency']
  ).property 'currency'
