//
//  Url.swift
//  q
//
//  Created by qli on 2016/10/20.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation


struct Qurl{
    
    //阿里云图片URL
    static let IMAGE_SERVICE_URL = "http://qmain.oss-cn-shenzhen.aliyuncs.com/images/"
    //阿里云图片格式
    static let format = "?x-oss-process=image/resize,m_lfit,w_\(Int(PhoneUtil.getPhoneWidthAndHeight()[PhoneUtil.WIDTH]!)),h_200,limit_0/auto-orient,0/format,png/watermark,text_5p2O5Y-W5LiT55So,type_d3F5LW1pY3JvaGVp,size_40,t_50,color_000000,g_se,y_10,x_10"
    
    //
    static let url:String = "http://101.201.101.47:1081/apprequest?_n=getemotionlist&page=1&md5hash=f6138b001c7253775700803edc8bcb80&appid=1001&devid=318c7a2f6215d9fa6a2b6de0557521fc&chknum=dedbf81611be6e5e1542199695ca8c53"
    
    static let UUID:String = "9900077420161209145631"
    
    static let devider_url:String = ""
    
    
    
    static  let MAIN_SERVICE_URL:String = "http://120.76.249.219:8085/klread"
    
    static let FEEDBACK_URL:String = "/user/userSuggest.do"
    
    static let url_preameter:String = "uuid=9900077420161209145631&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=99000774285433&imsi=99000774285433&timestamp=\(DataUtil.getNowData())"
    
    //精选
    static let SELECTED_URL = "http://120.76.249.219:8085/klread/category/querySubCat.do?uuid=8665380220161128111822&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=1&type=3&size=7&page=1&booksize=3&digest=0AEAB58ACDD837A17A32B12A56CF3CB9"
    //书城
    static let BOOKSTORE_URL = "http://klread.nd66.com:8085/klread/category/querySubCat.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=10&type=2&size=10&page=1&digest=0AEAB58ACDD837A17A32B12A56CF3CB9"
    
    //发现页面活动
    static let FIND_ITEM = "http://klread.nd66.com:8085/klread/category/querySubCat.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=24&type=2&size=4&page=1&digest=0AEAB58ACDD837A17A32B12A56CF3CB9"
 
    static let FIND_ITEM_X = "http://klread.nd66.com:8085/klread/comment/hot.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&page=1&size=5&digest=0AEAB58ACDD837A17A32B12A56CF3CB9"
    
    static func find_comment(page: Int,size: Int) -> String{
        
        return "http://klread.nd66.com:8085/klread/comment/hot.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&page=\(page)&size=\(size)&digest=0AEAB58ACDD837A17A32B12A56CF3CB9"
    
    }
    
    static func details_url(_ bid: String) -> String{
        
        return "http://klread.nd66.com:8085/klread/novel/details.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&ids=\(bid)&chapters=5&comments=3&digest=E53AC067F3505EF797EE00F992CDBE50"
    }
    
    //小说详情
    
    static let NAV_URL = "http://klread.nd66.com:8085/klread/novel/details.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&ids=9&chapters=5&comments=3&digest=E53AC067F3505EF797EE00F992CDBE50"
    
    
    static func more_url(_ catid: String,_ page: Int,_ size: Int) -> String{
    
        
        return "http://klread.nd66.com:8085/klread/category/details.do?uuid=8612580320170311151410&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=\(catid)&type=1&size=\(size)&page=\(page)&digest=E53AC067F3505EF797EE00F992CDBE50"
    }   
    //查看全部评论
    static func comment_all_url(_ page: Int,_ size :Int,_ id: Int) -> String{
    
        return "http://klread.nd66.com:8085/klread/comment/bookComment.do?uuid=8623800320161226115812&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&page=\(page)&size=\(size)&id=\(id)&digest=E53AC067F3505EF797EE00F992CDBE50"
    
    }
//    
//    static func  category_url(_ catid: Int,_ type: Int,_ page: Int,_ size: Int) -> String{
//    
//        return "http://klread.nd66.com:8085/klread/category/details.do?uuid=8623910320170708154321&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=\(catid)&type=\(type)&size=\(size)&page=\(page)&digest=E53AC067F3505EF797EE00F992CDBE50"
//    
//    }
//http://klread.nd66.com:8085/klread/category/details.do?uuid=8623910320170708154321&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=11&type=1&size=5&page=1&digest=E53AC067F3505EF797EE00F992CDBE50
    //搜索
    static  let search_url = "http://klread.nd66.com:8085/klread/novel/keyword.do?uuid=8612580320170311151410&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&size=10&digest=E53AC067F3505EF797EE00F992CDBE50"
    
    //章节列表
    static let chapter_list_url = "http://klread.nd66.com:8085/klread/novel/chapters.do?uuid=8623910320170708154321&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&bookid=8&page=1&size=100&sort=sort&digest=2A80F9409457A8AFDE531C25BD1FA20F"
}
