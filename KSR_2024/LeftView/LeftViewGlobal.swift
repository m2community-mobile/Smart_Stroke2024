//
//  Global.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/27.
//

import Foundation

////let code = "icbmt2022"
//let code = "ICBMT2023"
//
//
//let BAR_CODE = "BAR_CODE"
//var barCode : String {
//    get{
//        if let barcode = userD.object(forKey: BAR_CODE) as? String {
//            return barcode
//        }else{
//            return ""
//        }
//    }
//}
//
//
//let USER_SID = "USER_SID"
//var user_sid : String {
//    get{
//        if let value = userD.object(forKey: USER_SID) as? String {
//            return value
//        }else{
//            return ""
//        }
//    }
//}
//
//let QUESTION_URL = "https://ezv.kr:4447/voting/php/question/post.php"
//
//struct URL_KEY {
//
//    static let BASE_URL = "icbmt.or.kr"
//    static let EZV_URL = "ezv.kr"
//
//    static let day_1 = "https://ezv.kr:4447/voting/php/session/list.php?tab=462&code=\(code)"
//    static let day_2 = "https://ezv.kr:4447/voting/php/session/list.php?tab=463&code=\(code)"
//    static let day_3 = "https://ezv.kr:4447/voting/php/session/list.php?tab=464&code=\(code)"
//    static let now = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-1"
//    static let session = "https://ezv.kr:4447/voting/php/session/category.php?code=\(code)"
//    static let today = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)"
//    
//    static let speakers = "https://ezv.kr:4447/voting/php/faculty/list.php?code=\(code)"
////    static let sponsor = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)"
//    static let sponsor = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)"
//
//
//
//    
//    static let exihibition = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)&tab=2"
//    
//    static let mySchedule = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-2"
//    static let search = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-3"
//    static let memo = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-6"
//    
//    
//    static let noticeList = "https://ezv.kr:4447/voting/php/bbs/list.php?code=\(code)"
//    static let noticeView = "https://ezv.kr:4447/voting/php/bbs/view.php?code=\(code)"
//    
//    static let Abstract = "https://ezv.kr:4447/voting/php/abstract/category.php?code=\(code)"
//    
////    static let Survey = "http://virtual.icksh.org/main_survey.asp"
////    static let Survey = "https://ezv.kr:4447/icbmt2022/html/contents_dev/survey.html"
//    static let Survey = "http://ezv.kr/icbmt2023/html/contents_dev/survey.html"
//
//
//    
//    ////
//    ///http://ezv.kr/icbmt2022/html/contents/welcome.html   ==>http://ezv.kr/icbmt2022/html/contents_dev/welcom  ===> http://ezv.kr/icbmt2023/html/contents/welcom.html
////    ICBMT 2023
////    static let Welcome_Message = "http://ezv.kr/icbmt2022/html/contents_dev/welcome.html"
//    static let Welcome_Message = "http://ezv.kr/icbmt2023/html/contents/welcome.html"
//    
////    static let Overview = "http://ezv.kr/icbmt2022/html/contents_dev/overview.html"
//    static let Overview = "http://ezv.kr/icbmt2023/html/contents/overview.html"
//    
////    static let Committee = "http://ezv.kr/icbmt2022/html/contents_dev/committee.html"
//    static let Committee = "http://ezv.kr/icbmt2023/html/contents/committee.html"
//
////    static let Past_ICBMT = "http://ezv.kr/icbmt2022/html/contents_dev/past.html"
//    static let Past_ICBMT = "http://ezv.kr/icbmt2023/html/contents/past.html"
//
//    
////    About Venue
////    static let About_Venue = "http://ezv.kr/icbmt2022/html/contents_dev/venue.html"
//    static let About_Venue = "http://ezv.kr/icbmt2023/html/contents/venue.html"
//    
////    static let Transportation = "http://ezv.kr/icbmt2022/html/contents_dev/transportation_01_a.html"
//    static let Transportation = "http://ezv.kr/icbmt2023/html/contents/transportation_01_a.html"
//    
////    static let Floor_Plan = "http://ezv.kr/icbmt2022/html/contents_dev/floor.html"
//    static let Floor_Plan = "http://ezv.kr/icbmt2023/html/contents/floor.html"
//    
////    static let Online_Platform = "https://virtual.icbmt.or.kr/"
//    static let Online_Platform = "https://virtual.icbmt.or.kr/"
//    
////    static let Daily_Newsletter = "https://icbmt.or.kr/mail_2022/news-letter-today.html"
//    static let Daily_Newsletter = "https://icbmt.or.kr/mail_2022/news-letter-today.html"
//    
////    static let Exhibition_Floor_Plan = "http://ezv.kr/icbmt2022/html/contents_dev/exhibition.html?tab=2"
//    static let Exhibition_Floor_Plan = "http://ezv.kr/icbmt2022/html/contents_dev/exhibition.html?tab=2"
//    
//}
//
//var booth_event : String {
//    get{
//        return "https://ezv.kr:4447/voting/php/booth/event.php?code=\(code)&user_sid=\(user_sid)&include=Y"
//    }
//}
//
//struct INFO {
//    
//    
//    
//    struct KEY {
//        static let TITLE = "TITLE"
//        static let SUB_MENU = "SUB_MENU"
//        
//        static let URL = "URL"
//        
//        static let IS_REQUIRED_LOGIN = "IS_REQUIRED_LOGIN"
//        
//        static let IS_PHOTO_GALLERY = "IS_PHOTO_GALLERY"
//        static let IS_PROGRAM_AT_A_GLANCE = "IS_PROGRAM_AT_A_GLANCE"
//        
//        static let IS_VOTING = "IS_VOTING"
//        static let IS_POPUP = "IS_POPUP"
//        static let IS_OPEN_SAFARI = "IS_OPEN_SAFARI"
//        
//        //etc
//        static let IS_BOOTH_EVENT = "IS_BOOTH_EVENT"
//        
//    }
//    
//    
//    static let MAIN_INFO =
//        [
//            [KEY.TITLE : "ICBMT 2023",KEY.URL:URL_KEY.Welcome_Message],
//            [KEY.TITLE : "Program",KEY.URL:URL_KEY.today],
//            [KEY.TITLE : "Abstract",KEY.URL:URL_KEY.Abstract],
//            [KEY.TITLE : "Invited Speakers",KEY.URL:URL_KEY.speakers],
//            [KEY.TITLE : "Voting",KEY.IS_VOTING:KEY.IS_VOTING],
//            [KEY.TITLE : "Photo Gallery",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
//            [KEY.TITLE : "Survey",KEY.URL:URL_KEY.Survey],
//            [KEY.TITLE : "Daily Newsletter",KEY.URL:URL_KEY.Daily_Newsletter,KEY.IS_OPEN_SAFARI:KEY.IS_OPEN_SAFARI],
//            [KEY.TITLE : "Sponsors",KEY.URL:URL_KEY.sponsor],
//    ]
//    
//    static let INFOS =
//    [
//        [
//            KEY.TITLE:"ICBMT 2023",
//            KEY.SUB_MENU :
//                [
//                    [KEY.TITLE:"Welcome Message",KEY.URL:URL_KEY.Welcome_Message],
//                    [KEY.TITLE:"Overview",KEY.URL:URL_KEY.Overview],
//                    [KEY.TITLE:"Committee",KEY.URL:URL_KEY.Committee],
//                    [KEY.TITLE:"Past ICBMT",KEY.URL:URL_KEY.Past_ICBMT],
//            ]
//        ],
//        [
//            KEY.TITLE:"About Venue",
//            KEY.SUB_MENU :
//                [
//                    [KEY.TITLE:"About Venue",KEY.URL:URL_KEY.About_Venue],
//                    [KEY.TITLE:"Transportation",KEY.URL:URL_KEY.Transportation],
//                    [KEY.TITLE:"Floor Plan",KEY.URL:URL_KEY.Floor_Plan],
//            ]
//        ],
////        [
////            KEY.TITLE:"Online Platform",
////            KEY.IS_OPEN_SAFARI:KEY.IS_OPEN_SAFARI,
////            KEY.URL:URL_KEY.Online_Platform
////        ],
//        [
//            KEY.TITLE:"Program",
//            KEY.SUB_MENU :
//                [
//                    [KEY.TITLE:"Program at a glance",KEY.IS_PROGRAM_AT_A_GLANCE:KEY.IS_PROGRAM_AT_A_GLANCE],
//                    [KEY.TITLE:"August 31 (Thu)",KEY.URL:URL_KEY.day_1],
//                    [KEY.TITLE:"September 1 (Fri)",KEY.URL:URL_KEY.day_2],
//                    [KEY.TITLE:"September 2 (Sat)",KEY.URL:URL_KEY.day_3]
////                    [KEY.TITLE:"My Schedule",KEY.URL:URL_KEY.mySchedule],
////                    [KEY.TITLE:"Now",KEY.URL:URL_KEY.now],
//            ]
//        ],
//        [
//            KEY.TITLE:"Abstract",
//            KEY.URL:URL_KEY.Abstract
//        ],
//        [
//            KEY.TITLE:"Invited Speakers",
//            KEY.URL:URL_KEY.speakers
//        ],
//        [
//            KEY.TITLE:"Voting",
////            KEY.IS_VOTING:KEY.IS_VOTING
//        ],
//        [
//            KEY.TITLE:"Sponsors",
//            KEY.SUB_MENU :
//                [
//                    [KEY.TITLE:"Sponsors",KEY.URL:URL_KEY.sponsor],
//                    [KEY.TITLE:"Exhibition Floor Plan",KEY.URL:URL_KEY.Exhibition_Floor_Plan],
//            ]
//        ],
//        [
//            KEY.TITLE:"Survey",
//            KEY.URL:URL_KEY.Survey
//        ],
//        [
//            KEY.TITLE:"Photo Gallery",
//            KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY
//        ],
//        [
//            KEY.TITLE:"Daily Newsletter",
//            KEY.URL:URL_KEY.Daily_Newsletter,
//            KEY.IS_OPEN_SAFARI:KEY.IS_OPEN_SAFARI
//        ],
//        [
//            KEY.TITLE:"Notice",
//            KEY.URL:URL_KEY.noticeList
//        ],
//        [
//            KEY.TITLE:"My Schedule",
//            KEY.URL:URL_KEY.mySchedule
//        ],
//    ]
//        
//
//        
//        
//        
//            /*
//    ICBMT 2023
//        Welcome Message
//        Overview
//        Committee
//        Past ICBMT
//    About Venue
//        About Venue
//        Transportation
//        Floor Plan
//    Online Platform
//    Program
//    Program at a glance
//        September 1 (Thu)
//        September 2 (Fri)
//        September 3 (Sat)
//        My Schedule
//        Now
//    Abstract
//    Invited Speakers
//    Voting
//    Sponsors
//    Survey
//    Photo Gallery
//    Daily Newsletter
//    Booth Stamp Event
//    Notice
//    Setting
//    Search
//    My Schedule
//        My Schedule
//        My Memo
//    */
//    
//    
//    
//    
//    
//    
//    
//}
//    
//
