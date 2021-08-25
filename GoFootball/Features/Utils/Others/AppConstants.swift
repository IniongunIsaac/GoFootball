//
//  AppConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    static let VALIDATION_TYPE_NOT_APPLICABLE = "Validation type not applicable in this context."
    static let DATE_FORMAT = "dd MMM yyyy"
    static let MAX_PHONE_NUMBER_LENGTH = 11
    static let INVALID_INPUT_FIELD = "Invalid input field."
    static let DATA_NOT_FOUND = "No data available at the moment!"
    static let OPTION_NOT_APPLICABLE = "Option doesn't apply to this context."
    static let APP_ERROR_CODE = -9999
    
    struct Keys {
        
        static let BASE_URL = infoPlistString(key: "BASE_URL")
        
        static let AUTH_TOKEN = infoPlistString(key: "AUTH_TOKEN")
        
    }
    
}
