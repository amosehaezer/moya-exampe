//
//  XHttpConfig.swift
//  learn-moya
//
//  Created by Amos Ebenhaezer on 28/01/21.
//

import Foundation

class XHttpConfig {
    
    public static let Domain = "http://127.0.0.1:8120"
    public static let Domain_DEV = "http://92d052e932b5.ngrok.io"
    public static let isDevelMode = false
    
    public static func AppDomain() -> String {
        if isDevelMode {
            return Domain_DEV
        } else {
            return Domain
        }
    }
    
}
