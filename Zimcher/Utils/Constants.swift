import Foundation

struct JSON_KEY_PATH {
    struct MEDIA {
        static let ID = "videoId"
        static let NAME = "videoName"
        static let URL = "videoURL"
        static let IMAGE = "videoImage"
        static let USER_ID = "userId"
        static let CHANNEL_ID = "channelId"
        static let USER = "user"
        static let CHANNEL = "channel"
    }

    struct USER {
        static let ID = "userID"
        static let NAME = "userName"
        static let EMAIL = "userEmail"
        static let CITY = "userCity"
        static let STATE = "userState"
        static let IMAGE = "userImage"
    }

    struct CHANNEL {
        static let ID = "channelId"
        static let NAME = "channelName"
        static let TYPE = "channelType"
        static let MANAGER_ID = "managerId"
    }
}

struct REGISTER {
    static let USERNAME_KEY = "username"
    static let PASSWORD_KEY = "password"
    static let EMAIL_KEY = "email"
}
