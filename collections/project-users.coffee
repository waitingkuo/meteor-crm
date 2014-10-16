@ProjectUsers = new Meteor.Collection 'projectUsers'

Schema = @Schema or {}
Schema.ProjectUsers = new SimpleSchema

  projectId:
    type: String

  projectUserId:
    type: String

  name:
    type: String
    optional: true

  email:
    type: String
    optional: true

  createdAt:
    type: Date
    denyUpdate: true
    defaultValue: -> new Date

  updatedAt:
    type: Date
    autoValue: -> new Date


if Meteor.isServer
  Meteor.methods
    identify: (apiToken, userId, properties) ->
      project = Projects.findOne apiToken: apiToken
      console.log 'project', project, userId
      if project
        user =
          projectId: project._id
          userId: userId

        if properties?
          if properties.email?
            user.email = properties.email
          if properties.name?
            user.name = properties.name

        ProjectUsers.upsert {projectUserId: userId}, $set: user
