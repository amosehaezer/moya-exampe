//
//  XJsonLoadFileFactory.swift
//  learn-moya
//
//  Created by Amos Ebenhaezer on 28/01/21.
//

import Foundation

final class XJsonLoadFileFactory {
    
    func from(fileName: String) -> Data {
        
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: fileName, ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            return Data()
        }
        return data
    }
    
}
