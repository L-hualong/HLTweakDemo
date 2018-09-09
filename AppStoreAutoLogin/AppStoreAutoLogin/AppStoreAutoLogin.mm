#line 1 "/Users/liuhualong/Desktop/git/HLTweakDemo/AppStoreAutoLogin/AppStoreAutoLogin/AppStoreAutoLogin.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIAlertController; 
static void (*_logos_orig$_ungrouped$UIAlertController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UIAlertController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 9 "/Users/liuhualong/Desktop/git/HLTweakDemo/AppStoreAutoLogin/AppStoreAutoLogin/AppStoreAutoLogin.xm"

static void _logos_method$_ungrouped$UIAlertController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    NSLog(@"UIAlertController viewDidAppear");

    HBLogDebug(@"-[<UIAlertController: %p> viewDidAppear:%d]", self, animated);
    _logos_orig$_ungrouped$UIAlertController$viewDidAppear$(self, _cmd, animated);

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




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); MSHookMessageEx(_logos_class$_ungrouped$UIAlertController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$UIAlertController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$UIAlertController$viewDidAppear$);} }
#line 47 "/Users/liuhualong/Desktop/git/HLTweakDemo/AppStoreAutoLogin/AppStoreAutoLogin/AppStoreAutoLogin.xm"
