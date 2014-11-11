#= require ./store
#= require ./config
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

# window.hasManyHack = (parentRecord, collectionName) ->
#   parentId            = parentRecord.get 'id'
#   relationships       = Em.get parentRecord.constructor, 'relationshipsByName'
#   relationship        = relationships.get collectionName
#   idPath              = parentRecord.constructor.typeKey + '.id'
#   parentRecord.get(collectionName).then ->
#     parentRecord.store.filter relationship.type, (record) ->
#       record.get(idPath) is parentId