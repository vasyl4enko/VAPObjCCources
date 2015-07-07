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
#import "VAPWoman.h"
#import "VAPMan.h"
#import "VAPHuman+VAPHumanExtension.h"

NSString *const kDefaultNameHuman = @"defaultName";

@interface VAPHuman ()

@property(nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation VAPHuman

@dynamic children;

- (instancetype)initWithName:(NSString *)name gender:(VAPHumanGender)gender age:(uint16_t)age {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.age = age;
    }
    
    return self;
}

- (instancetype)init
{
    self = [self initWithName: kDefaultNameHuman gender: arc4random_uniform(2) + 1 age:0];
    
    return self;
}

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Implementation

#warning  need delete
- (void)goToWar {
    NSLog(@"I go to war");
}
#warning  need delete
- (VAPHuman *)birthChild {
    return [[VAPHuman alloc] init];
}

- (void)sayHello {
    NSLog(@"What's up man, my namy is %@" , self.name);
    for (VAPHuman *child in self.children) {
        [child sayHello];
    }
}

- (void)addChild:(VAPHuman *) child {
    [self.mutableChildren addObject: child];
}

- (void)removeChild:(VAPHuman *) child {
    [self.mutableChildren removeObject: child];
}

- (id)performGenderSpecificOperation {
    return nil;
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



@end
