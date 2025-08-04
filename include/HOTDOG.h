/*

 HOTDOG

 Copyright (c) 2020 Arthur Choung. All rights reserved.

 Email: arthur -at- hotdogpucko.com

 This file is part of HOTDOG.

 HOTDOG is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.

 */

#ifndef _HOTDOG_H
#define _HOTDOG_H 1

#ifdef BUILD_FOR_OSX_ON_LINUX
typedef double __m128d;
typedef long long __m128i;
#endif

#ifdef BUILD_FOR_OSX
typedef int NSInteger;
typedef unsigned int NSUInteger;
#endif

#ifndef BUILD_FOUNDATION
#ifdef BUILD_WORKAROUND_OSX_X11_CONFLICT
#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSAutoreleasePool.h>
#include <stdlib.h>
#include <string.h>
#else
#import <Foundation/Foundation.h>
#endif
#endif

#ifdef BUILD_FOR_OSX
#ifndef BUILD_WORKAROUND_OSX_X11_CONFLICT
#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>
#endif
#define CGFloat float
#include <unistd.h>
#import <objc/objc-runtime.h>
char *class_getName(Class cls);
int class_getInstanceSize(Class cls);
Class class_getSuperclass(Class cls);
char *ivar_getName(Ivar ivar);
int ivar_getOffset(Ivar ivar);
char *ivar_getTypeEncoding(Ivar ivar);
Ivar *class_copyIvarList(Class cls, unsigned int *outCount);
SEL method_getName(Method m);
IMP method_getImplementation(Method m);
void method_getReturnType(Method m, char *buf, int bufsize);
id object_getClass(id obj);
#endif

#ifdef BUILD_FOR_IOS
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

#define NSFont UIFont
#define NSColor UIColor
#define NSImage UIImage
#define NSBezierPath UIBezierPath
@interface NSObject(JFioewjfkldsjlkfjdslkfjlkds)
- (CGSize)sizeWithAttributes:(id)dict;
@end
#endif

struct Int2 {
    union {
        int x;
        int w;
    };
    union {
        int y;
        int h;
    };
};
typedef struct Int2 Int2;

struct Int4 {
    int x;
    int y;
    int w;
    int h;
};
typedef struct Int4 Int4;

#ifdef BUILD_FOUNDATION

#define _GNU_SOURCE
#include <sys/param.h>
#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/Object.h>
#include <ctype.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdint.h>

id object_copy(id obj, size_t size);

typedef struct {
    unsigned long state;
    id *itemsPtr;
    unsigned long *mutationsPtr;
    unsigned long extra[5];
} NSFastEnumerationState;

@interface NSAutoreleasePool : Object
{
    id *_objs;
    int _nobjs;
    int _alloc;
}
@end
@interface NSConstantString : Object
{
#ifndef BUILD_WITH_GUNSTEP_RUNTIME
@public
#endif
    char *_contents;
    int _length;
}
@end
@interface NSObject : Object
{
#ifndef BUILD_WITH_GUNSTEP_RUNTIME
@public
#endif
    char *_contents;
    int _length;
    int _alloc;
    int _retainCount;
}
@end
@interface NSString : NSObject
@end
@interface NSMutableString : NSString
@end
@interface NSDictionary : NSObject
@end
@interface NSMutableDictionary : NSDictionary
@end
@interface NSArray : NSObject
@end
@interface NSMutableArray : NSArray
@end
@interface NSData : NSObject
@end
@interface NSMutableData : NSData
@end
@interface NSValue : NSObject
@end

#endif

