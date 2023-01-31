//
//  Example
//  man.li
//
//  Created by man.li on 11/11/2018.
//  Copyright © 2020 man.li. All rights reserved.
//

#if !defined(_GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define _GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if _GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <protobuf/_GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "_GPBProtocolBuffers_RuntimeSupport.h"
#endif

#if _GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <protobuf/Any.pbobjc.h>
#else
 #import "_Any.pbobjc.h"
#endif
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - _GPBAnyRoot

@implementation _GPBAnyRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - _GPBAnyRoot_FileDescriptor

static _GPBFileDescriptor *_GPBAnyRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static _GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    _GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[_GPBFileDescriptor alloc] initWithPackage:@"google.protobuf"
                                                 objcPrefix:@"_GPB"
                                                     syntax:_GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - _GPBAny

@implementation _GPBAny

@dynamic typeURL;
@dynamic value;

typedef struct _GPBAny__storage_ {
  uint32_t _has_storage_[1];
  NSString *typeURL;
  NSData *value;
} _GPBAny__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (_GPBDescriptor *)descriptor {
  static _GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static _GPBMessageFieldDescription fields[] = {
      {
        .name = "typeURL",
        .dataTypeSpecific.className = NULL,
        .number = _GPBAny_FieldNumber_TypeURL,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(_GPBAny__storage_, typeURL),
        .flags = (_GPBFieldFlags)(_GPBFieldOptional | _GPBFieldTextFormatNameCustom),
        .dataType = _GPBDataTypeString,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = _GPBAny_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(_GPBAny__storage_, value),
        .flags = _GPBFieldOptional,
        .dataType = _GPBDataTypeBytes,
      },
    };
    _GPBDescriptor *localDescriptor =
        [_GPBDescriptor allocDescriptorForClass:[_GPBAny class]
                                     rootClass:[_GPBAnyRoot class]
                                          file:_GPBAnyRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(_GPBMessageFieldDescription))
                                   storageSize:sizeof(_GPBAny__storage_)
                                         flags:_GPBDescriptorInitializationFlag_None];
#if !_GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\004\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !_GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
