//
//  Constants.swift
//  rest
//
//  Created by Irko Stoyanov on 16.12.18.
//  Copyright © 2018 Irko Stoyanov. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let AUTH_URL = "https://us.battle.net/oauth/authorize"
let TOKEN_URL = "https://us.battle.net/oauth/token"
let RETURN_URL = "ppoauthapp://oauth/callback"

let REALMS_URL = "https://us.api.blizzard.com/wow/realm/status"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

// Keys

let PUBLIC_KEY = "67caf04ac8c547e79fe658ac82d2b5e1"
let PRIVATE_KEY = "uWpsxtRr8p260HhCB8vA3688ZRvSgeb3"
