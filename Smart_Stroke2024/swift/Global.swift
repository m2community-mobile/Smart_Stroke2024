//
//  Global.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/05.
//

import Foundation

//let code = "icbmt2022"
let code = "ICBMT2023"





let BAR_CODE = "BAR_CODE"
var barCode : String {
    get{
        if let barcode = userD.object(forKey: BAR_CODE) as? String {
            return barcode
        }else{
            return ""
        }
    }
}


let USER_SID = "USER_SID"
var user_sid : String {
    get{
        if let value = userD.object(forKey: USER_SID) as? String {
            return value
        }else{
            return "?"
        }
    }
}

func saveUserD(jsonDic : [String:Any], valueKey : String, saveKey : String) {
    if let value = jsonDic[valueKey] as? String {
        userD.set(value, forKey: saveKey)
        userD.synchronize()
        print("saveUserD \(valueKey) value is \(value)")
    }else{
        print("saveUserD \(valueKey) value is nil")
    }
}

let QUESTION_URL = "https://ezv.kr:4447/voting/php/question/post.php"
/////////
struct URL_Addres {
    
    static let notice = "http://strokedb.or.kr/app_new/bbs/list.asp"
    
    static let whatAboutStroke = "http://ksrapp.m2comm.co.kr/php/info/info01_1.php"
    
    static let what_types_of_stroke_are_there = "http://ksrapp.m2comm.co.kr/php/info/info01_2.php"
    
    static let warning_symptoms_of_stroke = "http://ksrapp.m2comm.co.kr/php/info/info01_3.php"
    
    static let what_about_stroke_tests = "http://ksrapp.m2comm.co.kr/php/info/info01_4.php"
    
    static let stroke_risk_factors = "http://ksrapp.m2comm.co.kr/php/info/info02_1.php"
    
    static let what_is_high_blood_pressure = "http://ksrapp.m2comm.co.kr/php/info/info02_2a.php"
    
    static let gold_and_blood_pressure = "http://ksrapp.m2comm.co.kr/php/info/info02_2b.php"
    
    static let how_to_eat_less_salt = "http://ksrapp.m2comm.co.kr/php/info/info02_2c.php"
    
    static let main_sodium_intake_foods_eaten_by_Koreans_eating_out = "http://ksrapp.m2comm.co.kr/php/info/info02_2d.php"
    
    static let hypertension_drug_treatment = "http://ksrapp.m2comm.co.kr/php/info/info02_2e.php"
    
    // 당뇨
    
    static let what_is_diabetes = "http://ksrapp.m2comm.co.kr/php/info/info02_3a.php"
    
    static let management_and_treatment_of_diabetes = "http://ksrapp.m2comm.co.kr/php/info/info02_3b.php"
    
    static let sugar_and_diabetes = "http://ksrapp.m2comm.co.kr/php/info/info02_3c.php"

    static let what_to_do_in_case_of_low_blood_sugar = "http://ksrapp.m2comm.co.kr/php/info/info02_3d.php"
    
    static let drug_therapy_for_diabetes = "http://ksrapp.m2comm.co.kr/php/info/info02_3e.php"
    
    static let what_is_hyperlipidemia = "http://ksrapp.m2comm.co.kr/php/info/info02_4a.php"
    
    static let diet_control = "http://ksrapp.m2comm.co.kr/php/info/info02_4b.php"
    
    static let work_out = "http://ksrapp.m2comm.co.kr/php/info/info02_4c.php"
    
    static let medication = "http://ksrapp.m2comm.co.kr/php/info/info02_4d.php"
    
    // 심방세동
    
    static let what_is_atrial_fibrillation = "http://ksrapp.m2comm.co.kr/php/info/info02_5a.php"
    
    static let symptoms_of_Atrial_fibrillation = "http://ksrapp.m2comm.co.kr/php/info/info02_5b.php"
    
    static let cardiac_function_assessment = "http://ksrapp.m2comm.co.kr/php/info/info02_5c.php"
    
    static let smoking = "http://ksrapp.m2comm.co.kr/php/info/info02_6a.php"
    
