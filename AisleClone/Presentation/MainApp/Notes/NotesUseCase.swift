//
//  NotesUseCase.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class NotesUseCase {
    func fetchNotes(token: String) -> AnyPublisher<[Profile], Error> {
        let headers = ["Authorization": token]
        
        return APIService.shared.get(from: Endpoints.notes, headers: headers)
            .decode(type: NoteResponse.self, decoder: JSONDecoder())
            .tryMap { response in
                return response.invites.profiles
            }
            .eraseToAnyPublisher()
    }
}
