//
//  AuthService.swift
//  rest
//
//  Created by Irko Stoyanov on 16.12.18.
//  Copyright © 2018 Irko Stoyanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import p2_OAuth2

class AuthService {
    static let instance = AuthService()
    
    fileprivate var alamofireManager: SessionManager?
    
    var loader: OAuth2DataLoader?
    
    func auth(context: UIViewController) {
        let oauth2 = OAuth2CodeGrant(settings: [
            "client_id": PUBLIC_KEY,
            "client_secret": PRIVATE_KEY,
            "authorize_uri": AUTH_URL,
            "token_uri": TOKEN_URL,   // code grant only
            "redirect_uris": [RETURN_URL],   // register your own "myapp" scheme in Info.plist
            "scope": "wow.profile",
            "secret_in_body": false,    // Github needs this
            "keychain": false,         // if you DON'T want keychain integration
            ] as OAuth2JSON)
        oauth2.logger = OAuth2DebugLogger(.trace)
        
        oauth2.authConfig.authorizeEmbedded = true
        oauth2.authConfig.authorizeContext = context
        
        let loader = OAuth2DataLoader(oauth2: oauth2)
       
        
        loader.perform(request	: userDataRequest) { response in
            do {
                let json = try response.responseJSON()
                //self.didGetUserdata(dict: json, loader: loader)
            }
            catch let error {
                //self.didCancelOrFail(error)
            }
        }
        
        oauth2.authorize() { authParameters, error in
            if let params = authParameters {
                print("Authorized! Access token is in `oauth2.accessToken`")
                print("Authorized! Additional parameters: \(params)")
            }
            else {
                print("Authorization was canceled or went wrong: \(String(describing: error))")   // error will not be nil
            }
        }
    }
    
    func callback() {
        
    }
    var userDataRequest: URLRequest {
        var request = URLRequest(url: URL(string: "https://us.api.blizzard.com/wow/realm/status")!)
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        return request
    }
}
