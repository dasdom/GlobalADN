//
//  URLRequest.swift
//  GlobalADN
//
//  Created by dasdom on 18.06.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import Foundation

class ADNRequestFactory {
    
    class var globalRequest: NSURLRequest {
    return getRequestWithSubstring("posts/stream/global", parameters: nil, authorization: false)
    }
    
    class func personalTimeLineRequestBefore(id: Int?, sinceId: Int?) -> NSURLRequest {
        var dictionary = Dictionary<String,Int>()
        if let beforeId = id {
            dictionary = ["before_id" : beforeId]
        }
        if let theSinceId = sinceId {
            dictionary["since_id"] = theSinceId
            dictionary["count"] = -200
        }
        return getRequestWithSubstring("posts/stream/unified", parameters: dictionary, authorization: true)
    }
    
    class func urlFromSubstring(substring: String, parameters: Dictionary<String,Int>?) -> String {
        var urlString = "https://api.app.net/" + substring + "?include_html=0"
        if let theParameters = parameters {
            for (name, value) in theParameters {
                println("name: \(name) value: \(value)")
                urlString = urlString + "&\(name)=\(value)"
            }
        }
        println("urlString: \(urlString)")
        return urlString
    }
    
    class func getRequestWithSubstring(substring: String, parameters theParameters: Dictionary<String,Int>?, authorization: Bool) -> NSURLRequest {
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: urlFromSubstring(substring, parameters: theParameters)))
        urlRequest.HTTPMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        
        if authorization {
            let accessToken = //Put your accessToken here
            let authorizationString = "Bearer " + accessToken;
            urlRequest.addValue(authorizationString, forHTTPHeaderField: "Authorization")
        }
        return urlRequest as NSURLRequest
    }
}
