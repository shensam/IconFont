//
//  IconCode.swift
//  IconFont
//
//  Created by mellow on 2017/1/21.
//  Copyright © 2017年 HPRT. All rights reserved.
//

import Foundation


open class IconDemo: NSObject {
    
    /** 
     1. IconFont 的字体文件可以从 http://www.iconfont.cn/ （阿里巴巴矢量图标库）下载。
     2. 下载好后，加入到项目中，并且在 Info.plist 添加 Fonts provided by application 一项，加入 IconDemo.ttf 字体，程序运行是会自动注册该字体
     3. 编写 IconFont 每个 Icon 的图标代号，Swift 中是 "\u{e600}" 的样式
     */
    open static let qq          = "\u{e60a}"
    open static let alipay      = "\u{e608}"
    open static let wechat      = "\u{e607}"
    open static let weibo       = "\u{e606}"
    open static let safari      = "\u{e603}"
    open static let android     = "\u{e602}"
    open static let apple       = "\u{e601}"
}
