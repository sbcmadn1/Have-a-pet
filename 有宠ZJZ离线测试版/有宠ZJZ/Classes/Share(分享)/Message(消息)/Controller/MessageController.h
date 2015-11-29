//
//  MessageController.h
//  有宠ZJZ
//
//  Created by apple on 15/9/24.


#import <UIKit/UIKit.h>

@class MessageController;
@protocol MessageDelegate <NSObject>
@optional


//代理方法

- (void) MessageNavigationView:(MessageController*) MessageView DidsecControllerIndex:(NSInteger) Index;

@end
@interface MessageController : UINavigationController

@property(nonatomic,weak) id<MessageDelegate> delegate2;

@property (nonatomic,assign) NSInteger index;

+ (instancetype)messageController;
@end
