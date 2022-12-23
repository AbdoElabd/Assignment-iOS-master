//
//  Token.swift
//  Assignment
//
//  Created by apple on 21/12/2022.
//  Copyright © 2022 abdelrahman elabd . All rights reserved.
//

import Foundation

import Foundation

// MARK: - Token
struct Token: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
}
