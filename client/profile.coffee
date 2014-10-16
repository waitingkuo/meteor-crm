Template.profile.helpers

  avatar: ->
    if @projectUser?.email?
      link = 'http://www.gravatar.com/avatar/'
      link += CryptoJS.MD5(@projectUser.email).toString()
      return link

  fromNow: ->
    moment(@createdAt).fromNow()
