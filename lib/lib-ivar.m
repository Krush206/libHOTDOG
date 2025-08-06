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

#import "HOTDOG.h"

static union {
    id *ivarIdPtr;
    char *ivarCharPtr;
    Int4 *ivarInt4Ptr;
    int *ivarIntPtr;
    unsigned int *ivarUnsignedIntPtr;
    unsigned char *ivarUnsignedCharPtr;
    unsigned long *ivarUnsignedLongPtr;
    unsigned long long *ivarUnsignedLongLongPtr;
    long long *ivarLongLongPtr;
    double *ivarDoublePtr;
    _Bool *ivarBoolPtr;
    void **ivarVoidPtr;
} ivarPtr;

static union {
    id selfIdPtr,
       *selfIdPtrPtr;
    char *selfCharPtr;
} selfPtr;

#ifdef BUILD_FOUNDATION
#else
@implementation NSString(dsjfkljsdkfjsdlkjfk)
- (unsigned int)unsignedIntValue
{
    unsigned int val = [self intValue];
    return val;
}
@end
#endif

@implementation IvarObject

- (void)dealloc
{
    [self autoreleaseIvars];
    [super dealloc];
}

- (void)autoreleaseIvars
{
    static Class __NSObjectClass = nil;
    if (!__NSObjectClass) {
        __NSObjectClass = objc_getClass("NSObject");
        if (!__NSObjectClass) {
NSLog(@"ERROR! NSObject class not found");
            exit(0);
        }
    }

    Class cls = object_getClass(self);

    for (;;) {
        if (cls == __NSObjectClass) {
            break;
        }
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(cls, &outCount);
        if (ivars) {
            for (int i=0; i<outCount; i++) {
                char *type = ivar_getTypeEncoding(ivars[i]);
                if (*type == '@') {
                    char *ivarPtr;
		    id val;

		    selfPtr.selfIdPtr = self;
		    ivarPtr = selfPtr.selfCharPtr + ivar_getOffset(ivars[i]);
		    val = *selfPtr.selfIdPtrPtr;
                    if (val) {
                        [val autorelease];
                        *selfPtr.selfIdPtrPtr = 0;
                    }
                }
            }
            free(ivars);
        }
        cls = class_getSuperclass(cls);
    }
}
- (void)clearObjectIvars
{
    static Class __NSObjectClass = nil;
    if (!__NSObjectClass) {
        __NSObjectClass = objc_getClass("NSObject");
        if (!__NSObjectClass) {
NSLog(@"ERROR! NSObject class not found");
            exit(0);
        }
    }

    Class cls = object_getClass(self);

    for (;;) {
        if (cls == __NSObjectClass) {
            break;
        }
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(cls, &outCount);
        if (ivars) {
            for (int i=0; i<outCount; i++) {
                char *type = ivar_getTypeEncoding(ivars[i]);
                if (*type == '@') {
                    selfPtr.selfIdPtr = self;
                    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivars[i]);
                    *ivarPtr.ivarIdPtr = 0;
                }
            }
            free(ivars);
        }
        cls = class_getSuperclass(cls);
    }
}
- (void)setNilValueForKey:(id)key
{
    [self setValue:nil forIvar:key];
}

- (void)setValue:(id)val forKey:(id)key
{
    [self setValue:val forIvar:key];
}

