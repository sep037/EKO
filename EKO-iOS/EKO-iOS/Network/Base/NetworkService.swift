//
//  NetworkService.swift
//  EKO-iOS
//
//  Created by mini on 5/29/25.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()

    private init() {}
    
    let feedbackService: FeedbackAPIServiceProtocol = FeedbackAPIService()
    let noteService: NoteAPIServiceProtocol = NoteAPIService()
    let notificationService: NotificationAPIServiceProtocol = NotificationAPIService()
    let sessionService: SessionAPIServiceProtocol = SessionAPIService()
    let userService: UserAPIServiceProtocol = UserAPIService()
    let s3Service: S3APIServiceProtocol = S3APIService()
}
