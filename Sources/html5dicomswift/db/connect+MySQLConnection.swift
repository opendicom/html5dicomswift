import Foundation
import MySQLNIO
import NIOSSL

let SQL_DATABASE: String = ProcessInfo.processInfo.environment["SQL_DATABASE"] ?? "html5dicomswift"
let SQL_USER: String = ProcessInfo.processInfo.environment["SQL_USER"] ?? "html5dicomswift"
let SQL_PASSWORD: String = ProcessInfo.processInfo.environment["SQL_PASSWORD"] ?? "html5dicomswift"
let SQL_HOST: String = ProcessInfo.processInfo.environment["SQL_HOST"] ?? "html5db"
let SQL_PORT: Int = ProcessInfo.processInfo.environment["SQL_PORT"].flatMap(Int.init) ?? 3306

extension MySQLConnection {
    static func openConnection(on eventLoop: EventLoop) -> EventLoopFuture<MySQLConnection> {
        do {
            return try self.connect(
                to: .makeAddressResolvingHost(SQL_HOST, port: SQL_PORT),
                username: SQL_USER,
                database: SQL_DATABASE,
                password: SQL_PASSWORD,
                tlsConfiguration: .forClient(certificateVerification: .none),
                on: eventLoop
            )
        } catch {
            return eventLoop.makeFailedFuture(error)
        }
    }
}