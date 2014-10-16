@ProjectUserEvents = new Meteor.Collection 'projectUserEvents'

Schema = @Schema or {}
Schema.ProjectUserEvents = new SimpleSchema

  projectId:
    type: String

  projectUserId:
    type: String

  eventName:
    type: String

  properties:
    type: Object
    blackbox: true

  createdAt:
    type: Date
    autoValue: -> new Date()

ProjectUserEvents.attachSchema Schema.ProjectUserEvents

if Meteor.isServer
  Meteor.methods
    track: (apiToken, userId, eventName, properties) ->
      project = Projects.findOne apiToken: apiToken
      if project
        event =
          projectId: project._id
          projectUserId: userId
          eventName: eventName
          properties: {}
        
        if properties
          # do something
          1+1

        ProjectUserEvents.insert event
         

