//
//  AWSEnvironment.swift
//  AWSBased_SwiftAppDemo
//
//  Created by Dmytro Kabyshev on 9/22/16.
//  Copyright © 2016 HillTrix sp. z o.o. All rights reserved.
//

import Foundation
import AWSCore

let COGNITO_REGIONTYPE = AWSRegionType.apSoutheast1 // e.g. AWSRegionType.USEast1
let COGNITO_REGIONTYPE_STR = "ap-southeast-1" // Your Cognito region, e.g us-east-1
let COGNITO_IDENTITYPOOL_ID = "ap-southeast-1:f8d0d548-182a-4229-bddf-0b171869bddf" // e.g. "us-east-1:111e111-8efa-dead-b8d7-11c7f4e00de1"
let COGNITO_USERPOOL_ID = "ap-southeast-1_O3fzjGsqd"//sPJJux7hp   or   O3fzjGsqd
let COGNITO_USERPOOL_KEY = "AKIAJOPNUDYB6UA2TPYQ"
let COGNITO_USERPOOL_SECRET_KEY = "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"
let COGNITO_USERPOOL_PROVIDER = "cognito-idp.\(COGNITO_REGIONTYPE_STR).amazonaws.com/\(COGNITO_USERPOOL_ID)"
