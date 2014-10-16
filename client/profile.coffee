Template.profile.helpers

  fullname: 'Wei-Ting Kuo'
  email: 'waitingkuo0527@gmail.com'
  avatar: ->
    link = 'http://www.gravatar.com/avatar/'
    link += CryptoJS.MD5('waitingkuo0527@gmail.com').toString()
    return link

