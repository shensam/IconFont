# IconFont
Using IconFont to generate ICON or image



### 使用说明

- IconFont 的字体文件可以从 [http://www.iconfont.cn/](http://www.iconfont.cn/) （阿里巴巴矢量图标库）下载。
- 下载好后，加入到项目中，并且在 Info.plist 添加 Fonts provided by application 一项，加入 IconDemo.ttf 字体，程序运行是会自动注册该字体
- 编写 IconFont 每个 Icon 的图标代号，Swift 中是 `\u{e600}` 的样式



### 用例说明

```swift
let icon_code_apple = "\u{e601}"
let image = IconFont.init(code: icon_code_apple, size: 25, fontName: "IconDemo", color: .gray).imageSquare(25)

imageView?.image = image
```

