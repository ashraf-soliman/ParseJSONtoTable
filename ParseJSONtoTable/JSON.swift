//
//  JSON.swift
//  ParseJSONtoTable
//
//  Created by ashraf on 01/11/2022.
//

import Foundation

struct JSON: Codable {
    let postId: Int
    let id:     Int
    let name:   String
    let email:  String
    let body:   String
}
