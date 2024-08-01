////
////  SqliteTest.swift
////  KSR_2024
////
////  Created by m2comm on 2024/05/20.
////
//
//import Foundation
//import SQLite3
//
//
//class DbHelper {
//    private var context: Context?,
//) : SQLiteOpenHelper(context, "M2_KSR_2024", null, 1) {
//    override fun onCreate(db: SQLiteDatabase?) {
//        //
//    }
//
//    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
//        //
//    }
//
//    //알람 정보 하나 가져오기 (알람 한개 수정용)
//    @SuppressLint("Range")
//    fun getOneAlarm(
//        idx: Int
//    ) : List<AlarmData> {
//        val sql = "select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm where idx = $idx order by hour asc, minute asc limit 1"
//        val alarmList = ArrayList<AlarmData>()
//        val db = this.readableDatabase
//        val cursor = db.rawQuery(sql,null)
//        if(cursor.moveToFirst()){
//            do{
//                val alarm = AlarmData(
//                    name = cursor.getString(cursor.getColumnIndex("name")),
//                    gubun1YN = cursor.getString(cursor.getColumnIndex("gubun1YN")),
//                    gubun2YN = cursor.getString(cursor.getColumnIndex("gubun2YN")),
//                    gubun3YN = cursor.getString(cursor.getColumnIndex("gubun3YN")),
//                    gubun4YN = cursor.getString(cursor.getColumnIndex("gubun4YN")),
//                    gubun5YN = cursor.getString(cursor.getColumnIndex("gubun5YN")),
//                    gubun6YN = cursor.getString(cursor.getColumnIndex("gubun6YN")),
//                    gubun7YN = cursor.getString(cursor.getColumnIndex("gubun7YN")),
//                    hour = cursor.getString(cursor.getColumnIndex("hour")),
//                    minute = cursor.getString(cursor.getColumnIndex("minute")),
//                    timer1 = cursor.getString(cursor.getColumnIndex("timer1")),
//                    timer2 = cursor.getString(cursor.getColumnIndex("timer2")),
//                    alarm = cursor.getString(cursor.getColumnIndex("alarm")),
//                    idx = cursor.getString(cursor.getColumnIndex("idx")),
//                )
//                alarmList.add(alarm)
//            }while(cursor.moveToNext())
//        }
//        db.close()
//        return alarmList
//    }
//
//    //알람 추가 (신규)
//    @SuppressLint("Range")
//    fun insertAlarm(
//        timer1:Int,
//        timer2:Int,
//        name:String,
//        hour:Int,
//        minute:Int,
//        alarm:Int,
//        gubun1YN:Int,
//        gubun2YN:Int,
//        gubun3YN:Int,
//        gubun4YN:Int,
//        gubun5YN:Int,
//        gubun6YN:Int,
//        gubun7YN:Int,
//        stime:Int
//    ) : Int {
//        val db = this.writableDatabase
//        val values = ContentValues()
//        values.put("timer1", timer1) //아침점심저녁 1,2,3
//        values.put("timer2", timer2) //식전 식후 1,2
//        values.put("name", name) //기타약 이름
//        values.put("hour", hour)
//        values.put("minute", minute)
//        values.put("alarm", alarm) //알람 On off 0, 1
//        values.put("week1YN", 1) //예전엔 일자마다 알림이 있었던거 같은데, 이제 기능 사라짐
//        values.put("week2YN", 1)
//        values.put("week3YN", 1)
//        values.put("week4YN", 1)
//        values.put("week5YN", 1)
//        values.put("week6YN", 1)
//        values.put("week7YN", 1)
//        values.put("gubun1YN", gubun1YN)
//        values.put("gubun2YN", gubun2YN)
//        values.put("gubun3YN", gubun3YN)
//        values.put("gubun4YN", gubun4YN)
//        values.put("gubun5YN", gubun5YN)
//        values.put("gubun6YN", gubun6YN)
//        values.put("gubun7YN", gubun7YN)
//        values.put("stime", stime) //시작일 - 이번달 복용일 계산때 필요 //임시로 테스트 위해 20240118 로 설정
//        //values.put("stime", 20240118) //시작일 - 이번달 복용일 계산때 필요 //임시로 테스트 위해 20240118 로 설정
//        values.put("etime", "99999999") //?? 상수, 안끝날려구
//
//        db.insert("Alarm", null, values)
//        db.close()
//
//        val sql = "SELECT idx from Alarm ORDER by idx desc limit 1"
//        val dbs = this.readableDatabase
//        val cursor = dbs.rawQuery(sql,null)
//        var idx = 0
//        if(cursor.moveToFirst()){
//            do{
//                idx = cursor.getString(cursor.getColumnIndex("idx")).toInt()
//            }while(cursor.moveToNext())
//        }
//        dbs.close()
//        return idx
//    }
//
//    //알람 on/off (삭제는 하지 않음)
//    fun onOffAlarm(idx:String,
//                   alarm:Boolean,){
//        val db = this.writableDatabase
//        val values = ContentValues()
//        var alarmValue = 0
//        if (alarm) {
//            alarmValue = 1
//        }
//        values.put("alarm", alarmValue) //alarm off = 0 , on = 1
//        db.update("Alarm", values, "idx=?", arrayOf(idx))
//        db.close()
//    }
//
//    //알람 수정 (단일 건)
//    fun updateAlarm(
//        idx:Int,
//        timer1:Int,
//        timer2:Int,
//        name:String,
//        hour:Int,
//        minute:Int,
//        alarm:Int,
//        gubun1YN:Int,
//        gubun2YN:Int,
//        gubun3YN:Int,
//        gubun4YN:Int,
//        gubun5YN:Int,
//        gubun6YN:Int,
//        gubun7YN:Int
//    ){
//        val db = this.writableDatabase
//        val values = ContentValues()
//        values.put("timer1", timer1) //아침점심저녁 1,2,3
//        values.put("timer2", timer2) //식전 식후 1,2
//        values.put("name", name) //기타약 이름
//        values.put("hour", hour)
//        values.put("minute", minute)
//        values.put("alarm", alarm) //알람 On off 0, 1
//        values.put("week1YN", 1) //예전엔 일자마다 알림이 있었던거 같은데, 이제 기능 사라짐
//        values.put("week2YN", 1)
//        values.put("week3YN", 1)
//        values.put("week4YN", 1)
//        values.put("week5YN", 1)
//        values.put("week6YN", 1)
//        values.put("week7YN", 1)
//        values.put("gubun1YN", gubun1YN)
//        values.put("gubun2YN", gubun2YN)
//        values.put("gubun3YN", gubun3YN)
//        values.put("gubun4YN", gubun4YN)
//        values.put("gubun5YN", gubun5YN)
//        values.put("gubun6YN", gubun6YN)
//        values.put("gubun7YN", gubun7YN)
//        db.update("Alarm", values, "idx=?", arrayOf(idx.toString()))
//        db.close()
//    }
//
//    //알람 삭제
//    fun deleteAlarm(idx: Int){
//        val db = this.writableDatabase
//        db.delete("Alarm", "idx=?", arrayOf(idx.toString()))
//        db.close()
//    }
//
//    //알람 목록 (전체)
//    @SuppressLint("Range")
//    fun getAlarmList() : List<AlarmData>{
//        val sql = "select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm order by hour asc, minute asc"
//        val alarmList = ArrayList<AlarmData>()
//        val db = this.readableDatabase
//        val cursor = db.rawQuery(sql,null)
//        if(cursor.moveToFirst()){
//            do{
//                val alarm = AlarmData(
//                    name = cursor.getString(cursor.getColumnIndex("name")),
//                    gubun1YN = cursor.getString(cursor.getColumnIndex("gubun1YN")),
//                    gubun2YN = cursor.getString(cursor.getColumnIndex("gubun2YN")),
//                    gubun3YN = cursor.getString(cursor.getColumnIndex("gubun3YN")),
//                    gubun4YN = cursor.getString(cursor.getColumnIndex("gubun4YN")),
//                    gubun5YN = cursor.getString(cursor.getColumnIndex("gubun5YN")),
//                    gubun6YN = cursor.getString(cursor.getColumnIndex("gubun6YN")),
//                    gubun7YN = cursor.getString(cursor.getColumnIndex("gubun7YN")),
//                    hour = cursor.getString(cursor.getColumnIndex("hour")),
//                    minute = cursor.getString(cursor.getColumnIndex("minute")),
//                    timer1 = cursor.getString(cursor.getColumnIndex("timer1")),
//                    timer2 = cursor.getString(cursor.getColumnIndex("timer2")),
//                    alarm = cursor.getString(cursor.getColumnIndex("alarm")),
//                    idx = cursor.getString(cursor.getColumnIndex("idx")),
//                )
//                alarmList.add(alarm)
//            }while(cursor.moveToNext())
//        }
//        db.close()
//        return alarmList
//    }
//
//
//    //알람 켜둔 목록 (복약하기 위한 목록)
//    @SuppressLint("Range")
//    fun getAlarmOnList() : List<AlarmData>{
//        val sql = "select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm where alarm = 1 order by hour asc, minute asc "
//        val alarmList = ArrayList<AlarmData>()
//        val db = this.readableDatabase
//        val cursor = db.rawQuery(sql,null)
//        if(cursor.moveToFirst()){
//            do{
//                val alarm = AlarmData(
//                    name = cursor.getString(cursor.getColumnIndex("name")),
//                    gubun1YN = cursor.getString(cursor.getColumnIndex("gubun1YN")),
//                    gubun2YN = cursor.getString(cursor.getColumnIndex("gubun2YN")),
//                    gubun3YN = cursor.getString(cursor.getColumnIndex("gubun3YN")),
//                    gubun4YN = cursor.getString(cursor.getColumnIndex("gubun4YN")),
//                    gubun5YN = cursor.getString(cursor.getColumnIndex("gubun5YN")),
//                    gubun6YN = cursor.getString(cursor.getColumnIndex("gubun6YN")),
//                    gubun7YN = cursor.getString(cursor.getColumnIndex("gubun7YN")),
//                    hour = cursor.getString(cursor.getColumnIndex("hour")),
//                    minute = cursor.getString(cursor.getColumnIndex("minute")),
//                    timer1 = cursor.getString(cursor.getColumnIndex("timer1")),
//                    timer2 = cursor.getString(cursor.getColumnIndex("timer2")),
//                    alarm = cursor.getString(cursor.getColumnIndex("alarm")),
//                    idx = cursor.getString(cursor.getColumnIndex("idx")),
//                )
//                alarmList.add(alarm)
//            }while(cursor.moveToNext())
//        }
//        db.close()
//        return alarmList
//    }
//
//
//    //약물 복용여부 기입
//    @SuppressLint("Range")
//    fun insertEat(
//        idx:Int?,
//        year:Int,
//        alarm_id:Int, //Fk(AlarmIdx)
//        month:Int,
//        day:Int,
//        timer1:Int, //복용여부
//        pillTime:Int, //아침점심저녁 (alarm의 Timer)
//        etc:Int,
//        drug1:Int,
//        drug2:Int,
//        drug3:Int,
//        drug4:Int,
//        drug5:Int,
//        drug6:Int,
//        drug7:Int
//    ) : Int {
//        val db = this.writableDatabase
//        val values = ContentValues()
//        values.put("year", year)
//        values.put("alarm_id", alarm_id)
//        values.put("month", month)
//        values.put("day", day)
//        values.put("timer1", timer1)
//        values.put("pill_time", pillTime)
//
//        values.put("etc", etc)
//        values.put("drug1", drug1)
//        values.put("drug2", drug2)
//        values.put("drug3", drug3)
//        values.put("drug4", drug4)
//        values.put("drug5", drug5)
//        values.put("drug6", drug6)
//        values.put("drug7", drug7)
//
//        if (idx!=0){
//            db.update("Drug_Eat", values, "idx=?", arrayOf(idx.toString()))
//        } else {
//            db.insert("Drug_Eat", null, values)
//        }
//        db.close()
//
//        val sql = "SELECT idx from Drug_Eat ORDER by idx desc limit 1"
//        val dbs = this.readableDatabase
//        val cursor = dbs.rawQuery(sql,null)
//        var idx = 0
//        if(cursor.moveToFirst()){
//            do{
//                idx = cursor.getString(cursor.getColumnIndex("idx")).toInt()
//            }while(cursor.moveToNext())
//        }
//        dbs.close()
//
//        return idx
//    }
//
//    //해당 알람마다 약물 먹었는지 여부
//    @SuppressLint("Range")
//    fun selectDayEat(
//        year:Int,
//        alarm_id:Int, //Fk(AlarmIdx)
//        month:Int,
//        day:Int
//    ) : DrugDayEat? {
//        val sql = "SELECT idx, timer1, drug1, drug2, drug3, drug4, drug5, drug6, drug7 " +
//                "from Drug_Eat " +
//                "WHERE alarm_id = $alarm_id and year = $year and month = $month and day = $day " +
//                "order by idx desc limit 1"
//
//        val dbs = this.readableDatabase
//        val cursor = dbs.rawQuery(sql,null)
//        var eat : DrugDayEat? = null
//        if(cursor.moveToFirst()){
//            do{
//                eat = DrugDayEat (
//                    idx = cursor.getString(cursor.getColumnIndex("idx")),
//                    timer1 = cursor.getString(cursor.getColumnIndex("timer1")),
//                    drug1 = cursor.getString(cursor.getColumnIndex("drug1")),
//                    drug2 = cursor.getString(cursor.getColumnIndex("drug2")),
//                    drug3 = cursor.getString(cursor.getColumnIndex("drug3")),
//                    drug4 = cursor.getString(cursor.getColumnIndex("drug4")),
//                    drug5 = cursor.getString(cursor.getColumnIndex("drug5")),
//                    drug6 = cursor.getString(cursor.getColumnIndex("drug6")),
//                    drug7 = cursor.getString(cursor.getColumnIndex("drug7")),
//                )
//            }while(cursor.moveToNext())
//        }
//        dbs.close()
//        return eat
//    }
//
//
//    //알람 시작일 (달력표시용)
//    @SuppressLint("Range")
//    fun getStartTime() : String {
//        val sql = "select stime from alarm order by stime asc limit 1"
//        val dbs = this.readableDatabase
//        val cursor = dbs.rawQuery(sql,null)
//        var stime = ""
//        if(cursor.moveToFirst()){
//            do{
//                stime = cursor.getString(cursor.getColumnIndex("stime"))
//            }while(cursor.moveToNext())
//        }
//        dbs.close()
//        return stime
//    }
//
//
//    //날짜별로 약물 복용여부(아침점심저녁)
//    @SuppressLint("Range")
//    fun getPillTimes(
//        year: Int,
//        month: Int,
//        day: Int
//    ) : List<String>? {
//        val sql = "select pill_time from Drug_Eat where year = $year and month = $month and day = $day order by pill_time asc"
//        val pillTimeList = ArrayList<String>()
//        val db = this.readableDatabase
//        val cursor = db.rawQuery(sql,null)
//        if(cursor.moveToFirst()){
//            do{
//                val pillTime = cursor.getString(cursor.getColumnIndex("pill_time"))
//                pillTimeList.add(pillTime)
//            }while(cursor.moveToNext())
//        }
//        db.close()
//        return pillTimeList
//    }
//
//    //약물복용 달성?율
//    @SuppressLint("Range")
//    fun drugPercentage(
//        selected: LocalDate?,
//    ) : Int {
//        val today = LocalDate.now().dayOfMonth
//        val todayString = LocalDate.now().toString().replace("-","")
//        val sql = "select stime from Alarm where stime <= $todayString order by stime asc"
//        val db = this.readableDatabase
//        val cursor = db.rawQuery(sql,null)
//        val total = cursor.count * today
//        db.close()
//
//        val year = selected?.year
//        val month = selected?.monthValue
//
//        val sql2 = "select year, month, day, timer1 from Drug_Eat where year=$year and month=$month"
//        val db2 = this.readableDatabase
//        val cursor2 = db2.rawQuery(sql2,null)
//        val cnt = cursor2.count
//        db2.close()
//
//        if (cnt == 0 && total == 0) {
//            return 0
//        } else {
//            return cnt * 100 / total
//        }
//    }
//}
