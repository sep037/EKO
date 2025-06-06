//
//  NoteAPIService.swift
//  EKO-iOS
//
//  Created by mini on 5/29/25.
//

import Foundation
import Moya

protocol NoteAPIServiceProtocol {
    func fetchFeedbackNotes(senderId: String) async throws -> FetchFeedbackNotesResponseDTO
    func patchFeedbackNoteFavorite(model: PatchNoteFavoriteRequestDTO) async throws -> [PatchFeedbackNoteFavoriteResponseDTO]
    func patchFeedbackNoteTitle(model: PatchNoteTitleRequestDTO) async throws -> [PatchFeedbackNoteTitleResponseDTO]
    func deleteFeedbackNote(model: DeleteFeedbackNoteRequestDTO) async throws -> [DeleteFeedbackNoteResponseDTO]
}

final class NoteAPIService: BaseAPIService<NoteTargetType>, NoteAPIServiceProtocol {
    
    private let provider = MoyaProvider<NoteTargetType>(plugins: [MoyaLoggerPlugin()])
    
    func fetchFeedbackNotes(senderId: String) async throws -> FetchFeedbackNotesResponseDTO {
        let response = try await provider.request(.fetchFeedbackNotes(senderId: senderId))
        let result: NetworkResult<FetchFeedbackNotesResponseDTO> = fetchNetworkResult(
            statusCode: response.statusCode,
            data: response.data
        )
        switch result {
        case .success(let data):
            guard let data else { throw NetworkResult<Error>.decodeErr }
            return data
        default:
            throw NetworkResult<Error>.networkFail
        }
    }
    
    func patchFeedbackNoteFavorite(model: PatchNoteFavoriteRequestDTO) async throws -> [PatchFeedbackNoteFavoriteResponseDTO] {
        let response = try await provider.request(.patchFeedbackNoteFavorite(model: model))
            
        let result: NetworkResult<[PatchFeedbackNoteFavoriteResponseDTO]> = fetchNetworkResult(
            statusCode: response.statusCode,
            data: response.data
        )
        
        switch result {
        case .success(let data):
            guard let data else { throw NetworkResult<Error>.decodeErr }
            return data
        default:
            throw NetworkResult<Error>.networkFail
        }
    }
    
    func patchFeedbackNoteTitle(model: PatchNoteTitleRequestDTO) async throws -> [PatchFeedbackNoteTitleResponseDTO] {
        let response = try await provider.request(.patchFeedbackNoteTitle(model: model))
            
        let result: NetworkResult<[PatchFeedbackNoteTitleResponseDTO]> = fetchNetworkResult(
            statusCode: response.statusCode,
            data: response.data
        )
        
        switch result {
        case .success(let data):
            guard let data else { throw NetworkResult<Error>.decodeErr }
            return data
        default:
            throw NetworkResult<Error>.networkFail
        }
    }
    
    func deleteFeedbackNote(model: DeleteFeedbackNoteRequestDTO) async throws -> [DeleteFeedbackNoteResponseDTO] {
        let response = try await provider.request(.deleteFeedbackNote(model: model))
            
        let result: NetworkResult<[DeleteFeedbackNoteResponseDTO]> = fetchNetworkResult(
            statusCode: response.statusCode,
            data: response.data
        )
        
        switch result {
        case .success(let data):
            guard let data else { throw NetworkResult<Error>.decodeErr }
            return data
        default:
            throw NetworkResult<Error>.networkFail
        }
    }
}
