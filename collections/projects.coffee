@Projects = new Meteor.Collection 'projects'

Schema = @Schema or {}
Schema.Projects = new SimpleSchema

  projectName:
    type: String

  apiToken:
    type: String
    #FIXME
    denyUpdate: true
    defaultValue: ->
      Random.secret()

  userId:
    type: String
    

  #createdAt
  #updatedAt
 
Projects.attachSchema Schema.Projects

  
Projects.allow
  insert: (userId, doc) -> userId?
  update: (userId, doc, fieldNames, modifier) ->
    # FIXME should also examine fieldNames
    userId is doc.userId



