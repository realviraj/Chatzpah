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
let BASE_URL = "https://chatzpah3.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_CREATE = "\(BASE_URL)user/add"
let URL_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNEL = "\(BASE_URL)channel"
let URL_GET_MESSAGE = "\(BASE_URL)message/byChannel/"


//SEGUES
let TO_LOGIN = "toLogin"
let TO_CREATEACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//colors

let chatsPurplePlaceholder = #colorLiteral(red: 0.6052985191, green: 0.1573151946, blue: 0.7275595069, alpha: 0.5)

// notification constant

let NOTIF_USER_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelIsLoaded")
let NOTIF_CHANNELS_SELECTED = Notification.Name("channelSelected")

//USER DEFAULTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//HEADERS

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
