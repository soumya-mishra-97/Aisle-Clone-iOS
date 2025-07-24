//
//  NotesViewModel.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class NotesViewModel: ObservableObject {
    @Published var invitedProfiles: [Profile] = []
    @Published var likedProfiles: [LikedProfile] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let useCase: NotesUseCaseProtocol
    private let token: String
    private var cancellables = Set<AnyCancellable>()
    
    init(token: String, useCase: NotesUseCaseProtocol = NotesUseCase()) {
        self.token = token
        self.useCase = useCase
    }
    
    func fetchNotes() {
        isLoading = true
        errorMessage = nil
        
        useCase.fetchNotes(token: token)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.invitedProfiles = response.invites.profiles
                self?.likedProfiles = response.likes.profiles
            }
            .store(in: &cancellables)
    }
}
