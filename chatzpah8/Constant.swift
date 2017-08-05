//
//  Constant.swift
//  chatzpah8
//
//  Created by Viraj Upadhyay on 8/1/17.
//  Copyright © 2017 agloe labs. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success:Bool) -> ()


//URL
let BASE_URL = "https://chatzpah2.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_CREATE = "\(BASE_URL)user/add"


//SEGUES
let TO_LOGIN = "toLogin"
let TO_CREATEACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"



//USER DEFAULTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//HEADERS

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
