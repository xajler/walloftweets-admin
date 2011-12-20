#### Requires
# * The SHA 256 library.
Sha256 = require './sha256'

#### Auth
# Creates salt and hashing password and validates password.
# Maybe in future use [Node bcrypt](https://github.com/ncb000gt/node.bcrypt.js).
Auth = -> 
  @salt = null
  @hashPassword = null 
  
  #### create
  # For a given password: 
  #
  # * Generates salt.
  # * Hashes password with salt and given password.
  #
  # If password is not give throws `The password should be given`.
  create = (password) -> 
    unless password 
      throw 'The password should be given'

    @salt = generateSalt()
    @hashPassword = Sha256.hash(@salt + password)
  
  #### validate
  # Validates the password and salt with hashed password.
  # If password is valid returns `true` otherwise `false`.
  validate = (password, salt, hashPassword) ->
    unless password or salt or hashPassword
      return false

    result = false
    hashedPassword = Sha256.hash(salt + password)

    if hashPassword is hashedPassword
      result = true

    result

  create : create,
  validate: validate

#### generateSalt
# Generates 8 charachter long salt from `getRandomNumber` and converts to characters with `fromCharCode()`.
generateSalt = ->
  length = 8
  salt = ""

  for n in length
    randomNumber = getRandomNumber()
    salt += String.fromCharCode(randomNumber)

  salt

#### getRandomNumber
# Returns random number for salt.
getRandomNumber = ->
  # RandomNumber is between 0 - 1
  randomNumber = Math.random()

  # Random Number from 0 - 1000
  randomNumber = parseInt(randomNumber  * 1000, 10)

  # Random Number from 33 - 127
  randomNumber = (randomNumber  % 94) + 33

  randomNumber

# Exports `Auth` as module.
module.exports = Auth