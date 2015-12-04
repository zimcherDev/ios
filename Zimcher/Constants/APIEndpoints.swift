protocol APIEndPointsCollection {
    static var BASE_ENDPOINT_URL: String {get}
    static func CREATE_ENDPOINT(method: Networking.HTTPMethod, endPointString: String, payloadType: Networking.NetworkingDataType?) -> Networking.APIEndPoint
}

extension APIEndPointsCollection {
    static func CREATE_ENDPOINT(method: Networking.HTTPMethod = ENDPOINT.DEFAULT_METHOD, endPointString: String, payloadType: Networking.NetworkingDataType? = nil) -> Networking.APIEndPoint
    {
        return Networking.APIEndPoint(method: method, urlString: BASE_ENDPOINT_URL + endPointString, payloadType: payloadType)
    }
}

struct ENDPOINT {
    static let DEFAULT_METHOD = Networking.HTTPMethod.GET
    //meaningless?
    static let THRESHOLD_SIZE_FOR_USING_STREAM = UInt64(((100) << 3 + 000) << 3 + 000)
    
    private struct BASE_URL {
        static let URL = "http://zimcher.azurewebsites.net/"
        static let API_URL = URL + "api/"
    }
    
    struct USER: APIEndPointsCollection {
        static let BASE_ENDPOINT_URL = BASE_URL.API_URL + "users/"
        
        static let ALL_USERS = USER.CREATE_ENDPOINT(.GET, endPointString: "getallusers")
        static let FIND_BY_ID = USER.CREATE_ENDPOINT(.POST, endPointString: "finduserbyid", payloadType: .URLEncodedForm)
        static let FIND_BY_EMAIL = USER.CREATE_ENDPOINT(.POST, endPointString: "finduserbyemail", payloadType: .JSON)
        static let REGISTER = USER.CREATE_ENDPOINT(.POST, endPointString: "createuser", payloadType: .JSON)
        static let UPLOAD_AVATAR = USER.CREATE_ENDPOINT(.POST, endPointString: "uploadUserImage", payloadType: .MultipartFormData)
    }
    
    struct MEDIA: APIEndPointsCollection {
        static let BASE_ENDPOINT_URL = BASE_URL.API_URL + "videos/"
        
        static let ALL_VIDEOS = MEDIA.CREATE_ENDPOINT(.GET, endPointString: "getallvideos")
        static let UPLOAD = MEDIA.CREATE_ENDPOINT(.POST, endPointString: "uploadVideo", payloadType: .MultipartFormData)
    }
    
    struct REVIEW: APIEndPointsCollection {
        static let BASE_ENDPOINT_URL = BASE_URL.API_URL + "reviews/"
        
        static let CREATE = REVIEW.CREATE_ENDPOINT(.POST, endPointString: "createReview", payloadType: .JSON)
    }
    
    struct CHANNEL: APIEndPointsCollection {
        static let BASE_ENDPOINT_URL = BASE_URL.API_URL + "channels/"
        
        static let GET_CHANNEL_BY_NAME = CHANNEL.CREATE_ENDPOINT(.POST, endPointString: "searchChannelByName", payloadType: .URLEncodedForm)
        static let GET_ALL_CHANNELS = CHANNEL.CREATE_ENDPOINT(.GET, endPointString: "getAllChannels")
    }
    

}