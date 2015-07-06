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

@implementation VAPHuman

NSString *const kDefaultNameHuman = @"defaultName";



- (void)dealloc {
    [self.name release];
    [self.children release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Implementation

- (instancetype)initWithName:(NSString *)name gender:(VAPHumanGender)gender age:(uint16_t)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.age = age;
    }
    
    return self;
}

- (instancetype)init
{
    self = [self initWithName: kDefaultNameHuman gender: arc4random_uniform(2) + 1 age:0];
    
    return self;
}

- (void)VAPHumanGoToWar {
    NSLog(@"I belive I can fly");
    NSLog(@"I belive I can touch the sky");
    NSLog(@"But I go to war");
}

- (VAPHuman *)VAPHumanBirthChild {
    return Nil;
}

- (SEL)VAPHumanActionByGender{
    SEL result;
    if (VAPHumanGenderOther != self.gender) {
        if (VAPHumanGenderMale == self.gender) {
            result = NSSelectorFromString(@"VAPHumanGoToWar");
        } else {
            result = NSSelectorFromString(@"VAPHumanBirthChild");
        }
        
    }
    return result;
}

- (void)VAPHumanSayHello {
    NSLog(@"What's man up, my namy is %@" , self.name);
    for (VAPHuman *child in self.children) {
        [child VAPHumanSayHello];
    }
}

- (void)VAPHumanAddChild:(VAPHuman *) child {
        [self.children addObject:child];
}

#pragma mark -
#pragma mark Accessors

- (NSMutableArray *)children {
    if (nil == _children) {
        _children = [[NSMutableArray alloc] init];
    }
    
    return _children;
}

- (NSString *)name {
    if (nil == _name) {
        _name = [[NSString alloc] init];
    }
    
    return _name;
}


@end
