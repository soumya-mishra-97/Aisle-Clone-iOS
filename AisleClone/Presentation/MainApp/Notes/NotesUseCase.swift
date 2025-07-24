//
//  NotesUseCase.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

protocol NotesUseCaseProtocol {
    func fetchNotes(token: String) -> AnyPublisher<NoteResponse, Error>
}

class NotesUseCase: NotesUseCaseProtocol {
    func fetchNotes(token: String) -> AnyPublisher<NoteResponse, Error> {
        let headers = ["Authorization": token]
        
        return APIService.shared.get(from: Endpoints.notes, headers: headers)
            .decode(type: NoteResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
