Meteor.publish 'projects', ->
  userId = @userId

  Projects.find userId: userId


Meteor.publish 'projectUsers', (projectId) ->
  userId = @userId

  project = Projects.findOne 
    _id: projectId
    userId: userId

  if project
    return ProjectUsers.find projectId: projectId

  return []

Meteor.publish 'projectUser', (projectId, projectUserId) ->
  userId = @userId

  project = Projects.findOne
    _id: projectId
    userId: userId

  if project
    return ProjectUsers.find
      projectId: projectId
      projectUserId: projectUserId

  return []

Meteor.publish 'projectUserEvents', (projectId, projectUserId) ->
  userId = @userId

  project = Projects.findOne
    _id: projectId
    userId: userId

  if project
    return ProjectUserEvents.find
      projectId: projectId
      projectUserId: projectUserId

  return []
