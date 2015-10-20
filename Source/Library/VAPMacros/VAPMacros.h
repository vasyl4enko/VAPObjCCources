//
//  VAPMacros.h
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 16.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#ifndef Task2_VAPMacros_h
#define Task2_VAPMacros_h

#define VAPSynthesizeSetterWithExpressions(var, preExpression, postExpression) \
if (_##var != var ) { \
    preExpression; \
    _##var = var; \
    postExpression; \
}

#define VAPSynthesizeObservingSetter(var) \
    VAPSynthesizeSetterWithExpressions(var, [_##var removeObserver:self], [_##var addObserver:self])

#define VAPWeakify(variable) \
    __weak typeof(variable) __VAPWeak__##__##variable = variable

#define VAPStrongify(variable) \
    __strong typeof(variable) variable = __VAPWeak__##__##variable

#define VAPEmpty

#define VAPStrongifyAndReturnEntity(variable, entity) \
    VAPStrongify(variable); \
    if(!variable) { \
        return entity; \
    }

#define VAPStrongifyAndReturnIfNil(variable) \
    VAPStrongifyAndReturnEntity(variable, VAPEmpty);

#define VAPStrongifyAndReturnNilIfNil(variable) \
    VAPStrongifyAndReturnEntity(variable, nil);

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
    @interface viewControllerClass (__##viewClass__##propertyName) \
    VAPMainViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__##viewClass__##propertyName) \
    \
    @dynamic propertyName; \
    \
    VAPViewGetterSynthesize(propertyName, viewClass) \
    \
    @end

#endif