    static let tips_for_quitting_smoking = "http://ksrapp.m2comm.co.kr/php/info/info02_6b.php"
    
    static let withdrawal_symptoms = "http://ksrapp.m2comm.co.kr/php/info/info02_6c.php"
    
    static let how_to_control_withdrawal_increases = "http://ksrapp.m2comm.co.kr/php/info/info02_6d.php"
    
    static let when_you_need_help_quitting_smoking = "http://ksrapp.m2comm.co.kr/php/info/info02_6e.php"
    
    static let Drinking = "http://ksrapp.m2comm.co.kr/php/info/info02_7a.php"
    
    static let proper_drinking_method = "http://ksrapp.m2comm.co.kr/php/info/info02_7b.php"

    static let what_is_BMI = "http://ksrapp.m2comm.co.kr/php/info/info02_8a.php"
    
    static let do_exercise_like_this = "http://ksrapp.m2comm.co.kr/php/info/info02_8b.php"
    
    static let principles_for_weight_loss = "http://ksrapp.m2comm.co.kr/php/info/info02_8c.php"
    
    static let principles_for_healthy_eating = "http://ksrapp.m2comm.co.kr/php/info/info02_8d.php"
    
    static let check_the_nutritional_information_table = "http://ksrapp.m2comm.co.kr/php/info/info02_8e.php"
    //
    
    static let what_is_first_aid_for_stroke = "http://ksrapp.m2comm.co.kr/php/info/info03.php"
     
    static let treatment_of_stroke = "http://ksrapp.m2comm.co.kr/php/info/info04_1.php"
    
    static let thrombolysis = "http://ksrapp.m2comm.co.kr/php/info/info04_2.php"
    
    static let medication_therapy = "http://ksrapp.m2comm.co.kr/php/info/info04_3a.php"
    
    static let what_is_an_antithrombotic_agent = "http://ksrapp.m2comm.co.kr/php/info/info04_3b.php"
    
    static let shall_we_learn_about_antithrombotic_drugs = "http://ksrapp.m2comm.co.kr/php/info/info04_3c.php"
    
    //
    
    static let be_sure_to_take_this_when_taking_anticoagulants_remember = "http://ksrapp.m2comm.co.kr/php/info/info04_3d.php"
    
    static let precautions_for_taking_anticoagulants_and_eating_habits = "http://ksrapp.m2comm.co.kr/php/info/info04_3e.php"
    
//    static let Foreword = "http://ksrapp.m2comm.co.kr/html/info/info04_popup01.html"
//    
//    static let grains = "http://ksrapp.m2comm.co.kr/html/info/info04_popup02.html"
//    
//    static let potatoes_and_starches = "http://ksrapp.m2comm.co.kr/html/info/info04_popup03.html"
    
    static let stroke_rehabilitation_treatment = "http://ksrapp.m2comm.co.kr/php/info/info04_4a.php"
    
    static let when_should_I_start_rehabilitation_treatment = "http://ksrapp.m2comm.co.kr/php/info/info04_4b.php"
    
    static let how_often_how_long_and_how_should_I_undergo_rehabilitation_treatment = "http://ksrapp.m2comm.co.kr/php/info/info04_4c.php"
    
    static let difficulty_swallowing = "http://ksrapp.m2comm.co.kr/php/info/info04_4d.php"
    
    static let urination_and_defecation_assessment_and_training = "http://ksrapp.m2comm.co.kr/php/info/info04_4e.php"
    
    static let daily_life_training = "http://ksrapp.m2comm.co.kr/php/info/info04_4f.php"
    
//    static let stroke_daily_life_rehabilitation_training = "http://ksrapp.m2comm.co.kr/html/info/info04_4c.html"
    //
    
    
    static let principles_for_healthy_eating5 = "http://ksrapp.m2comm.co.kr/php/info/info05_1a.php"
    
    static let check_the_nutritional_information_table2 = "http://ksrapp.m2comm.co.kr/php/info/info05_1b.php"
    
