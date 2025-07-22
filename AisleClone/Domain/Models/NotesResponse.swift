//
//  NotesResponse.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation

struct NoteResponse: Decodable {
    let invites: Invites
    let likes: Likes
}

struct Invites: Decodable {
    let profiles: [Profile]
    let pendingInvitationsCount: Int?

    enum CodingKeys: String, CodingKey {
        case profiles
        case pendingInvitationsCount = "pending_invitations_count"
    }
}

struct Likes: Decodable {
    let profiles: [LikedProfile]
    let likesReceivedCount: Int

    enum CodingKeys: String, CodingKey {
        case profiles
        case likesReceivedCount = "likes_received_count"
    }
}

struct Profile: Identifiable, Decodable {
    var id: String { generalInformation.refID }

    let generalInformation: GeneralInformation
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case generalInformation = "general_information"
        case photos
    }

    var name: String {
        generalInformation.firstName
    }

    var age: Int {
        generalInformation.age
    }

    var avatarURL: String? {
        photos.first(where: { $0.selected })?.photo
    }
}

struct GeneralInformation: Decodable {
    let firstName: String
    let age: Int
    let refID: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case age
        case refID = "ref_id"
    }
}

struct Photo: Decodable {
    let photo: String
    let selected: Bool
}

struct LikedProfile: Identifiable, Decodable {
    let id = UUID()
    let firstName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case avatar
    }
}