- (void)setPointerValue:(void *)pointerval forKey:(id)key
{
    [self setPointerValue:pointerval forIvar:key];
}
- (void)setPointerValue:(void *)pointerval forIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
NSLog(@"setDoubleValue:forKey: unknown ivar '%s' self %@", ivarName, self);
        return;
    }
    char *ivarType = ivar_getTypeEncoding(ivar);
    selfPtr.selfIdPtr = self;
    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivar);
    if (ivarType[0] == '^') {
        *ivarPtr.ivarVoidPtr = pointerval;
    } else {
NSLog(@"setPointerValue:'%p' forKey:'%@' unhandled ivar type '%s'", pointerval, key, ivarType);
        exit(0);
    }
}
- (void)setDoubleValue:(double)doubleval forIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
NSLog(@"setDoubleValue:forKey: unknown ivar '%s' self %@", ivarName, self);
        return;
    }
    char *ivarType = ivar_getTypeEncoding(ivar);
    selfPtr.selfIdPtr = self;
    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivar);
    if (ivarType[0] == 'd') {
        *ivarPtr.ivarDoublePtr = doubleval;
    } else {
NSLog(@"setDoubleValue:'%f' forKey:'%@' unhandled ivar type '%s'", doubleval, key, ivarType);
        exit(0);
    }
}
- (void)setValue:(id)val forIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
NSLog(@"setValue:forKey: unknown ivar '%s' self %@", ivarName, self);
        return;
    }
    char *ivarType = ivar_getTypeEncoding(ivar);
    selfPtr.selfIdPtr = self;
    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivar);
    if (ivarType[0] == '@') {
        [val retain];
        [*ivarPtr.ivarIdPtr autorelease];
        *ivarPtr.ivarIdPtr = val;
    } else if (ivarType[0] == 'i') {
        int intval = [val intValue];
        *ivarPtr.ivarIntPtr = intval;
    } else if (ivarType[0] == 'I') {
        unsigned int uintval = [val unsignedIntValue];
        *ivarPtr.ivarUnsignedIntPtr = uintval;
    } else if (ivarType[0] == 'd') {
        double doubleval = [val doubleValue];
        *ivarPtr.ivarDoublePtr = doubleval;
    } else if (ivarType[0] == 'q') {
        long long longlongval = [val longLongValue];
        *ivarPtr.ivarLongLongPtr = longlongval;
    } else if (ivarType[0] == 'C') {
        unsigned char ucharval = [val unsignedCharValue];
        *ivarPtr.ivarUnsignedCharPtr = ucharval;
    } else if (ivarType[0] == 'c') {
        char charval = [val intValue];
        *ivarPtr.ivarCharPtr = charval;
    } else if (ivarType[0] == 'B') {
        int intval = [val intValue];
        if (intval) {
            *ivarPtr.ivarBoolPtr = 1;
        } else {
            *ivarPtr.ivarBoolPtr = 0;
        }
    } else if (ivarType[0] == 'Q') {
        unsigned long long unsignedlonglongval = [val unsignedLongLongValue];
        *ivarPtr.ivarUnsignedLongLongPtr = unsignedlonglongval;
    } else {
NSLog(@"setValue:'%@' forKey:'%@' unhandled ivar type '%s'", val, key, ivarType);
        exit(0);
    }
}
- (double)doubleValueForIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return 0.0;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
NSLog(@"doubleValueForIvar: unknown ivar '%s' self %@", ivarName, self);
        return 0.0;
    }
    char *ivarType = ivar_getTypeEncoding(ivar);
    selfPtr.selfIdPtr = self;
    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivar);
    if (ivarType[0] == 'd') {
        return *ivarPtr.ivarDoublePtr;
    } else {
NSLog(@"doubleValueForIvar:'%@' unhandled ivar type '%s'", key, ivarType);
        exit(0);
    }

    return 0.0;
}
- (BOOL)hasKey:(id)key
{
    return [self hasIvar:key];
}
- (id)valueForKey:(id)key
{
    return [self valueForIvar:key];
}
- (id)pointerValueForKey:(id)key
{
    return [self pointerValueForIvar:key];
}
- (void *)pointerValueForIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return NULL;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
//NSLog(@"valueForKey: unknown ivar '%s' self %@", ivarName, self);
        return NULL;
    }
    char *ivarType = ivar_getTypeEncoding(ivar);
    selfPtr.selfIdPtr = self;
    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivar);
    if (ivarType[0] == '^') {
        return *ivarPtr.ivarVoidPtr;
    } else {
NSLog(@"valueForIvar:'%@' unhandled ivar type '%s'", key, ivarType);
        exit(0);
    }

    return nil;
}
- (id)valueForIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return nil;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
//NSLog(@"valueForKey: unknown ivar '%s' self %@", ivarName, self);
        return nil;
    }
    char *ivarType = ivar_getTypeEncoding(ivar);
    selfPtr.selfIdPtr = self;
    ivarPtr.ivarCharPtr = selfPtr.selfCharPtr + ivar_getOffset(ivar);
    if (ivarType[0] == '@') {
        return *ivarPtr.ivarIdPtr;
    } else if (ivarType[0] == 'i') {
        return nsfmt(@"%d", *ivarPtr.ivarIntPtr);
    } else if (ivarType[0] == 'I') {
        return nsfmt(@"%u", *ivarPtr.ivarUnsignedIntPtr);
    } else if (ivarType[0] == 'd') {
        return nsfmt(@"%f", *ivarPtr.ivarDoublePtr);
    } else if (ivarType[0] == 'q') {
        return nsfmt(@"%lld", *ivarPtr.ivarLongLongPtr);
    } else if (ivarType[0] == 'C') {
        return nsfmt(@"%d", *ivarPtr.ivarUnsignedCharPtr);
    } else if (ivarType[0] == 'c') {
        return nsfmt(@"%d", *ivarPtr.ivarCharPtr);
    } else if (ivarType[0] == 'B') {
        return nsfmt(@"%d", *ivarPtr.ivarBoolPtr ? 1 : 0);
    } else if (!strcmp(ivarType, "{Int4=iiii}")) {
        Int4 *r = ivarPtr.ivarInt4Ptr;
        return nsfmt(@"%d %d %d %d", r->x, r->y, r->w, r->h);
    } else if (!strcmp(ivarType, "^d")) {
        return nsfmt(@"%p", ivarPtr.ivarCharPtr);
    } else if (ivarType[0] == 'L') {
        return nsfmt(@"%lu", *ivarPtr.ivarUnsignedLongPtr);
    } else if (ivarType[0] == 'Q') {
        return nsfmt(@"%llu", *ivarPtr.ivarUnsignedLongLongPtr);
    } else {
NSLog(@"valueForIvar:'%@' unhandled ivar type '%s'", key, ivarType);
        exit(0);
    }

    return nil;
}
- (BOOL)hasIvar:(id)key
{
    if ([key length] > 254) {
NSLog(@"key name '%@' too long", key);
        return NO;
    }
    char ivarName[256];
    sprintf(ivarName, "_%s", [key UTF8String]);
    void *outval = NULL;
    Ivar ivar = object_getInstanceVariable(self, ivarName, &outval);
    if (!ivar) {
//NSLog(@"valueForKey: unknown ivar '%s' self %@", ivarName, self);
        return NO;
    }
    return YES;
}
- (BOOL)writeStateToFile:(id)path
{
    char *cpath = [path UTF8String];
    FILE *fp = fopen(cpath, "w");
    if (!fp) {
        return NO;
    }
    Class c = object_getClass(self);
    Class sc = class_getSuperclass(c);
    int csize = class_getInstanceSize(c);
    int scsize = class_getInstanceSize(sc);
    char *p = self;
    p += scsize;
    int result = fwrite(p, csize-scsize, 1, fp);
    fclose(fp);
    if (result != 1) {
        return NO;
    }
    return YES;
}
- (BOOL)readStateFromFile:(id)path
{
    char *cpath = [path UTF8String];
    FILE *fp = fopen(cpath, "r");
    if (!fp) {
        return NO;
    }
    [self autoreleaseIvars];
    Class c = object_getClass(self);
    Class sc = class_getSuperclass(c);
    int csize = class_getInstanceSize(c);
    int scsize = class_getInstanceSize(sc);
    char *p = self;
    p += scsize;
    int result = fread(p, csize-scsize, 1, fp);
    fclose(fp);
    [self clearObjectIvars];
    if (result != 1) {
        return NO;
    }
    return YES;
}
@end

