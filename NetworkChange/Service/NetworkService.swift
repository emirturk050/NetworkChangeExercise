//
//  NetworkService.swift
//  NetworkChange
//
//  Created by Emir Türk on 12.04.2023.
//

import Foundation


protocol NetworkService {
    
    var type : String {get }
    
    func download(_ resource:String) async throws -> [User]
}
