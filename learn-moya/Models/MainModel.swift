//
//  MainModel.swift
//  learn-moya
//
//  Created by Amos Ebenhaezer on 28/01/21.
//

import Foundation

// MARK: - Places
struct WrapperPlaceModel: Codable {
    let code: Int
    let message: String
    let data: [PlaceModel]
}

// MARK: - Datum
struct PlaceModel: Codable {
    let placeID: Int
    let pname, datumDescription, address, numberPhone: String
    let rating: Int
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
        case pname
        case datumDescription = "description"
        case address
        case numberPhone = "number_phone"
        case rating, latitude, longitude
    }
}

// MARK: - Product
struct WrapperProductModel: Codable {
    let code: Int
    let message: String
    let data: [ProductModel]
}

// MARK: - Datum
struct ProductModel: Codable {
    let productID, placeID: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case placeID = "place_id"
        case name, price
    }
}

// MARK: - LOC
struct WrapperLocationModel: Codable {
    let code: Int
    let message: String
    let place: [Place]
}

// MARK: - Place
struct Place: Codable {
    let id: Int
    let place: String
    let distance: Double
}