    static let exercise_therapy_to_prevent_stroke = "http://ksrapp.m2comm.co.kr/php/info/info05_2a.php"
    
    static let what_exercise_is_right_for_me = "http://ksrapp.m2comm.co.kr/php/info/info05_2b.php"
    
    static let if_you_decide_to_exercise_what_kind_of_exercise_should_you_do_and_how_many_times_a_week = "http://ksrapp.m2comm.co.kr/php/info/info05_2c.php"
    
    static let what_intensity_should_I_exercise_at = "http://ksrapp.m2comm.co.kr/php/info/info05_2d.php"
    
    static let there_are_some_precautions_before_starting_exercise = "http://ksrapp.m2comm.co.kr/php/info/info05_2e.php"
    
    static let what_exercises_do_I_do_if_I_have_difficulty_walking = "http://ksrapp.m2comm.co.kr/php/info/info05_2f.php"
    
    static let dementia_after_stroke = "http://ksrapp.m2comm.co.kr/php/info/info05_3.php"
    
    static let depression_after_stroke = "http://ksrapp.m2comm.co.kr/php/info/info05_4a.php"
    
    static let depression_test = "http://ksrapp.m2comm.co.kr/php/info/info05_4b.php"
    
    static let elderly_long_term_care_insurance = "http://ksrapp.m2comm.co.kr/php/info/info05_5a.php"

    static let stroke_disability_grade = "http://ksrapp.m2comm.co.kr/php/info/info05_5b.php"
 
}
///////


struct URL_KEY {

    static let BASE_URL = "icbmt.or.kr"
    static let EZV_URL = "ezv.kr"

    static let day_1 = "https://ezv.kr:4447/voting/php/session/list.php?tab=462&code=\(code)"
    static let day_2 = "https://ezv.kr:4447/voting/php/session/list.php?tab=463&code=\(code)"
    static let day_3 = "https://ezv.kr:4447/voting/php/session/list.php?tab=464&code=\(code)"
    static let now = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-1"
    static let session = "https://ezv.kr:4447/voting/php/session/category.php?code=\(code)"
    static let today = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)"
    
    static let speakers = "https://ezv.kr:4447/voting/php/faculty/list.php?code=\(code)"
//    static let sponsor = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)"
    static let sponsor = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)"



    
    static let exihibition = "https://ezv.kr:4447/voting/php/booth/list.php?code=\(code)&tab=2"
    
    static let mySchedule = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-2"
    static let search = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-3"
    static let memo = "https://ezv.kr:4447/voting/php/session/list.php?code=\(code)&tab=-6"
    
    
    static let noticeList = "https://ezv.kr:4447/voting/php/bbs/list.php?code=\(code)"
    static let noticeView = "https://ezv.kr:4447/voting/php/bbs/view.php?code=\(code)"
    
    static let Abstract = "https://ezv.kr:4447/voting/php/abstract/category.php?code=\(code)"
    
//    static let Survey = "http://virtual.icksh.org/main_survey.asp"
//    static let Survey = "https://ezv.kr:4447/icbmt2022/html/contents_dev/survey.html"
    static let Survey = "http://ezv.kr/icbmt2023/html/contents_dev/survey.html"


    
    ////
    ///http://ezv.kr/icbmt2022/html/contents/welcome.html   ==>http://ezv.kr/icbmt2022/html/contents_dev/welcom  ===> http://ezv.kr/icbmt2023/html/contents/welcom.html
//    ICBMT 2023
//    static let Welcome_Message = "http://ezv.kr/icbmt2022/html/contents_dev/welcome.html"
    static let Welcome_Message = "http://ezv.kr/icbmt2023/html/contents/welcome.html"
    
//    static let Overview = "http://ezv.kr/icbmt2022/html/contents_dev/overview.html"
    static let Overview = "http://ezv.kr/icbmt2023/html/contents/overview.html"
    
//    static let Committee = "http://ezv.kr/icbmt2022/html/contents_dev/committee.html"
    static let Committee = "http://ezv.kr/icbmt2023/html/contents/committee.html"

