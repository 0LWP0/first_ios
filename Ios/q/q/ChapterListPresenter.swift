//
//  ChapterListPresenter.swift
//  q
//
//  Created by qli on 16/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class ChapterListPresenter {
    var chapterlist = ChapterList()
    
    var chapter: ChapterListProtocol?
    
    
    func handerJsonData() {
        Alamofire.request(Qurl.chapter_list_url).responseJSON{
            response in
            
            switch response.result{
                
            case .success:
                    let json =  JSON(str: response.result.value!)
                    let headerjson = json["header"]
                    let code = headerjson["resultCode"].intValue
                    if code == 200{
                        let json =  json["content"]
                        self.chapterlist.page = json["page"].intValue
                        self.chapterlist.nextpage = json["nextPage"].boolValue
                        self.chapterlist.total = json["total"].intValue
                        
                        for json in json["chapterList"].arrayValue{
                        
                            let chapter = ChapterObject()
                            chapter.chapterId = json["chapterId"].intValue
                            chapter.chapterOrder = json["chapterOrder"].intValue
                            chapter.chapterTitle = json["chapterTitle"].stringValue
                            chapter.updateTime = json["updateTime"].stringValue
                            chapter.words = json["words"].stringValue
                            chapter.price = json["price"].intValue
                            self.chapterlist.chapterList.append(chapter)
                        }
                        self.chapter?.getChapterListData(self.chapterlist)
                    }else{
                        self.chapter?.getError(ERROR_TYPE.error_REQUEST)
                        
                    }
                    break
                
            case .failure:
                
                self.chapter?.getError(ERROR_TYPE.error_REQUEST)

                
                break
            }
            
        }
    }
    
    func setChapterListProtocol(cp: ChapterListProtocol) {
        self.chapter = cp
    }
}
