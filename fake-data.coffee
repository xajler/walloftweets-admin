mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/walloftweets'

User = require './models/user'
Client = require './models/client'
Event = require './models/event'

users = require './repositories/users'
clients = require './repositories/clients'
events = require './repositories/events'

client = null
user = null

createUser = (callback) ->
  user = new User()
  user.email = 'xajler@gmail.com'
  user.salt = 'T%6ScZmQ'
  user.password = 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c'
  user.firstName = 'Kornelije'
  user.lastName = 'Sajler'
  users.save user
  
  callback user

createClient = (callback) ->
  client = new Client()
  client.name = 'DJ Tiësto'
  client.email = 'tiesto.support@pentegroup.com'
                                      
  console.log client
  clients.save client
  
  callback client

createEvents = ->
  console.log client._id
  console.log user._id

  event1 = new Event()
  event1.name = 'College Tour Something'
  event1.clientId = client._id
  event1.userId = user._id
  event1.hashTag = 'CollageTour1'
  event1.downloadInterval = 45
  event1.tweetsToShow = 1
  event1.isEnabledForModeration = yes
  event1.startDate = Date.now()
  event1.endDate = '2/2/2012' 
  event1.fromTweeple.push(username: 'xajler')
  event1.fromTweeple.push(username: 'adebak')
  event1.toTweeple.push(username: 'adebak')
  event1.toTweeple.push(username: 'darkoche')  
  event1.mentionTweeple.push(username: 'darkoche')
  event1.containAllOfWords.push(name: 'techno') 
  event1.containAllOfWords.push(name: 'party')
  event1.containExactPhrases.push(name: 'techno party')
  event1.containExactPhrases.push(name: 'techno music')

  console.log event1
  events.save event1
  
  event2 = new Event()
  event2.name = 'College Tour Something'
  event2.clientId = client._id
  event2.userId = user._id
  event2.hashTag = 'CollageTour2'
  event2.downloadInterval = 45
  event2.tweetsToShow = 1
  event2.isEnabledForModeration = yes
  event2.startDate = Date.now()
  event2.endDate = '2/2/2012' 
  event2.fromTweeple.push(username: 'xajler')
  event2.fromTweeple.push(username: 'adebak')
  event2.toTweeple.push(username: 'adebak')
  event2.toTweeple.push(username: 'darkoche')  
  event2.mentionTweeple.push(username: 'darkoche')
  event2.containAllOfWords.push(name: 'techno') 
  event2.containAllOfWords.push(name: 'party')
  event2.containExactPhrases.push(name: 'techno party')
  event2.containExactPhrases.push(name: 'techno music')

  console.log event2
  events.save event2

createUser (user) ->
  console.log 'Creating User'
  if user
    createClient (client) ->
      console.log 'Creating Client'
      console.log client
      if client
        console.log 'Creating Event'
        createEvents()