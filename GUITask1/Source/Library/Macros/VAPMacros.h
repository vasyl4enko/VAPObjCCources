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
    __weak typeof(variable) weakSelf = variable


#define VAPStrongify(variable) \
    __strong typeof(variable) strongSelf = variable

#endif
