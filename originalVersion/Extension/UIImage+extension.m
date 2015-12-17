//
//  UIImage+extension.m
//  微博01
//
//  Created by fish on 15/10/9.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)

+ (UIImage *)resizedImage:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

+ (UIImage *)resizedImage2:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width topCapHeight:image.size.height*0.5];
}
@end
