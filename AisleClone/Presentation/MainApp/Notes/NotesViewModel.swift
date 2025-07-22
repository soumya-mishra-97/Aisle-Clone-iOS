//
//  NotesViewModel.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class NotesViewModel: ObservableObject {
    @Published var profiles: [Profile] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()
    private let notesUseCase: NotesUseCase
    private let token: String

    init(token: String, useCase: NotesUseCase = NotesUseCase()) {
        self.token = token
        self.notesUseCase = useCase
    }

    func fetchNotes() {
        isLoading = true
        errorMessage = nil

        notesUseCase.fetchNotes(token: token)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] profiles in
                self?.profiles = profiles
            }
            .store(in: &cancellables)
    }
}
