//
//  Constants.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import Foundation

let domain = URL(string: "https://static.mixerbox.com")!

let getVectorPath = "/interview/interview_get_vector.json"

let getVectorApi: URL = domain.appendingPathComponent(getVectorPath)
