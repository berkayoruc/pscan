//
//  ScanData.swift
//  PScan
//
//  Created by berkay on 1.09.2022.
//

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
