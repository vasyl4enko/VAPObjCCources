//
//  VAPMacros.h
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 16.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#ifndef GUITask1_VAPMacros_h
#define GUITask1_VAPMacros_h

#define VAPWeakify(variable) \
    __weak typeof(variable) __VAPWeak__##__##variable = variable


#define VAPStrongify(variable) \
    __strong typeof(variable) variable = __VAPWeak__##__##variable

#define VAPStrongifyAndReturnIfNil(variable) \
    VAPStrongify(variable); \
    if (!variable) { \
        return; \
    }


#define VAPMainViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

#define VAPViewGetterSynthesize(selector, viewClass) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define VAPViewControllerMainViewProperty(viewControllerClass, propertyName, viewClass) \
    @interface viewControllerClass (viewClass##propertyName) \
    VAPMainViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (viewClass##propertyName) \
    \
    @dynamic propertyName; \
    \
    VAPViewGetterSynthesize(propertyName, viewClass) \
    \
    @end

#endif