//    static let Past_ICBMT = "http://ezv.kr/icbmt2022/html/contents_dev/past.html"
    static let Past_ICBMT = "http://ezv.kr/icbmt2023/html/contents/past.html"

    
//    About Venue
//    static let About_Venue = "http://ezv.kr/icbmt2022/html/contents_dev/venue.html"
    static let About_Venue = "http://ezv.kr/icbmt2023/html/contents/venue.html"
    
//    static let Transportation = "http://ezv.kr/icbmt2022/html/contents_dev/transportation_01_a.html"
    static let Transportation = "http://ezv.kr/icbmt2023/html/contents/transportation_01_a.html"
    
//    static let Floor_Plan = "http://ezv.kr/icbmt2022/html/contents_dev/floor.html"
    static let Floor_Plan = "http://ezv.kr/icbmt2023/html/contents/floor.html"
    
//    static let Online_Platform = "https://virtual.icbmt.or.kr/"
    static let Online_Platform = "https://virtual.icbmt.or.kr/"
    
//    static let Daily_Newsletter = "https://icbmt.or.kr/mail_2022/news-letter-today.html"
    static let Daily_Newsletter = "https://icbmt.or.kr/mail_2022/news-letter-today.html"
    
//    static let Exhibition_Floor_Plan = "http://ezv.kr/icbmt2022/html/contents_dev/exhibition.html?tab=2"
    static let Exhibition_Floor_Plan = "http://ezv.kr/icbmt2022/html/contents_dev/exhibition.html?tab=2"
    
}

var booth_event : String {
    get{
        return "https://ezv.kr:4447/voting/php/booth/event.php?code=\(code)&user_sid=\(user_sid)&include=Y"
    }
}

struct INFO {
    
    
    
    struct KEY {
        static let TITLE = "TITLE"
        static let SUB_MENU = "SUB_MENU"
        
        static let URL = "URL"
        
        static let IS_REQUIRED_LOGIN = "IS_REQUIRED_LOGIN"
        
        static let IS_PHOTO_GALLERY = "IS_PHOTO_GALLERY"
        static let IS_PROGRAM_AT_A_GLANCE = "IS_PROGRAM_AT_A_GLANCE"
        
        static let IS_VOTING = "IS_VOTING"
        static let IS_POPUP = "IS_POPUP"
        static let IS_OPEN_SAFARI = "IS_OPEN_SAFARI"
        
        //etc
        static let IS_BOOTH_EVENT = "IS_BOOTH_EVENT"
        
    }
    
    
    static let MAIN_INFO =
        [
            [KEY.TITLE : "ICBMT 2023",KEY.URL:URL_KEY.Welcome_Message],
            [KEY.TITLE : "Program",KEY.URL:URL_KEY.today],
            [KEY.TITLE : "Abstract",KEY.URL:URL_KEY.Abstract],
            [KEY.TITLE : "Invited Speakers",KEY.URL:URL_KEY.speakers],
            [KEY.TITLE : "Voting",KEY.IS_VOTING:KEY.IS_VOTING],
            [KEY.TITLE : "Photo Gallery",KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY],
            [KEY.TITLE : "Survey",KEY.URL:URL_KEY.Survey],
            [KEY.TITLE : "Daily Newsletter",KEY.URL:URL_KEY.Daily_Newsletter,KEY.IS_OPEN_SAFARI:KEY.IS_OPEN_SAFARI],
            [KEY.TITLE : "Sponsors",KEY.URL:URL_KEY.sponsor],
    ]
    
