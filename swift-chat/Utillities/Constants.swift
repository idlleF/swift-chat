//
//  Constants.swift
//  swift-chat
//
//  Created by Macbook Pro on 23/10/2018.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import Foundation

typealias  CompletionHandler = (_ Success: Bool) -> ()

let BASE_URL = "https://chatappexms.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
