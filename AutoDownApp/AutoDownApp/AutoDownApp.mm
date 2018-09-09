#line 1 "/Users/liuhualong/Desktop/git/HLTweakDemo/AutoDownApp/AutoDownApp/AutoDownApp.xm"


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

@class SKUISearchFieldController; 
static SKUISearchFieldController* (*_logos_orig$_ungrouped$SKUISearchFieldController$initWithContentsController$)(_LOGOS_SELF_TYPE_INIT SKUISearchFieldController*, SEL, id) _LOGOS_RETURN_RETAINED; static SKUISearchFieldController* _logos_method$_ungrouped$SKUISearchFieldController$initWithContentsController$(_LOGOS_SELF_TYPE_INIT SKUISearchFieldController*, SEL, id) _LOGOS_RETURN_RETAINED; 

#line 9 "/Users/liuhualong/Desktop/git/HLTweakDemo/AutoDownApp/AutoDownApp/AutoDownApp.xm"

static SKUISearchFieldController* _logos_method$_ungrouped$SKUISearchFieldController$initWithContentsController$(_LOGOS_SELF_TYPE_INIT SKUISearchFieldController* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
    NSLog(@"SKUISearchFieldController initWithContentsController");

    HBLogDebug(@"-[<SKUISearchFieldController: %p> initWithContentsController:%@]", self, arg1);
    id obj = _logos_orig$_ungrouped$SKUISearchFieldController$initWithContentsController$(self, _cmd, arg1);

    if (timers >= 1) {
        return obj;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        timers = timers + 1;

        if (self.searchBar) {
            
            [self setValue:@"团贷网" forKeyPath:@"self.searchBar.text"];
            
            [self.searchBar becomeFirstResponder];
        }
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self searchBarSearchButtonClicked:self.searchBar];
    });

    return obj;
}




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SKUISearchFieldController = objc_getClass("SKUISearchFieldController"); MSHookMessageEx(_logos_class$_ungrouped$SKUISearchFieldController, @selector(initWithContentsController:), (IMP)&_logos_method$_ungrouped$SKUISearchFieldController$initWithContentsController$, (IMP*)&_logos_orig$_ungrouped$SKUISearchFieldController$initWithContentsController$);} }
#line 42 "/Users/liuhualong/Desktop/git/HLTweakDemo/AutoDownApp/AutoDownApp/AutoDownApp.xm"
