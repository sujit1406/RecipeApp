//
//  AuthService.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import Foundation
import Combine

protocol AuthServiceProtocol {
    func signIn(email: String, password: String) -> AnyPublisher<User, Error>
    func signUp(name: String, email: String, password: String) -> AnyPublisher<User, Error>
    func signOut() -> AnyPublisher<Void, Error>
}

class AuthService: AuthServiceProtocol {
    static let shared = AuthService()
    
    private init() {}
    
    func signIn(email: String, password: String) -> AnyPublisher<User, Error> {
        // Simulate network delay
        return Future<User, Error> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Simple validation - in real app, this would call an API
                if !email.isEmpty && !password.isEmpty {
                    let user = User(name: "User", email: email)
                    promise(.success(user))
                } else {
                    promise(.failure(AuthError.invalidCredentials))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signUp(name: String, email: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                    let user = User(name: name, email: email)
                    promise(.success(user))
                } else {
                    promise(.failure(AuthError.invalidInput))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signOut() -> AnyPublisher<Void, Error> {
        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

enum AuthError: Error, LocalizedError {
    case invalidCredentials
    case invalidInput
    case networkError
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        case .invalidInput:
            return "Please fill in all fields"
        case .networkError:
            return "Network error occurred"
        }
    }
} 