@interface IvarObject : NSObject
@end
@interface Definitions : NSObject
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjf)
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjffjdksljfkldsjkffjdskffsdjkfjsdkjk)
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjffjdksljfkldsjkffjdskfjk)
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjffjdksljfkldsjkffjdskfjkfjdskfjsdk)
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjffjdksljfkldsjkffjdskfjkfjdskfjsdkfjdksjfks)
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjffjdksljfkldsjkffjdskfjkjfkdsjkfj)
@end
@interface Definitions(Fjewilfmlkdsmvlksdkjffjkjekwljfklwe)
@end
@interface Definitions(INMfefdisfjwlfmklsdmvklsjdklfjklsdffjdkslmfklxcmvklcfdsmkfmekkfxdsfmneoiiooikl)
@end
@interface Definitions(INMfewlfmklsdmvklsjdklfjklsdffjdkslmfklxcmvklcfdsmkfmekkfxdsfmneoiiooikl)
@end
@interface Definitions(INMfewlfmklsdmvklsjdklfjklsdffjdkslmfklxcmvklcfdsmkfmekkfxkl)
@end
@interface Definitions(INMfewlfmklsdmvklsjdklfjklsdffjdkslmfklxcmvklcxkl)
@end
@interface Definitions(INMfewlfmklsdmvklsjdklfjklsdfjfksdjfkj)
@end
@interface Definitions(dsfjkdsjflkdsjlkfsdjf)
@end
@interface Definitions(emjfkwlmfkldlskfm)
@end
@interface Definitions(fdsjfklsdklfjklsdjfklsjdklfj)
@end
@interface Definitions(fewiomfiodsvmkocxjvoksjdfoks)
@end
@interface Definitions(fjdklsjfkldsjfsdifjikdiikjf)
@end
@interface Definitions(fjdklsjfkldsjklfjs)
@end
@interface Definitions(fjdklsjfkldskewiuriewurijf)
@end
@interface Definitions(fjdklsjfkldskjeuriefjdif)
@end
@interface Definitions(fjdklsjfkldskjeuriwef)
@end
@interface Definitions(fjdklsjfkldskjf)
@end
@interface Definitions(fjdklsjfkldskjfurijvicx)
@end
@interface Definitions(fjdklsjfkljfiewjfijidskjf)
@end
@interface Definitions(fjdklsjflksdjf)
@end
@interface Definitions(fjdkslfjklsdf)
@end
@interface Definitions(fjdkslfjklsdjf)
@end
@interface Definitions(fjdkslfjlkdslfjldksjfdsfioewjfiowe)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkejwklfkdsfmkf)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkf)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkfjdskfjksdf)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkfjdskfjksdffjdksjfk)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkfjdskfjksdffjsdkfjksdfjksd)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkfjdskfjksdfjfdksf)
@end
@interface Definitions(fjdksljfklsdjfdsjkfljdsklfjkfjdskfjksdfjkdj)
@end
@interface Definitions(fjeiowmfklsjvojiewjfksdjksjkdjfks)
@end
@interface Definitions(fjeiwofmkdsomvklcxjvlksjdfkjds)
@end
@interface Definitions(fjejfksdljfklsdjfkkwlfmkldsmfkldsjflkfjdskfjksd)
@end
@interface Definitions(fjejfksdljfklsdjfkkwlfmkldsmfkldsjflkfjdskfjksdfjdksfj)
@end
@interface Definitions(fjejfksdljfklsdjfkkwlfmkldsmfkldsjflkfjdskfjksdfjdksfjksd)
@end
@interface Definitions(fjejfksdljfklsdjfkkwlfmkldsmfkldsjflkfjdskfjksdfjdskfjk)
@end
@interface Definitions(fjejfksdljfklsdjfkkwlfmkldsmfkldsjflkfjdskfjksdfjksdjfksd)
@end
@interface Definitions(fjeklwjfklsdmklfmklsd)
@end
@interface Definitions(fjeklwjfklsmdklfmiewmoofmkdsf)
@end
@interface Definitions(fjeklwjflksdjf)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflfjdskfjkdsk)
@end
@interface Definitions(fjekwlfmkldsmfkldsjfljkjkjkjklsdfwk)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflk)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflkfjdskfjksd)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflkfjdskfjksdfjdksfjksd)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflkfjdskfjksdfjdksjfksd)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflkfjdskfjksdfjkdsjfk)
@end
@interface Definitions(fjekwlfmkldsmfkldsjflkfjdskfjksdfjsdkjfksd)
@end
@interface Definitions(fjekwlmfkldsmfklsdfm)
@end
@interface Definitions(fjewlfiewfmklsdjfklsdjf)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklfdsjfjdskfjk)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklfdsjfjdskfjkfjdksfjk)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklfdsjfjdskfjkfjksdjfklsdfj)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklfdsjfjdskfjkfjsdkf)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklfdsjfjdskfjkjfkdsjfks)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklk)
@end
@interface Definitions(fjewmfnkdslnfsdjffdsjkflsdmkmklkfjdksljfklsdj)
@end
@interface Definitions(fjewmfnkdslnfsdjflfjdskfjkdsk)
@end
@interface Definitions(fjewmfnkdslnfsdjflfjdskfjksldjfkk)
@end
@interface Definitions(fjewmfnkdslnfsdjflfjdskfjksldjfkkfjdksfjksd)
@end
@interface Definitions(fjewmfnkdslnfsdjflfjdskfjksldjfkkfjdksfjksdjf)
@end
@interface Definitions(fjewmfnkdslnfsdjflfjdskfjksldjfkkfjdksjf)
@end
@interface Definitions(fjewmfnkdslnfsdjflfjdskfjksldjfkkfjdksjffjdsk)
@end
@interface Definitions(fjewmfnkdslnfsdjflk)
@end
@interface Definitions(fjieowfjkldsjflksdjkfl)
@end
@interface Definitions(fjieowjfklsdjkflsdfj)
@end
@interface Definitions(fjilsjflksdjfklsdjklfj)
@end
@interface Definitions(fjkdeifjdclsjfiowejfklsdjfklsdkljf)
@end
@interface Definitions(fjkdlsfjjfdksjfklksdejwklfmksldmfklsdmfklsdjkf)
@end
@interface Definitions(fjkdlsfjlksdejwklfmksldmfklsdmfklsdjkf)
@end
@interface Definitions(fjkdlsfjlksdjdskfldsjkfjfkdlsmfkldsmkfljkf)
@end
@interface Definitions(fjkdlsjfkldsjfkldsjklfwejffjdkjfkdjlsd)
@end
@interface Definitions(fjkdlsjfkldsjfkldsjklfwejffjdkjfkdjlsdfjdsk)
@end
@interface Definitions(fjkdlsjfkldsjflksdjfisdnmfilewv)
@end
@interface Definitions(fjkdlsjfklmnekwlvmlkdsjkvs)
@end
@interface Definitions(fjkdlsjfklmnekwlvmlkdsjkvsfjdskfjsdk)
@end
@interface Definitions(fjkdlsjfklmnekwlvmlkdsjkvsfjdskfjsdkfjdksjfks)
@end
@interface Definitions(fjkdlsjfklsdjfklsdfjdksjfkdsfjdskfjksdljfj)
@end
@interface Definitions(fjkdlsjfklsdjfklsdfjdksjfkdsfjdskfjksdljfjfdjskfjskd)
@end
@interface Definitions(fjkdlsjfklsdjfklsdfjdksjfkdsfjdskfjksdljfjfjdksfjksd)
@end
@interface Definitions(fjkdlsjfklsdjfklsdfjdksjfkdsfjdskfjksdljfjjfdksfjksd)
@end
@interface Definitions(fjkdlsjfklsdjfklsdfjdksjfkdsfjdskfjksdljfjjfdksjfksd)
@end
@interface Definitions(fjkdlsjfklsdjklfjsdf)
@end
@interface Definitions(fjkdlsjfklsdjklfsdklfj)
@end
@interface Definitions(fjkdlsjflksdjklfjfksdjf)
@end
@interface Definitions(fjkdlsjkfjkdfjlksdjdskfldsjkfjfkdlsmfkldsmkfljkf)
@end
@interface Definitions(fjkdsjfksdjkfjk)
@end
@interface Definitions(fjkdsjflkjdsklfj)
@end
@interface Definitions(fjkdslfjklsdjf)
@end
@interface Definitions(fjkdslfjklsdjflk)
@end
@interface Definitions(fjkdsljfkldsjlkfsdjf)
@end
@interface Definitions(fjkdsljfklsdjf)
@end
@interface Definitions(fjkdsljfklsdjfueirwieofj)
@end
@interface Definitions(fjkldsjflkdslkfj)
@end
@interface Definitions(fjkldsjlkfjdsf)
@end
@interface Definitions(fjklsdjfksdlkjfjskdlfjksdf)
@end
@interface Definitions(fjklwemklfmksdlvijsodjfksdfj)
@end
@interface Definitions(fjksdlfkjsdfj)
@end
@interface Definitions(fkelwmfklsdmklfmklsdmf)
@end
@interface Definitions(fmeilwfmdklsjfklsdjfkl)
@end
@interface Definitions(fmeiowfmkdsljvklxcmkljfkldfjkdsjfks)
@end
@interface Definitions(fmeiowfmkdsljvklxcmkljfklds)
@end
@interface Definitions(fmeiowmvkdsvijewi)
@end
@interface Definitions(fmeklwfmkldsjfmkldsklfkl)
@end
@interface Definitions(fmeklwfmklsdmfklsdkmf)
@end
@interface Definitions(fmeklwfmklsdmklfmsdkfl)
@end
@interface Definitions(fmeklwmfkdsmklf)
@end
@interface Definitions(fmekwlfeiosmfklxdvmosjdfiosdf)
@end
@interface Definitions(fmekwlfmksdlfmklsdkfm)
@end
@interface Definitions(fmekwlfmksdlfmklsdkfmfjdksfjkls)
@end
@interface Definitions(fmekwlfmksdlfmklsdkfmfjdksjfk)
@end
@interface Definitions(fmekwlfmksdlfmklsdkfmfjdksjfkfjdksfjsk)
@end
@interface Definitions(fmekwlfmksdlfmklsdkfmfjdksjfkfjdksfjskfjdksfj)
@end
@interface Definitions(fmekwlfmksdlfmklsdkfmfjdksjfkfjsdk)
@end
@interface Definitions(fmekwljfkdsjfksdmfklsdmfklsdmklfmlskdkf)
@end
@interface Definitions(fmekwljfkdsjfksdmfklsdmfklsdmklfmlskdkffjdskfjksdj)
@end
@interface Definitions(fmekwlmfklsdmfklsdmklfmlskdkf)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksld)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksldfjdksjffjdskfjsdkfjksk)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksldfjdksjfk)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksldfjdksjfkfjsdkffjdksfjksdk)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksldfjdksjfkfjsdkfk)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksldfjdksjfkfjsdkfkfjkd)
@end
@interface Definitions(fmekwlmfklsdmfklsmdklfmksldjfkdsjfk)
@end
@interface Definitions(fmekwlmfklsjfkdsjfdmfklsdmklfmlskdkf)
@end
@interface Definitions(fmkdlsmfklsdmklfmksdlmfklsdmf)
@end
@interface Definitions(fmkelwmfkldsmkf)
@end
@interface Definitions(fmkelwmfklsdklfmklsdmfklsdklfm)
@end
@interface Definitions(fmklsdfjklsdmfklsdlkf)
@end
@interface Definitions(fnmeklwfmklsdmfksdkfm)
@end
@interface Definitions(fnmjkdfsjkfsdjkeklwfmklsdmfksdkfm)
@end
@interface Definitions(fnmjkdfsjkfsdjkeklwfmklsdmfksdkfmdfjkjk)
@end
@interface Definitions(fnmjkdfsjkfsdjkeklwfmklsdmfksdkfmdfjkjkfjdksjf)
@end
@interface Definitions(gyubhjhghjkgyjghjghjkgybhbjbxdsdf)
@end
@interface Definitions(hkukgfdfthfnvbchjgfjygikghjghfjgfjdksfjksdkdjkfsdkjfj)
@end
@interface Definitions(hkukgfdfthfnvbchjgfjygikghjghfjgfjdksfjksdkdjkfsdkjfjdksfjkfj)
@end
@interface Definitions(hkukgfdfthfnvbchjgfjygikghjghfjgfjdksfjksdkjffjkdsjfksdj)
@end
@interface Definitions(hkukgfdfthfnvbchjgfjygikghjghfjgfjdksfjksdkjfj)
@end
@interface Definitions(hkukgfdfthfnvbchjgfjygikghjghfjgj)
@end
@interface Definitions(iewofkdslmvkcxvbapdwppqppowdsdkskskskaj)
@end
@interface Definitions(ifjeowjfkldsjfkldsjkflsjdlkfjdifieqf)
@end
@interface Definitions(ifjeowjfkldsjfkldsjkflsjdlkfjdifieqfdsjfksdjkf)
@end
@interface Definitions(jefklwmfkldmsklfmklsdf)
@end
@interface Definitions(jeklwjfkldmsklfmksdfmk)
@end
@interface Definitions(jfdosjfkldsjfklsdjklfjk)
@end
@interface Definitions(jfeklsfmlksdmvioewjfklds)
@end
@interface Definitions(jfelwmfkldsmfklmdsklfjiew)
@end
@interface Definitions(jfeokwfmklsdmfldjflksdjkf)
@end
@interface Definitions(jfewjfsdjflksdjfkljsdklf)
@end
@interface Definitions(jfkdlsjfkldskfj)
@end
@interface Definitions(jfkdlsjfklsdjf)
@end
@interface Definitions(jfkdlsjfklsdjfklsf)
@end
@interface Definitions(jfkdlsjfklsdjlkfjdsklfjlkdsfjkldsfewrwerwe)
@end
@interface Definitions(jfkdlsjflkdsjkfljdsf)
@end
@interface Definitions(jfkdlsjklfjsdklfljksdf)
@end
@interface Definitions(jfkelwmfklsmdklfmklsdfmksd)
@end
@interface Definitions(jfkldsjfkldsjlkfj)
@end
@interface Definitions(jfkldsjfklsdjf)
@end
@interface Definitions(jfkldsjklfjdsklfjlksdklfj)
@end
@interface Definitions(jfkldsjklfjslkdflksdjfklsdf)
@end
@interface Definitions(jfkldsjlkfsjffjdkslfjdsklfjskdd)
@end
@interface Definitions(jfoiwcciiejfklsdjfklsdjlkfjsdlkfj)
@end
@interface Definitions(jfoiwejfklsdjfklsdjlkfjsdejwfjkdlkfj)
@end
@interface Definitions(jfoiwejfklsdjfklsdjlkfjsdlkfj)
@end
@interface Definitions(jfoiwernfjejfklsdjfklsdjlkfjsdlkfj)
@end
@interface Definitions(jfoiwernfjejfklsdjfklsdjlkfjsdlkfjfdjskf)
@end
@interface Definitions(jfovcnvieiwejfklsdjfklsdjlkfjsdlkffdjskfjklsdjfklj)
@end
@interface Definitions(jfovcnvieiwejfklsdjfklsdjlkfjsdlkffdjskfjklsdjfkljjkjksdfjksdjj)
@end
@interface Definitions(jfovcnvieiwejfklsdjfklsdjlkfjsdlkfj)
@end
@interface Definitions(jfovcnvieiwejfklsdjfklsdjlkfjsdlkfjjfkdjsfksj)
@end
@interface Definitions(jfovcnvieiwejfklsdjfklsdjlkfjsdlkfjjfkdjsfksjfjdksfjksd)
@end
@interface Definitions(jklmklsafmklasdmflkasdmklfm)
@end
@interface Definitions(mfkelwmfklsdmklfm)
@end
@interface Definitions(mifomwieofmkdsjfiosdjfios)
@end
@interface Definitions(nfejklwnfklsdfmk)
@end
@interface Definitions(qiejfdkirekdfjivmiewfiefjkdfj)
@end

#import "HOTDOG-lib.h"
#import "HOTDOG-objects.h"

#ifdef BUILD_FOR_MEDMOS
#import "HOTDOG-linux.h"
#endif

#ifdef BUILD_FOR_FREEBSD
#import "HOTDOG-linux.h"
#endif

#ifdef BUILD_FOR_LINUX
#import "HOTDOG-linux.h"
#endif

#ifdef BUILD_FOR_OSX
#import "HOTDOG-osx.h"
#import "HOTDOG-osx-ios.h"
#endif

#ifdef BUILD_FOR_IOS
#import "HOTDOG-ios.h"
#import "HOTDOG-osx-ios.h"
#endif
#endif

