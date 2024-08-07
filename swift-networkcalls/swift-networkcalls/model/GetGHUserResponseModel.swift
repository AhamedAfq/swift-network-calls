//
//  GetGHUserResponseModel.swift
//  swift-networkcalls
//
//  Created by Ashfak Ahamed Alauddeen on 06/08/24.
//

import Foundation

struct GetGHUserResponseModel: Codable{
    public let login: String?
    public let id: Int?
    public let bio: String?
    public let site_admin: Bool?
}
