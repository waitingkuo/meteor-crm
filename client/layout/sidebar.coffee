Template.sidebar.helpers

  isActive: (routeName) ->
    if Router.current().route.name is routeName
      return 'active'
