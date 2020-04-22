import Foundation

var userDB = UserDB()
var user = try! userDB.select(userPK: 1)
print(user)
var users = try! userDB.selectStaffUser()
print(users)
