// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

%hook SKUISearchFieldController
- (id)initWithContentsController:(id)arg1 {
    NSLog(@"SKUISearchFieldController initWithContentsController");

    %log;
    id obj = %orig;

    if (timers >= 1) {
        return obj;
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        timers = timers + 1;

        if (self.searchBar) {
            // 设置搜索关键词
            [self setValue:@"团贷网" forKeyPath:@"self.searchBar.text"];
            // 设置第一响应者
            [self.searchBar becomeFirstResponder];
        }
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 开始搜索
        [self searchBarSearchButtonClicked:self.searchBar];
    });

    return obj;
}
%end



