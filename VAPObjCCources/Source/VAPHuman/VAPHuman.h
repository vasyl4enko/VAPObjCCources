//
//  VAPHuman.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

//Условие:
//Есть существо, у существа есть typedef пола, есть строка имени, есть масса, есть возраст, есть массив детей. Существо умеет воевать и рожать детей. При родах существо не добавляет к себе ребенка автоматом. Существо умеет добавит к себе детей и удалить. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
//Задание:
//1. Написать класс существа;
//2. Создать несколько существ и положить их в массив, каждому из существ добавить детей;
//3. В цикле пройти по массиву существ и проверить их пол. Если мужик, то надо отправить существо воевать, если баба, то рожать детей;
//4. У существа наружу должен быть немутабельный массив детей через динамическое проперти с копи+авторелиз, а внутри - еще и мутабельное свойство.


#import <Foundation/Foundation.h>


typedef enum{ 
    VAPHumanGenderMale,
    VAPHumanGenderFemale
} VAPHumanGender;

@interface VAPHuman : NSObject
@property(nonatomic, readonly, retain)      NSArray             *children;
@property(nonatomic, copy)                  NSString            *name;
@property(nonatomic, assign)                uint16_t            mass;
@property(nonatomic, assign)                uint16_t            age;


- (instancetype)initWithName:(NSString *) name gender:(VAPHumanGender) gender age:(uint16_t) age;

- (VAPHuman *)birthChild;

- (void)sayHello;

- (void)addChild:(VAPHuman *) child;

- (void)removeChild:(VAPHuman *) child;

- (id)performGenderSpecificOperation;

@end

