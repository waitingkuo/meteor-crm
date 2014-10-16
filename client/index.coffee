Template.index.helpers

  avatar: ->
    link = 'http://www.gravatar.com/avatar/'
    if @email?
      link += CryptoJS.MD5(@email).toString()
    return link
      

  projectUsers: ->
    users = ( Fake.user(['fullname', 'email']) for i in [1..30]) 
    users.unshift
      fullname: 'Wei-Ting Kuo'
      email: 'waitingkuo0527@gmail.com'
    users

