#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "base64.h"
#import "NSData+SRB64Additions.h"
#import "SRWebSocket.h"

FOUNDATION_EXPORT double SocketRocketVersionNumber;
FOUNDATION_EXPORT const unsigned char SocketRocketVersionString[];

