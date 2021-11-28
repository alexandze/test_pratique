//
//  Source.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation

struct Source: Decodable {
    var name: String?
    
    init(name: String?) {
        self.name = name
    }
    
    init(from decoder: Decoder) throws {
        let containerKey = try decoder.container(keyedBy: SourceCodingKeys.self)
        name = try? containerKey.decode(String.self, forKey: .name)
    }
    
    enum SourceCodingKeys: String, CodingKey {
        case name
    }
}
