//
//  MainMoyaTarget.swift
//  learn-moya
//
//  Created by Amos Ebenhaezer on 28/01/21.
//

import Foundation
import Moya

enum MainMoyaTarget {
    case getPlace
    case getProduct(idProduct: Int)
    case calculateLoc(lat: Double, lng: Double)
}

extension MainMoyaTarget: TargetType {
    var baseURL: URL {
        return URL(string: XHttpConfig.AppDomain())!
    }
    
    var path: String {
        switch self {
        case .getPlace:
            return "/place"
        case .getProduct(let idProduct):
            return "/product/\(idProduct)"
        case .calculateLoc:
            return "/calculate"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPlace,
             .getProduct:
            return .get
        case .calculateLoc:
            return .post
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .calculateLoc(let lat, let lng):
            return ["latitude": lat, "longitude": lng]
        default:
            return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .calculateLoc:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getPlace:
            return XJsonLoadFileFactory().from(fileName: "places")
        case .getProduct:
            return XJsonLoadFileFactory().from(fileName: "products")
        case .calculateLoc:
            return XJsonLoadFileFactory().from(fileName: "loc")
        }
    }
    
    var task: Task {
        switch self {
        case .getPlace,
             .getProduct:
            return .requestPlain
        case .calculateLoc:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }
    
}
