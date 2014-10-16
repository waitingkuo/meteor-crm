Meteor.startup ->
  Accounts.onCreateUser (option, user) ->

    Projects.insert
      userId: user._id
      projectName: 'My First Project'

    return user

  #Meteor.onConnection (conn) -> 
  #  console.log conn.id
  #  return conn
