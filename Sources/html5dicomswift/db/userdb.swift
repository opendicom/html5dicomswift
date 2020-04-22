import Foundation
import MySQLNIO
import MySQLKit

struct UserDB {

    private var group: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    private var eventLoop: EventLoop {
        return self.group.next()
    }

    init() { }

    func select(userPK: Int) throws -> User {        
        let conn = try MySQLConnection.openConnection(on: self.eventLoop).wait()
        let db: SQLDatabase = conn.sql()
        defer { try! conn.close().wait() }
        let rows = try db.raw("SELECT * from users where pk=\(String(userPK))")
            .all(decoding: User.self).wait()
        return rows[0]        
    }

    func selectStaffUser() throws -> Array<User> {        
        let conn = try MySQLConnection.openConnection(on: self.eventLoop).wait()
        let db: SQLDatabase = conn.sql()
        defer { try! conn.close().wait() }        
        let rows = try db.raw("SELECT * from users where is_staff=1")
            .all(decoding: User.self).wait()
        return rows        
    }  

}