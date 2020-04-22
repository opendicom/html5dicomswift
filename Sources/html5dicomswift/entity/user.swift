import Foundation

struct User: Codable {

    var pk: Int
    var username: String
    var title: String
    var first_name: String
    var last_name: String
    var email: String
    var is_staff: Int
    var is_active: Int
    var created: Date
    var updated: Date?
    
}