Router.configure
  layoutTemplate: 'layout'
  waitOn: ->
    Meteor.subscribe 'projects'

Meteor.startup ->

  Router.map ->
    
    @route 'index',
      path: '/'
      template: 'index'
      data: ->
        projectUsers: =>
          #FIXME get projectId in a better way
          project = Projects.findOne()
          if project?
            return ProjectUsers.find projectId: project._id
          return []
      waitOn: ->
        project = Projects.findOne()
        if project?
          Meteor.subscribe 'projectUsers', project._id

    @route 'profile',
      path: '/profile/:projectUserId'
      template: 'profile'
      data: ->
        project = Projects.findOne()
        if project?
          return {
            projectUser: ProjectUsers.findOne
                          projectId: project._id
                          projectUserId: @params.projectUserId
          }

        return {
          projectUser: {}
        }

      waitOn: ->
        project = Projects.findOne()
        if project?
          Meteor.subscribe 'projectUser', project._id, @params.projectUserId

    @route 'setting',
      path: '/setting'
      template: 'setting'
      data: ->
        #FIXME maybe we need to user session to get the current projectId
        project: -> Projects.findOne()
