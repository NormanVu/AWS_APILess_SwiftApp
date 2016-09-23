//
//  SignupUserPoolSessionProvider.swift
//  AWSBased_SwiftAppDemo
//
//  Created by Dmytro Kabyshev on 9/23/16.
//  Copyright © 2016 HillTrix sp. z o.o. All rights reserved.
//

import Foundation
import AWSCore
import AWSCognito
import AWSCognitoIdentityProvider

final class SignupUserPoolSessionProvider: UserPoolSessionProvider {
    private var username: String?
    private var password: String?
    
    convenience init(username: String, password: String) {
        self.init()
        self.username = username
        self.password = password
    }
    
    override func getSessionTokens(completition: @escaping (([String : String]?, Error?) -> ())) {
        if let username = username, let password = password {
            let emailAttr = AWSCognitoIdentityUserAttributeType()
            emailAttr?.name = "email"
            emailAttr?.value = username
            // Signup new user
            awsUserPool.signUp(username, password: password, userAttributes: [emailAttr!], validationData: nil)
                .continue({ [weak self] (task) in
                    guard let user = self?.awsUserPool.getUser(username), task.error == nil else {
                        completition(nil, task.error)
                        return nil
                    }
                    
                    self?.completeWith(task: user.getSession(username, password: password, validationData: [emailAttr!]),
                                       completition: completition)
                    self?.username = nil
                    self?.password = nil
                    return nil
            })
        } else {
            super.getSessionTokens(completition: completition)
        }
    }
    
    override func logout() {
        super.logout()
        username = nil
        password = nil
    }
}
