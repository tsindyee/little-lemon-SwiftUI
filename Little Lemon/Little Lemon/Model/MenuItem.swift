//
//  MemuItem.swift
//  Little Lemon
//
//  Created by Tang Sin Yee on 2025-02-27.
//

import Foundation

struct MenuItem: Decodable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
}
