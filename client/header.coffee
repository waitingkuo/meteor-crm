Template.header.helpers
  projectName: ->
    Projects.findOne()?.projectName
