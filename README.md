# 一行代码获得拍照、相册的图片，不用麻时间去写代理。

`[takePhoto sharePicture:^(UIImage *HeadImage){.... }];`
   
    
![SKTakePhoto](http://upload-images.jianshu.io/upload_images/1485140-ccd8a0d949738817.png?imageMogr2/auto-orient/strip%7CimageView2/2)


# 效果图
![Alt text](http://upload-images.jianshu.io/upload_images/1485140-5b76fedc87edff55.png?imageMogr2/auto-orient/strip%7CimageView2/2)

[简书地址](http://www.jianshu.com/p/685bdf2f909c)

#我用的是Xcode 8.2  在 Info.plist中添加了 一些设置
   ` <key>NSCameraUsageDescription</key>
     <string>使用相机</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>使用相册</string>`
