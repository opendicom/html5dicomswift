import Foundation
import MySQLNIO

struct UserDB {

    private var group: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    private var eventLoop: EventLoop {
        return self.group.next()
    }

    init(){
        //self.group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    }

    func select(userID: Int) throws {        
        let conn = try MySQLConnection.openConnection(on: self.eventLoop).wait()
        defer { try! conn.close().wait() }        
        let rows = try! conn.query("SELECT * from users where pk=\(userID)").wait()
        print(rows.count)
        print(rows[0].column("username"))
        print(rows[0].column("title"))
        print(rows[0].column("first_name"))
        print(rows[0].column("last_name"))
        print(rows[0].column("created"))
    }

}