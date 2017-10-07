//
//  Routes.swift
//  Vapor 2 Authentication
//
//  Created by Jakob Grumsen on 26/09/2017.
//

import Vapor
import AuthProvider
import Foundation

extension Droplet {
    
    func setupRoutes() throws {
        let userController = UserController(droplet: self)
        userController.addRoutes()
        
        let postController = PostController(droplet: self)
        postController.addRoutes()
        
        setupPublicRoutes()
    }
    
    func setupPublicRoutes() {
        socket("ws") { req, ws in
            ws.onText = { ws, text in
                try ws.send(String(text.characters.reversed()))
            }
        }
    }
}
