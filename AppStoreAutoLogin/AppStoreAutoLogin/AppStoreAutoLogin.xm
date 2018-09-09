// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

%hook UIAlertController
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"UIAlertController viewDidAppear");

    %log;
    %orig;

    atimers = atimers + 1;

    if (atimers == 1) {
        return;
    }

    if ([keepAction.title isEqualToString:@"使用现有的 Apple ID"]) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        ((void ( *)(id, SEL, UIAlertAction*))objc_msgSend)(self, NSSelectorFromString(@"_dismissWithAction:"),keepAction);
    });
}

    if ([keepAction.title isEqualToString:@"好"]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSLog(@"UIAlertAction 5s %@",testBlock);
        if (self.textFields.count > 1) {
            self.textFields.firstObject.text = @"liuhualong";
            self.textFields.lastObject.text = @"liuhualong";

        ((void ( *)(id, SEL, UIAlertAction*))objc_msgSend)(self, NSSelectorFromString(@"_dismissWithAction:"),keepAction);

            }
        });
    }
}
%end



