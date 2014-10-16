Router.configure
  layoutTemplate: 'layout'

Meteor.startup ->

  Router.map ->
    
    @route 'index',
      path: '/'
      template: 'index'

    @route 'profile',
      path: '/profile'
      template: 'profile'