    static let INFOS =
    [
        [
            KEY.TITLE:"급성기 뇌졸중",
            KEY.SUB_MENU :
                [
                    [KEY.TITLE:"뇌졸중은요?",KEY.URL:URL_KEY.Welcome_Message],
                    [KEY.TITLE:"뇌졸중은 어떤 종류가 있나요?",KEY.URL:URL_KEY.Overview],
                    [KEY.TITLE:"뇌졸중의 경고 증상을 알아볼까요?",KEY.URL:URL_KEY.Committee],
                    [KEY.TITLE:"뇌졸중 검사는?",KEY.URL:URL_KEY.Past_ICBMT],
            ]
        ],
        [
            KEY.TITLE:"위험인자",
            KEY.SUB_MENU :
                [
                    [KEY.TITLE:"고혈압",KEY.URL:URL_KEY.About_Venue],
                    [KEY.TITLE:"당뇨병",KEY.URL:URL_KEY.Transportation],
                    [KEY.TITLE:"고지혈증",KEY.URL:URL_KEY.Floor_Plan],
            ]
        ],
//        [
//            KEY.TITLE:"Online Platform",
//            KEY.IS_OPEN_SAFARI:KEY.IS_OPEN_SAFARI,
//            KEY.URL:URL_KEY.Online_Platform
//        ],
        [
            KEY.TITLE:"Program",
            KEY.SUB_MENU :
                [
                    [KEY.TITLE:"Program at a glance",KEY.IS_PROGRAM_AT_A_GLANCE:KEY.IS_PROGRAM_AT_A_GLANCE],
                    [KEY.TITLE:"August 31 (Thu)",KEY.URL:URL_KEY.day_1],
                    [KEY.TITLE:"September 1 (Fri)",KEY.URL:URL_KEY.day_2],
                    [KEY.TITLE:"September 2 (Sat)",KEY.URL:URL_KEY.day_3]
//                    [KEY.TITLE:"My Schedule",KEY.URL:URL_KEY.mySchedule],
//                    [KEY.TITLE:"Now",KEY.URL:URL_KEY.now],
            ]
        ],
        [
            KEY.TITLE:"Abstract",
            KEY.URL:URL_KEY.Abstract
        ],
        [
            KEY.TITLE:"Invited Speakers",
            KEY.URL:URL_KEY.speakers
        ],
        [
            KEY.TITLE:"Voting",
//            KEY.IS_VOTING:KEY.IS_VOTING
        ],
        [
            KEY.TITLE:"Sponsors",
            KEY.SUB_MENU :
                [
                    [KEY.TITLE:"Sponsors",KEY.URL:URL_KEY.sponsor],
                    [KEY.TITLE:"Exhibition Floor Plan",KEY.URL:URL_KEY.Exhibition_Floor_Plan],
            ]
        ],
        [
            KEY.TITLE:"Survey",
            KEY.URL:URL_KEY.Survey
        ],
        [
            KEY.TITLE:"Photo Gallery",
            KEY.IS_PHOTO_GALLERY:KEY.IS_PHOTO_GALLERY
        ],
        [
            KEY.TITLE:"Daily Newsletter",
            KEY.URL:URL_KEY.Daily_Newsletter,
            KEY.IS_OPEN_SAFARI:KEY.IS_OPEN_SAFARI
        ],
        [
            KEY.TITLE:"Notice",
            KEY.URL:URL_KEY.noticeList
        ],
        [
            KEY.TITLE:"My Schedule",
            KEY.URL:URL_KEY.mySchedule
        ],
    ]
        

        
        
        
            /*
    ICBMT 2023
        Welcome Message
        Overview
        Committee
        Past ICBMT
    About Venue
        About Venue
        Transportation
        Floor Plan
    Online Platform
    Program
    Program at a glance
        September 1 (Thu)
        September 2 (Fri)
        September 3 (Sat)
        My Schedule
        Now
    Abstract
    Invited Speakers
    Voting
    Sponsors
    Survey
    Photo Gallery
    Daily Newsletter
    Booth Stamp Event
    Notice
    Setting
    Search
    My Schedule
        My Schedule
        My Memo
    */
    
    
    
    
    
    
    
}
    




let REGIST_ID = "REGIST_ID"
var username : String {
    get{
        if let value = userD.object(forKey: "username") as? String {
            return value
        }else{
            return ""
        }
    }
}

//var isLogin : Bool {
//    get { return regist_id != "" }
//}
var isLogin : Bool {
    print("user_sid:\(username)")
    return !username.isEmpty
}

