//
//  VAPHuman.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//


//Задание 1.
//Условие:
//Есть существо, у существа есть typedef пола, есть строка имени, есть масса, есть возраст, есть массив детей. Существо умеет воевать и рожать детей. При родах существо не добавляет к себе ребенка автоматом. Существо умеет добавит к себе детей и удалить. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
//Задание:
//1. Написать класс существа;
//2. Создать несколько существ и положить их в массив, каждому из существ добавить детей;
//3. В цикле пройти по массиву существ и проверить их пол. Если мужик, то надо отправить существо воевать, если баба, то рожать детей;
//4. У существа наружу должен быть немутабельный массив детей через динамическое проперти с копи+авторелиз, а внутри - еще и мутабельное свойство.

#import "VAPHuman.h"
#import "NSObject+VAPExtension.h"
#import "VAPMan.h"
#import "VAPWoman.h"

//static NSString *const kDefaultNameHuman    = @"defaultName";
static NSString *const kGreeting            = @"What's up man, my namy is %@";

@interface VAPHuman ()

@property(nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation VAPHuman

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (Class)humanClassForGender:(VAPHumanGender) gender {
    return VAPHumanGenderMale == gender ? [VAPMan class] : [VAPWoman class];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (id)initWithGender:(VAPHumanGender) gender  {
    self = [super init];
    Class genderClass = [[self class] humanClassForGender:gender];
    [self release];
    
    return [[genderClass alloc] init];
}

#pragma mark -
#pragma mark Accessors

- (NSMutableArray *)mutableChildren {
    if (!_mutableChildren) {
        _mutableChildren = [[NSMutableArray alloc] init];
    }
    
    return _mutableChildren;
}

- (NSArray *)children {
    return [[_mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementation

- (void)sayHello {
    NSLog(kGreeting, self.name);
    for (VAPHuman *child in self.children) {
        [child sayHello];
    }
}

- (void)addChild:(VAPHuman *) child {
    if (child) {
        [self.mutableChildren addObject:child];
    }
}

- (void)removeChild:(VAPHuman *) child {
    [self.mutableChildren removeObject:child];
}

- (id)performGenderSpecificOperation {
    return nil;
}





@end
