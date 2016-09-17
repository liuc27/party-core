Promise = require("q").Promise
v = require("../lib/validator")
dbOper = require("../../dbOper")
userOper = dbOper.getUserInstance()

getData = (query, field) ->
  return Promise (resolve, reject) ->
    console.log "get"
    return

# User login
exports.update = (req, res) ->
  console.log "login"

  input = req.body
  input.userID = req.params.id

  console.log "userID:"
  console.log input.userID

  console.log "account"
  console.log input.account

  # Validation
  v.checkParam input, (err) ->
    if err
      req.status err.code
        .send err.msg
    else
      # MySQL process
      userOper.login input, (results) ->
        console.log results
        output = 
          code: results.code
          result: results
        if results.code
          outCode = 200
        else
          outCode = 400
        res.status outCode
          .send output
        return
      return 
  
  return
