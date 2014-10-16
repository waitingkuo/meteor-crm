@ProjectUserEvents = new Meteor.Collection 'projectUserEvents'

Schema = @Schema or {}
Schema.ProjectUsers = new SimpleSchema

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
    denyUpdate: true
    defaultValue: -> new Date

