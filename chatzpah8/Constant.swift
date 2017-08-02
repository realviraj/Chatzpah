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
let BASE_URL =  "https://chatzpah.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)accounts/resgister"


//SEGUES
let TO_LOGIN = "toLogin"
let TO_CREATEACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"



//USER DEFAULTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
