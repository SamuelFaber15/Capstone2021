//
//  InstagramApi.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 2/6/21.
//

import Foundation

class InstagramApi {
    static let shared = InstagramApi()
    private let instagramAppID = "1080828825749583"
    private let redirectURIURLEncoded = "https%3A%2F%2Ffall2017is201.fabernation.com%2F"
    private let redirectURI = "https://fall2017is201.fabernation.com/"
    private let app_secret = "60d7218ee9e657045f0b25fb06bbba1d"
    private let boundary = "boundary=\(NSUUID().uuidString)"
    private init () {}
    
    //MARK:- Enums
    private enum BaseURL: String {
        case displayApi = "https://api.instagram.com/"
        case graphApi = "https://graph.instagram.com/"
    }
    
    private enum Method: String {
        case authorize = "oauth/authorize/"
        case access_token = "oauth/access_token"
    }
    
    //MARK:- Constructor
//    private init() {}
    
    //MARK:- Private Methods
    private func getFormBody(_ parameters: [[String : String]], _ boundary: String) -> Data {
        print("***getFormBody***")
        var body = ""
        let error: NSError? = nil
        for param in parameters {
            let paramName = param["name"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if let filename = param["fileName"] {
                let contentType = param["content-type"]!
                var fileContent: String = ""
                do { fileContent = try String(contentsOfFile: filename, encoding: String.Encoding.utf8)}
                catch {
                    print(error)
                }
                if (error != nil) {
                    print(error!)
                }
                body += "; filename=\"\(filename)\"\r\n"
                body += "Content-Type: \(contentType)\r\n\r\n"
                body += fileContent
            } else if let paramValue = param["value"] {
                body += "\r\n\r\n\(paramValue)"
            }
        }
        return body.data(using: .utf8)!
    }
    
    private func getTokenFromCallbackURL(request: URLRequest) -> String? {
        print("***getTokenFromCallbackURL***")
        let requestURLString = (request.url?.absoluteString)! as String
        if requestURLString.starts(with: "\(redirectURI)?code=") {
            
            print("Response uri:",requestURLString)
            if let range = requestURLString.range(of: "\(redirectURI)?code=") {
                return String(requestURLString[range.upperBound...].dropLast(2))
            }
        }
        return nil
    }
    
    func getMediaData(testUserData: InstagramTestUser, completion: @escaping (Feed) -> Void) {
        print("***getMediaData***")
        let urlString = "\(BaseURL.graphApi.rawValue)me/media?fields=id,caption&access_token=\(testUserData.access_token)"
        
        let request = URLRequest(url: URL(string: urlString)!)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response {
                print(response)
            }
            do { let captions = try JSONDecoder().decode(Feed.self, from: data!)
                print(captions)
                DispatchQueue.main.async {
                    completion(captions)
                }
//                completion(captions)
            }
            catch let error as NSError {
                print(error)
            }
        })
        task.resume()
    }
    
    //MARK:- Public Methods
    func authorizeApp(completion: @escaping (_ url: URL?) -> Void ) {
        print("***authorizeApp***")
        let urlString = "\(BaseURL.displayApi.rawValue)\(Method.authorize.rawValue)?force_authentication=1&app_id=\(instagramAppID)&redirect_uri=\(redirectURIURLEncoded)&scope=user_profile,user_media&response_type=code"
        print(urlString)
        let request = URLRequest(url: URL(string: urlString)!)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response {
                print(response)
                completion(response.url)
            }
        })
        task.resume()
    }
    
    func getTestUserIDAndToken(request: URLRequest, completion: @escaping (InstagramTestUser) -> Void){
        print("***getTestUserIDAndToken***")
        print("FirstForm____")
        print(request)
        guard let authToken = getTokenFromCallbackURL(request: request) else {
            return
        }
        print(authToken)
        
        let headers = [
            "content-type": "multipart/form-data; boundary=\(boundary)"
        ]
        let parameters = [
            [
                "name": "app_id",
                "value": instagramAppID
            ],
            [
                "name": "app_secret",
                "value": app_secret
            ],
            [
                "name": "grant_type",
                "value": "authorization_code"
            ],
            [
                "name": "redirect_uri",
                "value": redirectURI
            ],
            [
                "name": "code",
                "value": authToken
            ]
        ]
        
        var request = URLRequest(url: URL(string: BaseURL.displayApi.rawValue + Method.access_token.rawValue)!)
        print(request)
        let postData = getFormBody(parameters, boundary)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) in
            if (error != nil) {
                print(error!)
            } else {
                do { let jsonData = try JSONDecoder().decode(InstagramTestUser.self, from: data!)
                    print(jsonData)
                    completion(jsonData)
                }
                catch let error as NSError {
                    print("user data error")
                    print(error)
                }
                
            }
        })
        dataTask.resume()
    }

    
    func getInstagramUser(testUserData: InstagramTestUser, completion: @escaping (InstagramUser) -> Void) {
        print("***getInstagramUser***")
        let urlString = "\(BaseURL.graphApi.rawValue)\(testUserData.user_id)?fields=id,username&access_token=\(testUserData.access_token)"
        let request = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print("****user_data****")
                print(httpResponse!)
            }
            do { let jsonData = try JSONDecoder().decode(InstagramUser.self, from: data!)
                completion(jsonData)
            }
            catch let error as NSError {
                print(error)
            }
        })
        dataTask.resume()
    }
    
    func getMedia(testUserData: InstagramTestUser, completion: @escaping (InstagramMedia) -> Void) {
        print("***getMedia***")
        
        getMediaData(testUserData: testUserData) { (mediaFeed) in
            let urlString = "\(BaseURL.graphApi.rawValue + mediaFeed.data[1].id)?fields=id,media_type,media_url,username,timestamp&access_token=\(testUserData.access_token)"
            let request = URLRequest(url: URL(string: urlString)!)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error in
                if let response = response {
                    print(response)
                }
                do { let jsonData = try JSONDecoder().decode(InstagramMedia.self, from: data!)
                    print("fjkl")
                    print(jsonData)
                    completion(jsonData)
                }
                catch let error as NSError {
                    print("this is an error")
                    print(error)
                }
            })
            task.resume()
        }
    }
    
    func fetchImage(urlString: String, completion: @escaping (Data?) -> Void) {
        print("***fetchImage***")
        let request = URLRequest(url: URL(string: urlString)!)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response {
                print(response)
            }
            completion(data)
        })
        task.resume()
    }
   
}


//curl -X GET \
//'https://graph.instagram.com/me/media?fields=id,username,caption&access_token=IGQVJYdE4yRjFPanRFZAVFLeGhVU0VQOE5ZAclFacThKdjNXTFNud0FxNk9nd3p4NXl3Q3NuaFF4VWxMNXU4Rm5oS3ZANcm5VSHV3eUp4MExRcEhURElkTjBsdmREbDB1Tm1MSTY3UHZAtV29EakVTSXdmTXhFd3BEVnRvNzJR'
