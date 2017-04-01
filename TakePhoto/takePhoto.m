//
//  takePhoto.m
//  TakePicture
//
//  Created by yitonghou on 15/8/5.
//  Copyright (c) 2015年 移动事业部. All rights reserved.
//
#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])

#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define takePhotoShare [takePhoto sharedModel]

#import "takePhoto.h"

@implementation takePhoto

+ (takePhoto *)sharedModel{
    static takePhoto *sharedModel = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}


+(void)sharePicture:(sendPictureBlock)block{
    
    takePhotoShare.sPictureBlock = block;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"设置图像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [takePhotoShare takePicture:UIImagePickerControllerSourceTypeCamera];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [takePhotoShare takePicture:UIImagePickerControllerSourceTypePhotoLibrary];

    }]];
    
    [AppRootViewController presentViewController:alertController animated:YES completion:^{}];


}

- (void)takePicture:(NSUInteger)UIImagePickerControllerSourceType{
    
    // 跳转到相机或相册页面
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType;

    }
    else
    {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;

    }
    
    [AppRootViewController presentViewController:imagePickerController animated:YES completion:NULL];

}

#pragma mark - image picker delegte

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];

    [takePhotoShare sPictureBlock](image);
    
}


@end
