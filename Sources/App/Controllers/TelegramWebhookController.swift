//
//  File.swift
//  
//
//  Created by Butanediol on 30/3/2023.
//

import Vapor
import TelegramVaporBot

final class TelegramWebhookController: RouteCollection {
    
    let path: String
    
    init(path: String) {
        self.path = path
    }
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post("\(path)", use: telegramWebHook)
    }
    
    func telegramWebHook(req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        try await connection.dispatcher.process([update])
        return true
    }
}
