//
//  MemeAPIModel.swift
//  Memefy
//
//  Created by Terry Kuo on 2021/4/21.
//

import Foundation

struct MemeAPIModel: Codable {
    let success: Bool
    let data: Data
}

extension MemeAPIModel {
    struct Data: Codable {
        let memes: [Memes]
    }
}
//data.memes[0].id
extension MemeAPIModel.Data {
    struct Memes: Codable {
        let id: String
        let name: String
        let url: URL
        let width: Int
        let height: Int
        let boxCount: Int

        private enum CodingKeys: String, CodingKey {
            case id
            case name
            case url
            case width
            case height
            case boxCount = "box_count"
        }
    }
}
