/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.core_43;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_array_of_arrays
enum ARB_array_of_arrays = "GL_ARB_array_of_arrays";
enum arbArrayOfArraysLoader = makeLoader(ARB_array_of_arrays, "", "gl43");
static if(!usingContexts) enum arbArrayOfArrays = arbArrayOfArraysLoader;

// ARB_clear_buffer_object
enum ARB_clear_buffer_object = "GL_ARB_clear_buffer_object";
enum arbClearBufferObjectDecls =
q{
extern(System) @nogc nothrow {
    alias da_glClearBufferData = void function(GLenum,GLenum,GLenum,GLenum,const(void)*);
    alias da_glClearBufferSubData = void function(GLenum,GLenum,GLintptr,GLsizeiptr,GLenum,GLenum,const(void)*);
    alias da_glClearNamedBufferDataEXT = void function(GLuint,GLenum,GLenum,GLenum,const(void)*);
    alias da_glClearNamedBufferSubDataEXT = void function(GLuint,GLenum,GLenum,GLenum,GLsizeiptr,GLsizeiptr,const(void)*);
}};

enum arbClearBufferObjectFuncs =
q{
    da_glClearBufferData glClearBufferData;
    da_glClearBufferSubData glClearBufferSubData;
    da_glClearNamedBufferDataEXT glClearNamedBufferDataEXT;
    da_glClearNamedBufferSubDataEXT glClearNamedBufferSubDataEXT;
};

enum arbClearBufferObjectLoaderImpl =
q{
    bindGLFunc(cast(void**)&glClearBufferData, "glClearBufferData");
    bindGLFunc(cast(void**)&glClearBufferSubData, "glClearBufferSubData");
    try {
        bindGLFunc(cast(void**)&glClearNamedBufferDataEXT, "glClearNamedBufferDataEXT");
        bindGLFunc(cast(void**)&glClearNamedBufferSubDataEXT, "glClearNamedBufferSubDataEXT");
    }
    catch(Exception e) {}
};

enum arbClearBufferObjectLoader = makeLoader(ARB_clear_buffer_object, arbClearBufferObjectLoaderImpl, "gl43");
static if(!usingContexts) enum arbClearBufferObject = arbClearBufferObjectDecls ~ arbClearBufferObjectFuncs.makeGShared() ~ arbClearBufferObjectLoader;

// ARB_compute_shader
enum ARB_compute_shader = "GL_ARB_compute_shader";
enum arbComputeShaderDecls =
q{
enum : uint
{
    GL_COMPUTE_SHADER                 = 0x91B9,
    GL_MAX_COMPUTE_UNIFORM_BLOCKS     = 0x91BB,
    GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS = 0x91BC,
    GL_MAX_COMPUTE_IMAGE_UNIFORMS     = 0x91BD,
    GL_MAX_COMPUTE_SHARED_MEMORY_SIZE = 0x8262,
    GL_MAX_COMPUTE_UNIFORM_COMPONENTS = 0x8263,
    GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = 0x8264,
    GL_MAX_COMPUTE_ATOMIC_COUNTERS    = 0x8265,
    GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = 0x8266,
    GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS  = 0x90EB,
    GL_MAX_COMPUTE_WORK_GROUP_COUNT   = 0x91BE,
    GL_MAX_COMPUTE_WORK_GROUP_SIZE    = 0x91BF,
    GL_COMPUTE_WORK_GROUP_SIZE        = 0x8267,
    GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER = 0x90EC,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER = 0x90ED,
    GL_DISPATCH_INDIRECT_BUFFER       = 0x90EE,
    GL_DISPATCH_INDIRECT_BUFFER_BINDING = 0x90EF,
    GL_COMPUTE_SHADER_BIT             = 0x00000020,
}
extern(System) @nogc nothrow {
    alias da_glDispatchCompute = void function(GLuint,GLuint,GLuint);
    alias da_glDispatchComputeIndirect = void function(GLintptr);
}};

enum arbComputeShaderFuncs =
q{
    da_glDispatchCompute glDispatchCompute;
    da_glDispatchComputeIndirect glDispatchComputeIndirect;
};
enum arbComputeShaderLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDispatchCompute, "glDispatchCompute");
    bindGLFunc(cast(void**)&glDispatchComputeIndirect, "glDispatchComputeIndirect");
};

enum arbComputeShaderLoader = makeLoader(ARB_compute_shader, arbComputeShaderLoaderImpl, "gl43");
static if(!usingContexts) enum arbComputeShader = arbComputeShaderDecls ~ arbComputeShaderFuncs.makeGShared() ~ arbComputeShaderLoader;

// ARB_copy_image
enum ARB_copy_image = "GL_ARB_copy_image";
enum arbCopyImageDecls = `extern(System) @nogc nothrow alias da_glCopyImageSubData = void function(GLuint,GLenum,GLint,GLint,GLint,GLint,GLuint,GLenum,GLint,GLint,GLint,GLint,GLsizei,GLsizei,GLsizei);`;
enum arbCopyImageFuncs = `da_glCopyImageSubData glCopyImageSubData;`;
enum arbCopyImageLoaderImpl = `bindGLFunc(cast(void**)&glCopyImageSubData, "glCopyImageSubData");`;

enum arbCopyImageLoader = makeLoader(ARB_copy_image, arbCopyImageLoaderImpl, "gl43");
static if(!usingContexts) enum arbCopyImage = arbCopyImageDecls ~ arbCopyImageFuncs.makeGShared() ~ arbCopyImageLoader;

// KHR_debug
enum KHR_debug = "GL_KHR_debug";
enum khrDebugDecls =
q{
enum : uint
{
    GL_DEBUG_OUTPUT_SYNCHRONOUS       = 0x8242,
    GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = 0x8243,
    GL_DEBUG_CALLBACK_FUNCTION        = 0x8244,
    GL_DEBUG_CALLBACK_USER_PARAM      = 0x8245,
    GL_DEBUG_SOURCE_API               = 0x8246,
    GL_DEBUG_SOURCE_WINDOW_SYSTEM     = 0x8247,
    GL_DEBUG_SOURCE_SHADER_COMPILER   = 0x8248,
    GL_DEBUG_SOURCE_THIRD_PARTY       = 0x8249,
    GL_DEBUG_SOURCE_APPLICATION       = 0x824A,
    GL_DEBUG_SOURCE_OTHER             = 0x824B,
    GL_DEBUG_TYPE_ERROR               = 0x824C,
    GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR = 0x824D,
    GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR  = 0x824E,
    GL_DEBUG_TYPE_PORTABILITY         = 0x824F,
    GL_DEBUG_TYPE_PERFORMANCE         = 0x8250,
    GL_DEBUG_TYPE_OTHER               = 0x8251,
    GL_DEBUG_TYPE_MARKER              = 0x8268,
    GL_DEBUG_TYPE_PUSH_GROUP          = 0x8269,
    GL_DEBUG_TYPE_POP_GROUP           = 0x826A,
    GL_DEBUG_SEVERITY_NOTIFICATION    = 0x826B,
    GL_MAX_DEBUG_GROUP_STACK_DEPTH    = 0x826C,
    GL_DEBUG_GROUP_STACK_DEPTH        = 0x826D,
    GL_BUFFER                         = 0x82E0,
    GL_SHADER                         = 0x82E1,
    GL_PROGRAM                        = 0x82E2,
    GL_QUERY                          = 0x82E3,
    GL_PROGRAM_PIPELINE               = 0x82E4,
    GL_SAMPLER                        = 0x82E6,
    GL_DISPLAY_LIST                   = 0x82E7,
    GL_MAX_LABEL_LENGTH               = 0x82E8,
    GL_MAX_DEBUG_MESSAGE_LENGTH       = 0x9143,
    GL_MAX_DEBUG_LOGGED_MESSAGES      = 0x9144,
    GL_DEBUG_LOGGED_MESSAGES          = 0x9145,
    GL_DEBUG_SEVERITY_HIGH            = 0x9146,
    GL_DEBUG_SEVERITY_MEDIUM          = 0x9147,
    GL_DEBUG_SEVERITY_LOW             = 0x9148,
    GL_DEBUG_OUTPUT                   = 0x92E0,
    GL_CONTEXT_FLAG_DEBUG_BIT         = 0x00000002,
}
extern(System) nothrow alias GLDEBUGPROC = void function(GLenum,GLenum,GLuint,GLenum,GLsizei,const(GLchar)*,GLvoid*);
extern(System) @nogc nothrow {
    alias da_glDebugMessageControl = void function(GLenum,GLenum,GLenum,GLsizei,const(GLuint*),GLboolean);
    alias da_glDebugMessageInsert = void function(GLenum,GLenum,GLuint,GLenum,GLsizei,const(GLchar)*);
    alias da_glDebugMessageCallback = void function(GLDEBUGPROC,const(void)*);
    alias da_glGetDebugMessageLog = GLuint function(GLuint,GLsizei,GLenum*,GLenum*,GLuint*,GLenum*,GLsizei*,GLchar*);
    alias da_glPushDebugGroup = void function(GLenum,GLuint,GLsizei,const(GLchar)*);
    alias da_glPopDebugGroup = void function();
    alias da_glObjectLabel = void function(GLenum,GLuint,GLsizei,GLsizei,const(GLchar)*);
    alias da_glGetObjectLabel = void function(GLenum,GLuint,GLsizei,GLsizei*,GLchar*);
    alias da_glObjectPtrLabel = void function(const(void)*,GLsizei,const(GLchar)*);
    alias da_glGetObjectPtrLabel = void function(const(void)*,GLsizei,GLsizei*,GLchar*);
}};

enum khrDebugFuncs =
q{
    da_glDebugMessageControl glDebugMessageControl;
    da_glDebugMessageInsert glDebugMessageInsert;
    da_glDebugMessageCallback glDebugMessageCallback;
    da_glGetDebugMessageLog glGetDebugMessageLog;
    da_glPushDebugGroup glPushDebugGroup;
    da_glPopDebugGroup glPopDebugGroup;
    da_glObjectLabel glObjectLabel;
    da_glGetObjectLabel glGetObjectLabel;
    da_glObjectPtrLabel glObjectPtrLabel;
    da_glGetObjectPtrLabel glGetObjectPtrLabel;
};

enum khrDebugLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDebugMessageControl, "glDebugMessageControl");
    bindGLFunc(cast(void**)&glDebugMessageInsert, "glDebugMessageInsert");
    bindGLFunc(cast(void**)&glDebugMessageCallback, "glDebugMessageCallback");
    bindGLFunc(cast(void**)&glGetDebugMessageLog, "glGetDebugMessageLog");
    bindGLFunc(cast(void**)&glPushDebugGroup, "glPushDebugGroup");
    bindGLFunc(cast(void**)&glPopDebugGroup, "glPopDebugGroup");
    bindGLFunc(cast(void**)&glObjectLabel, "glObjectLabel");
    bindGLFunc(cast(void**)&glGetObjectLabel, "glGetObjectLabel");
    bindGLFunc(cast(void**)&glObjectPtrLabel, "glObjectPtrLabel");
    bindGLFunc(cast(void**)&glGetObjectPtrLabel, "glGetObjectPtrLabel");
};

enum khrDebugLoader = makeLoader(KHR_debug, khrDebugLoaderImpl, "gl43");
static if(!usingContexts) enum khrDebug = khrDebugDecls ~ khrDebugFuncs.makeGShared() ~ khrDebugLoader;


// ARB_ES3_compatibility
enum ARB_ES3_compatibility = "GL_ARB_ES3_compatibility";
enum arbES3CompatibilityDecls =
q{
enum : uint
{
    GL_COMPRESSED_RGB8_ETC2           = 0x9274,
    GL_COMPRESSED_SRGB8_ETC2          = 0x9275,
    GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276,
    GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277,
    GL_COMPRESSED_RGBA8_ETC2_EAC      = 0x9278,
    GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279,
    GL_COMPRESSED_R11_EAC             = 0x9270,
    GL_COMPRESSED_SIGNED_R11_EAC      = 0x9271,
    GL_COMPRESSED_RG11_EAC            = 0x9272,
    GL_COMPRESSED_SIGNED_RG11_EAC     = 0x9273,
    GL_PRIMITIVE_RESTART_FIXED_INDEX  = 0x8D69,
    GL_ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A,
    GL_MAX_ELEMENT_INDEX              = 0x8D6B,
}};

enum arbES3CompatibilityLoader = makeLoader(ARB_ES3_compatibility, "", "gl43");
static if(!usingContexts) enum arbES3Compatibility = arbES3CompatibilityDecls ~ arbES3CompatibilityLoader;

// ARB_framebuffer_no_attachments
enum ARB_framebuffer_no_attachments = "GL_ARB_framebuffer_no_attachments";
enum arbFramebufferNoAttachmentsDecls =
q{
enum : uint
{
    GL_FRAMEBUFFER_DEFAULT_WIDTH      = 0x9310,
    GL_FRAMEBUFFER_DEFAULT_HEIGHT     = 0x9311,
    GL_FRAMEBUFFER_DEFAULT_LAYERS     = 0x9312,
    GL_FRAMEBUFFER_DEFAULT_SAMPLES    = 0x9313,
    GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 0x9314,
    GL_MAX_FRAMEBUFFER_WIDTH          = 0x9315,
    GL_MAX_FRAMEBUFFER_HEIGHT         = 0x9316,
    GL_MAX_FRAMEBUFFER_LAYERS         = 0x9317,
    GL_MAX_FRAMEBUFFER_SAMPLES        = 0x9318,
}
extern(System) @nogc nothrow
{
    alias da_glFramebufferParameteri = void function(GLenum,GLenum,GLint);
    alias da_glGetFramebufferParameteriv = void function(GLenum,GLenum,GLint*);
    alias da_glNamedFramebufferParameteriEXT = void function(GLuint,GLenum,GLint);
    alias da_glGetNamedFramebufferParameterivEXT = void function(GLuint,GLenum,GLint*);
}};

enum arbFramebufferNoAttachmentsFuncs =
q{
    da_glFramebufferParameteri glFramebufferParameteri;
    da_glGetFramebufferParameteriv glGetFramebufferParameteriv;
    da_glNamedFramebufferParameteriEXT glNamedFramebufferParameteriEXT;
    da_glGetNamedFramebufferParameterivEXT glGetNamedFramebufferParameterivEXT;
};

enum arbFramebufferNoAttachmentsLoaderImpl =
q{
    bindGLFunc(cast(void**)&glFramebufferParameteri, "glFramebufferParameteri");
    bindGLFunc(cast(void**)&glGetFramebufferParameteriv, "glGetFramebufferParameteriv");
    try {
        bindGLFunc(cast(void**)&glNamedFramebufferParameteriEXT, "glNamedFramebufferParameteriEXT");
        bindGLFunc(cast(void**)&glGetNamedFramebufferParameterivEXT, "glGetNamedFramebufferParameterivEXT");
    }
    catch(Exception e) {}
};

enum arbFramebufferNoAttachmentsLoader = makeLoader(ARB_framebuffer_no_attachments, arbFramebufferNoAttachmentsLoaderImpl, "gl43");
static if(!usingContexts) enum arbFramebufferNoAttachments = arbFramebufferNoAttachmentsDecls ~ arbFramebufferNoAttachmentsFuncs.makeGShared() ~ arbFramebufferNoAttachmentsLoader;

// ARB_internalformat_query2
enum ARB_internalformat_query2 = "GL_ARB_internalformat_query2";
enum arbInternalFormatQuery2Decls =
q{
enum : uint
{
    GL_INTERNALFORMAT_SUPPORTED       = 0x826F,
    GL_INTERNALFORMAT_PREFERRED       = 0x8270,
    GL_INTERNALFORMAT_RED_SIZE        = 0x8271,
    GL_INTERNALFORMAT_GREEN_SIZE      = 0x8272,
    GL_INTERNALFORMAT_BLUE_SIZE       = 0x8273,
    GL_INTERNALFORMAT_ALPHA_SIZE      = 0x8274,
    GL_INTERNALFORMAT_DEPTH_SIZE      = 0x8275,
    GL_INTERNALFORMAT_STENCIL_SIZE    = 0x8276,
    GL_INTERNALFORMAT_SHARED_SIZE     = 0x8277,
    GL_INTERNALFORMAT_RED_TYPE        = 0x8278,
    GL_INTERNALFORMAT_GREEN_TYPE      = 0x8279,
    GL_INTERNALFORMAT_BLUE_TYPE       = 0x827A,
    GL_INTERNALFORMAT_ALPHA_TYPE      = 0x827B,
    GL_INTERNALFORMAT_DEPTH_TYPE      = 0x827C,
    GL_INTERNALFORMAT_STENCIL_TYPE    = 0x827D,
    GL_MAX_WIDTH                      = 0x827E,
    GL_MAX_HEIGHT                     = 0x827F,
    GL_MAX_DEPTH                      = 0x8280,
    GL_MAX_LAYERS                     = 0x8281,
    GL_MAX_COMBINED_DIMENSIONS        = 0x8282,
    GL_COLOR_COMPONENTS               = 0x8283,
    GL_DEPTH_COMPONENTS               = 0x8284,
    GL_STENCIL_COMPONENTS             = 0x8285,
    GL_COLOR_RENDERABLE               = 0x8286,
    GL_DEPTH_RENDERABLE               = 0x8287,
    GL_STENCIL_RENDERABLE             = 0x8288,
    GL_FRAMEBUFFER_RENDERABLE         = 0x8289,
    GL_FRAMEBUFFER_RENDERABLE_LAYERED = 0x828A,
    GL_FRAMEBUFFER_BLEND              = 0x828B,
    GL_READ_PIXELS                    = 0x828C,
    GL_READ_PIXELS_FORMAT             = 0x828D,
    GL_READ_PIXELS_TYPE               = 0x828E,
    GL_TEXTURE_IMAGE_FORMAT           = 0x828F,
    GL_TEXTURE_IMAGE_TYPE             = 0x8290,
    GL_GET_TEXTURE_IMAGE_FORMAT       = 0x8291,
    GL_GET_TEXTURE_IMAGE_TYPE         = 0x8292,
    GL_MIPMAP                         = 0x8293,
    GL_MANUAL_GENERATE_MIPMAP         = 0x8294,
    GL_AUTO_GENERATE_MIPMAP           = 0x8295,
    GL_COLOR_ENCODING                 = 0x8296,
    GL_SRGB_READ                      = 0x8297,
    GL_SRGB_WRITE                     = 0x8298,
    GL_SRGB_DECODE_ARB                = 0x8299,
    GL_FILTER                         = 0x829A,
    GL_VERTEX_TEXTURE                 = 0x829B,
    GL_TESS_CONTROL_TEXTURE           = 0x829C,
    GL_TESS_EVALUATION_TEXTURE        = 0x829D,
    GL_GEOMETRY_TEXTURE               = 0x829E,
    GL_FRAGMENT_TEXTURE               = 0x829F,
    GL_COMPUTE_TEXTURE                = 0x82A0,
    GL_TEXTURE_SHADOW                 = 0x82A1,
    GL_TEXTURE_GATHER                 = 0x82A2,
    GL_TEXTURE_GATHER_SHADOW          = 0x82A3,
    GL_SHADER_IMAGE_LOAD              = 0x82A4,
    GL_SHADER_IMAGE_STORE             = 0x82A5,
    GL_SHADER_IMAGE_ATOMIC            = 0x82A6,
    GL_IMAGE_TEXEL_SIZE               = 0x82A7,
    GL_IMAGE_COMPATIBILITY_CLASS      = 0x82A8,
    GL_IMAGE_PIXEL_FORMAT             = 0x82A9,
    GL_IMAGE_PIXEL_TYPE               = 0x82AA,
    GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST = 0x82AC,
    GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST = 0x82AD,
    GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE = 0x82AE,
    GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE = 0x82AF,
    GL_TEXTURE_COMPRESSED_BLOCK_WIDTH = 0x82B1,
    GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT = 0x82B2,
    GL_TEXTURE_COMPRESSED_BLOCK_SIZE  = 0x82B3,
    GL_CLEAR_BUFFER                   = 0x82B4,
    GL_TEXTURE_VIEW                   = 0x82B5,
    GL_VIEW_COMPATIBILITY_CLASS       = 0x82B6,
    GL_FULL_SUPPORT                   = 0x82B7,
    GL_CAVEAT_SUPPORT                 = 0x82B8,
    GL_IMAGE_CLASS_4_X_32             = 0x82B9,
    GL_IMAGE_CLASS_2_X_32             = 0x82BA,
    GL_IMAGE_CLASS_1_X_32             = 0x82BB,
    GL_IMAGE_CLASS_4_X_16             = 0x82BC,
    GL_IMAGE_CLASS_2_X_16             = 0x82BD,
    GL_IMAGE_CLASS_1_X_16             = 0x82BE,
    GL_IMAGE_CLASS_4_X_8              = 0x82BF,
    GL_IMAGE_CLASS_2_X_8              = 0x82C0,
    GL_IMAGE_CLASS_1_X_8              = 0x82C1,
    GL_IMAGE_CLASS_11_11_10           = 0x82C2,
    GL_IMAGE_CLASS_10_10_10_2         = 0x82C3,
    GL_VIEW_CLASS_128_BITS            = 0x82C4,
    GL_VIEW_CLASS_96_BITS             = 0x82C5,
    GL_VIEW_CLASS_64_BITS             = 0x82C6,
    GL_VIEW_CLASS_48_BITS             = 0x82C7,
    GL_VIEW_CLASS_32_BITS             = 0x82C8,
    GL_VIEW_CLASS_24_BITS             = 0x82C9,
    GL_VIEW_CLASS_16_BITS             = 0x82CA,
    GL_VIEW_CLASS_8_BITS              = 0x82CB,
    GL_VIEW_CLASS_S3TC_DXT1_RGB       = 0x82CC,
    GL_VIEW_CLASS_S3TC_DXT1_RGBA      = 0x82CD,
    GL_VIEW_CLASS_S3TC_DXT3_RGBA      = 0x82CE,
    GL_VIEW_CLASS_S3TC_DXT5_RGBA      = 0x82CF,
    GL_VIEW_CLASS_RGTC1_RED           = 0x82D0,
    GL_VIEW_CLASS_RGTC2_RG            = 0x82D1,
    GL_VIEW_CLASS_BPTC_UNORM          = 0x82D2,
    GL_VIEW_CLASS_BPTC_FLOAT          = 0x82D3,
}
extern(System) @nogc nothrow alias da_glGetInternalformati64v = void function(GLenum,GLenum,GLenum,GLsizei,GLint64*);
};

enum arbInternalFormatQuery2Funcs = `da_glGetInternalformati64v glGetInternalformati64v;`;
enum arbInternalFormatQuery2LoaderImpl = `bindGLFunc(cast(void**)&glGetInternalformati64v, "glGetInternalformati64v");`;
enum arbInternalFormatQuery2Loader = makeLoader(ARB_internalformat_query2, arbInternalFormatQuery2LoaderImpl, "gl43");
static if(!usingContexts) enum arbInternalFormatQuery2 = arbInternalFormatQuery2Decls ~ arbInternalFormatQuery2Funcs.makeGShared() ~ arbInternalFormatQuery2Loader;

// ARB_invalidate_subdata
enum ARB_invalidate_subdata = "GL_ARB_invalidate_subdata";
enum arbInvalidateSubdataDecls =
q{
extern(System) @nogc nothrow {
    alias da_glInvalidateTexSubImage = void function(GLuint,GLint,GLint,GLint,GLint,GLsizei,GLsizei,GLsizei);
    alias da_glInvalidateTexImage = void function(GLuint,GLint);
    alias da_glInvalidateBufferSubData = void function(GLuint,GLintptr,GLsizeiptr);
    alias da_glInvalidateBufferData = void function(GLuint);
    alias da_glInvalidateFramebuffer = void function(GLenum,GLsizei,const(GLenum)*);
    alias da_glInvalidateSubFramebuffer = void function(GLenum,GLsizei,const(GLenum)*,GLint,GLint,GLsizei,GLsizei);
}};

enum arbInvalidateSubdataFuncs =
q{
    da_glInvalidateTexSubImage glInvalidateTexSubImage;
    da_glInvalidateTexImage glInvalidateTexImage;
    da_glInvalidateBufferSubData glInvalidateBufferSubData;
    da_glInvalidateBufferData glInvalidateBufferData;
    da_glInvalidateFramebuffer glInvalidateFramebuffer;
    da_glInvalidateSubFramebuffer glInvalidateSubFramebuffer;
};

enum arbInvalidateSubdataLoaderImpl =
q{
    bindGLFunc(cast(void**)&glInvalidateTexSubImage, "glInvalidateTexSubImage");
    bindGLFunc(cast(void**)&glInvalidateTexImage, "glInvalidateTexImage");
    bindGLFunc(cast(void**)&glInvalidateBufferSubData, "glInvalidateBufferSubData");
    bindGLFunc(cast(void**)&glInvalidateBufferData, "glInvalidateBufferData");
    bindGLFunc(cast(void**)&glInvalidateFramebuffer, "glInvalidateFramebuffer");
    bindGLFunc(cast(void**)&glInvalidateSubFramebuffer, "glInvalidateSubFramebuffer");
};

enum arbInvalidateSubdataLoader = makeLoader(ARB_invalidate_subdata, arbInvalidateSubdataLoaderImpl, "gl43");
static if(!usingContexts) enum arbInvalidateSubdata = arbInvalidateSubdataDecls ~ arbInvalidateSubdataFuncs.makeGShared() ~ arbInvalidateSubdataLoader;

// ARB_multi_draw_indirect
enum ARB_multi_draw_indirect = "GL_ARB_multi_draw_indirect";
enum arbMultiDrawIndirectDecls =
q{
extern(System) @nogc nothrow {
    alias da_glMultiDrawArraysIndirect = void function(GLenum,const(void)*,GLsizei,GLsizei);
    alias da_glMultiDrawElementsIndirect = void function(GLenum,GLenum,const(void)*,GLsizei,GLsizei);
}};

enum arbMultiDrawIndirectFuncs =
q{
    da_glMultiDrawArraysIndirect glMultiDrawArraysIndirect;
    da_glMultiDrawElementsIndirect glMultiDrawElementsIndirect;
};

enum arbMultiDrawIndirectLoaderImpl =
q{
    bindGLFunc(cast(void**)&glMultiDrawArraysIndirect, "glMultiDrawArraysIndirect");
    bindGLFunc(cast(void**)&glMultiDrawElementsIndirect, "glMultiDrawElementsIndirect");
};

enum arbMultiDrawIndirectLoader = makeLoader(ARB_multi_draw_indirect, arbMultiDrawIndirectLoaderImpl, "gl43");
static if(!usingContexts) enum arbMultiDrawIndirect = arbMultiDrawIndirectDecls ~ arbMultiDrawIndirectFuncs.makeGShared() ~ arbMultiDrawIndirectLoader;

// ARB_program_interface_query
enum ARB_program_interface_query = "GL_ARB_program_interface_query";
enum arbProgramInterfaceQueryDecls =
q{
enum : uint
{
    GL_UNIFORM                        = 0x92E1,
    GL_UNIFORM_BLOCK                  = 0x92E2,
    GL_PROGRAM_INPUT                  = 0x92E3,
    GL_PROGRAM_OUTPUT                 = 0x92E4,
    GL_BUFFER_VARIABLE                = 0x92E5,
    GL_SHADER_STORAGE_BLOCK           = 0x92E6,
    GL_VERTEX_SUBROUTINE              = 0x92E8,
    GL_TESS_CONTROL_SUBROUTINE        = 0x92E9,
    GL_TESS_EVALUATION_SUBROUTINE     = 0x92EA,
    GL_GEOMETRY_SUBROUTINE            = 0x92EB,
    GL_FRAGMENT_SUBROUTINE            = 0x92EC,
    GL_COMPUTE_SUBROUTINE             = 0x92ED,
    GL_VERTEX_SUBROUTINE_UNIFORM      = 0x92EE,
    GL_TESS_CONTROL_SUBROUTINE_UNIFORM = 0x92EF,
    GL_TESS_EVALUATION_SUBROUTINE_UNIFORM = 0x92F0,
    GL_GEOMETRY_SUBROUTINE_UNIFORM    = 0x92F1,
    GL_FRAGMENT_SUBROUTINE_UNIFORM    = 0x92F2,
    GL_COMPUTE_SUBROUTINE_UNIFORM     = 0x92F3,
    GL_TRANSFORM_FEEDBACK_VARYING     = 0x92F4,
    GL_ACTIVE_RESOURCES               = 0x92F5,
    GL_MAX_NAME_LENGTH                = 0x92F6,
    GL_MAX_NUM_ACTIVE_VARIABLES       = 0x92F7,
    GL_MAX_NUM_COMPATIBLE_SUBROUTINES = 0x92F8,
    GL_NAME_LENGTH                    = 0x92F9,
    GL_TYPE                           = 0x92FA,
    GL_ARRAY_SIZE                     = 0x92FB,
    GL_OFFSET                         = 0x92FC,
    GL_BLOCK_INDEX                    = 0x92FD,
    GL_ARRAY_STRIDE                   = 0x92FE,
    GL_MATRIX_STRIDE                  = 0x92FF,
    GL_IS_ROW_MAJOR                   = 0x9300,
    GL_ATOMIC_COUNTER_BUFFER_INDEX    = 0x9301,
    GL_BUFFER_BINDING                 = 0x9302,
    GL_BUFFER_DATA_SIZE               = 0x9303,
    GL_NUM_ACTIVE_VARIABLES           = 0x9304,
    GL_ACTIVE_VARIABLES               = 0x9305,
    GL_REFERENCED_BY_VERTEX_SHADER    = 0x9306,
    GL_REFERENCED_BY_TESS_CONTROL_SHADER = 0x9307,
    GL_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x9308,
    GL_REFERENCED_BY_GEOMETRY_SHADER  = 0x9309,
    GL_REFERENCED_BY_FRAGMENT_SHADER  = 0x930A,
    GL_REFERENCED_BY_COMPUTE_SHADER   = 0x930B,
    GL_TOP_LEVEL_ARRAY_SIZE           = 0x930C,
    GL_TOP_LEVEL_ARRAY_STRIDE         = 0x930D,
    GL_LOCATION                       = 0x930E,
    GL_LOCATION_INDEX                 = 0x930F,
    GL_IS_PER_PATCH                   = 0x92E7,
}
extern(System) @nogc nothrow
{
    alias da_glGetProgramInterfaceiv = void function(GLuint,GLenum,GLenum,GLint*);
    alias da_glGetProgramResourceIndex = GLuint function(GLuint,GLenum,const(GLchar)*);
    alias da_glGetProgramResourceName = void function(GLuint,GLenum,GLuint,GLsizei,GLsizei*,GLchar*);
    alias da_glGetProgramResourceiv = void function(GLuint,GLenum,GLuint,GLsizei,const(GLenum)*,GLsizei,GLsizei*,GLint*);
    alias da_glGetProgramResourceLocation = GLint function(GLuint,GLenum,const(GLchar)*);
    alias da_glGetProgramResourceLocationIndex = GLint function(GLuint,GLenum,const(GLchar)*);
}};

enum arbProgramInterfaceQueryFuncs =
q{
    da_glGetProgramInterfaceiv glGetProgramInterfaceiv;
    da_glGetProgramResourceIndex glGetProgramResourceIndex;
    da_glGetProgramResourceName glGetProgramResourceName;
    da_glGetProgramResourceiv glGetProgramResourceiv;
    da_glGetProgramResourceLocation glGetProgramResourceLocation;
    da_glGetProgramResourceLocationIndex glGetProgramResourceLocationIndex;
};

enum arbProgramInterfaceQueryLoaderImpl =
q{
    bindGLFunc(cast(void**)&glGetProgramInterfaceiv, "glGetProgramInterfaceiv");
    bindGLFunc(cast(void**)&glGetProgramResourceIndex, "glGetProgramResourceIndex");
    bindGLFunc(cast(void**)&glGetProgramResourceName, "glGetProgramResourceName");
    bindGLFunc(cast(void**)&glGetProgramResourceiv, "glGetProgramResourceiv");
    bindGLFunc(cast(void**)&glGetProgramResourceLocation, "glGetProgramResourceLocation");
    bindGLFunc(cast(void**)&glGetProgramResourceLocationIndex, "glGetProgramResourceLocationIndex");
};

enum arbProgramInterfaceQueryLoader = makeLoader(ARB_program_interface_query, arbProgramInterfaceQueryLoaderImpl, "gl43");
static if(!usingContexts) enum arbProgramInterfaceQuery = arbProgramInterfaceQueryDecls ~ arbProgramInterfaceQueryFuncs.makeGShared() ~ arbProgramInterfaceQueryLoader;

// ARB_robust_buffer_access_behavior
enum ARB_robust_buffer_access_behavior = "GL_ARB_robust_buffer_access_behavior";
enum arbRobustBufferAccessBehaviorLoader = makeLoader(ARB_robust_buffer_access_behavior, "", "gl43");
static if(!usingContexts) enum arbRobustBufferAccessBehavior = arbRobustBufferAccessBehaviorLoader;

// ARB_shader_storage_buffer_object
enum ARB_shader_storage_buffer_object = "GL_ARB_shader_storage_buffer_object";
enum arbShaderStorageBufferObjectDecls =
q{
enum : uint
{
    GL_SHADER_STORAGE_BUFFER          = 0x90D2,
    GL_SHADER_STORAGE_BUFFER_BINDING  = 0x90D3,
    GL_SHADER_STORAGE_BUFFER_START    = 0x90D4,
    GL_SHADER_STORAGE_BUFFER_SIZE     = 0x90D5,
    GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = 0x90D6,
    GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 0x90D7,
    GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 0x90D8,
    GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 0x90D9,
    GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 0x90DA,
    GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 0x90DB,
    GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = 0x90DC,
    GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = 0x90DD,
    GL_MAX_SHADER_STORAGE_BLOCK_SIZE  = 0x90DE,
    GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 0x90DF,
    GL_SHADER_STORAGE_BARRIER_BIT     = 0x2000,
    GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = 0x8F39,
}
extern(System) @nogc nothrow alias da_glShaderStorageBlockBinding = void function(GLuint,GLuint,GLuint);
};

enum arbShaderStorageBufferObjectFuncs = `da_glShaderStorageBlockBinding glShaderStorageBlockBinding;`;
enum arbShaderStorageBufferObjectLoaderImpl = `bindGLFunc(cast(void**)&glShaderStorageBlockBinding, "glShaderStorageBlockBinding");`;
enum arbShaderStorageBufferObjectLoader = makeLoader(ARB_shader_storage_buffer_object, arbShaderStorageBufferObjectLoaderImpl, "gl43");
static if(!usingContexts) enum arbShaderStorageBufferObject = arbShaderStorageBufferObjectDecls ~ arbShaderStorageBufferObjectFuncs.makeGShared() ~ arbShaderStorageBufferObjectLoader;

// ARB_stencil_texturing
enum ARB_stencil_texturing = "GL_ARB_stencil_texturing";
enum arbStencilTexturingDecls = `enum uint GL_DEPTH_STENCIL_TEXTURE_MODE = 0x90EA;`;
enum arbStencilTexturingLoader = makeLoader(ARB_stencil_texturing, "", "gl43");
static if(!usingContexts) enum arbStencilTexturing = arbStencilTexturingDecls ~ arbStencilTexturingLoader;

// ARB_texture_buffer_range
enum ARB_texture_buffer_range = "GL_ARB_texture_buffer_range";
enum arbTextureBufferRangeDecls =
q{
enum : uint
{
    GL_TEXTURE_BUFFER_OFFSET = 0x919D,
    GL_TEXTURE_BUFFER_SIZE = 0x919E,
    GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F,
}
extern(System) @nogc nothrow
{
    alias da_glTexBufferRange = void function(GLenum,GLenum,GLuint,GLintptr,GLsizeiptr);
    alias da_glTextureBufferRangeEXT = void function(GLuint,GLenum,GLenum,GLuint,GLintptr,GLsizeiptr);
}};

enum arbTextureBufferRangeFuncs =
q{
    da_glTexBufferRange glTexBufferRange;
    da_glTextureBufferRangeEXT glTextureBufferRangeEXT;
};

enum arbTextureBufferRangeLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexBufferRange, "glTexBufferRange");
    bindGLFunc(cast(void**)&glTextureBufferRangeEXT, "glTextureBufferRangeEXT");
};

enum arbTextureBufferRangeLoader = makeLoader(ARB_texture_buffer_range, arbTextureBufferRangeLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureBufferRange = arbTextureBufferRangeDecls ~ arbTextureBufferRangeFuncs.makeGShared() ~ arbTextureBufferRangeLoader;

// ARB_texture_storage_multisample
enum ARB_texture_storage_multisample = "GL_ARB_texture_storage_multisample";
enum arbTextureStorageMultisampleDecls =
q{
extern(System) @nogc nothrow {
    alias da_glTexStorage2DMultisample = void function(GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTexStorage3DMultisample = void function(GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage2DMultisampleEXT = void function(GLuint,GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage3DMultisampleEXT = void function(GLuint,GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
}};

enum arbTextureStorageMultisampleFuncs =
q{
    da_glTexStorage2DMultisample glTexStorage2DMultisample;
    da_glTexStorage3DMultisample glTexStorage3DMultisample;
    da_glTextureStorage2DMultisampleEXT glTextureStorage2DMultisampleEXT;
    da_glTextureStorage3DMultisampleEXT glTextureStorage3DMultisampleEXT;
};

enum arbTextureStorageMultisampleLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexStorage2DMultisample, "glTexStorage2DMultisample");
    bindGLFunc(cast(void**)&glTexStorage3DMultisample, "glTexStorage3DMultisample");
    try {
        bindGLFunc(cast(void**)&glTextureStorage2DMultisampleEXT, "glTextureStorage2DMultisampleEXT");
        bindGLFunc(cast(void**)&glTextureStorage3DMultisampleEXT, "glTextureStorage3DMultisampleEXT");
    }
    catch(Exception e){}
};

enum arbTextureStorageMultisampleLoader = makeLoader(ARB_texture_storage_multisample, arbTextureStorageMultisampleLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureStorageMultisample = arbTextureStorageMultisampleDecls ~ arbTextureStorageMultisampleFuncs.makeGShared() ~ arbTextureStorageMultisampleLoader;

// ARB_texture_view
enum ARB_texture_view = "GL_ARB_texture_view";
enum arbTextureViewDecls =
q{
enum : uint
{
    GL_TEXTURE_VIEW_MIN_LEVEL         = 0x82DB,
    GL_TEXTURE_VIEW_NUM_LEVELS        = 0x82DC,
    GL_TEXTURE_VIEW_MIN_LAYER         = 0x82DD,
    GL_TEXTURE_VIEW_NUM_LAYERS        = 0x82DE,
    GL_TEXTURE_IMMUTABLE_LEVELS       = 0x82DF,
}
extern(System) @nogc nothrow alias da_glTextureView = void function(GLuint,GLenum,GLuint,GLenum,GLuint,GLuint,GLuint,GLuint);
};
enum arbTextureViewFuncs = `da_glTextureView glTextureView;`;
enum arbTextureViewLoaderImpl = `bindGLFunc(cast(void**)&glTextureView, "glTextureView");`;

enum arbTextureViewLoader = makeLoader(ARB_texture_view, arbTextureViewLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureView = arbTextureViewDecls ~ arbTextureViewFuncs.makeGShared() ~ arbTextureViewLoader;

// ARB_vertex_attrib_binding
enum ARB_vertex_attrib_binding = "GL_ARB_vertex_attrib_binding";
enum arbVertexAttribBindingDecls =
q{
enum : uint
{
    GL_VERTEX_ATTRIB_BINDING          = 0x82D4,
    GL_VERTEX_ATTRIB_RELATIVE_OFFSET  = 0x82D5,
    GL_VERTEX_BINDING_DIVISOR         = 0x82D6,
    GL_VERTEX_BINDING_OFFSET          = 0x82D7,
    GL_VERTEX_BINDING_STRIDE          = 0x82D8,
    GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D9,
    GL_MAX_VERTEX_ATTRIB_BINDINGS     = 0x82DA,
}
extern(System) @nogc nothrow
{
    alias da_glBindVertexBuffer = void function(GLuint,GLuint,GLintptr,GLsizei);
    alias da_glVertexAttribFormat = void function(GLuint,GLint,GLenum,GLboolean,GLuint);
    alias da_glVertexAttribIFormat = void function(GLuint,GLint,GLenum,GLuint);
    alias da_glVertexAttribLFormat = void function(GLuint,GLint,GLenum,GLuint);
    alias da_glVertexAttribBinding = void function(GLuint,GLuint);
    alias da_glVertexBindingDivisor = void function(GLuint,GLuint);
    alias da_glVertexArrayBindVertexBufferEXT = void function(GLuint,GLuint,GLuint,GLintptr,GLsizei);
    alias da_glVertexArrayVertexAttribFormatEXT = void function(GLuint,GLuint,GLint,GLenum,GLboolean,GLuint);
    alias da_glVertexArrayVertexAttribIFormatEXT = void function(GLuint,GLuint,GLint,GLenum,GLuint);
    alias da_glVertexArrayVertexAttribLFormatEXT = void function(GLuint,GLuint,GLint,GLenum,GLuint);
    alias da_glVertexArrayVertexAttribBindingEXT = void function(GLuint,GLuint,GLuint);
    alias da_glVertexArrayVertexBindingDivisorEXT = void function(GLuint,GLuint,GLuint);
}};

enum arbVertexAttribBindingFuncs =
q{
    da_glBindVertexBuffer glBindVertexBuffer;
    da_glVertexAttribFormat glVertexAttribFormat;
    da_glVertexAttribIFormat glVertexAttribIFormat;
    da_glVertexAttribLFormat glVertexAttribLFormat;
    da_glVertexAttribBinding glVertexAttribBinding;
    da_glVertexBindingDivisor glVertexBindingDivisor;
    da_glVertexArrayBindVertexBufferEXT glVertexArrayBindVertexBufferEXT;
    da_glVertexArrayVertexAttribFormatEXT glVertexArrayVertexAttribFormatEXT;
    da_glVertexArrayVertexAttribIFormatEXT glVertexArrayVertexAttribIFormatEXT;
    da_glVertexArrayVertexAttribLFormatEXT glVertexArrayVertexAttribLFormatEXT;
    da_glVertexArrayVertexAttribBindingEXT glVertexArrayVertexAttribBindingEXT;
    da_glVertexArrayVertexBindingDivisorEXT glVertexArrayVertexBindingDivisorEXT;
};

enum arbVertexAttribBindingLoaderImpl =
q{
    bindGLFunc(cast(void**)&glBindVertexBuffer, "glBindVertexBuffer");
    bindGLFunc(cast(void**)&glVertexAttribFormat, "glVertexAttribFormat");
    bindGLFunc(cast(void**)&glVertexAttribIFormat, "glVertexAttribIFormat");
    bindGLFunc(cast(void**)&glVertexAttribLFormat, "glVertexAttribLFormat");
    bindGLFunc(cast(void**)&glVertexAttribBinding, "glVertexAttribBinding");
    bindGLFunc(cast(void**)&glVertexBindingDivisor, "glVertexBindingDivisor");
    try {
        bindGLFunc(cast(void**)&glVertexArrayBindVertexBufferEXT, "glVertexArrayBindVertexBufferEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribFormatEXT, "glVertexArrayVertexAttribFormatEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribIFormatEXT, "glVertexArrayVertexAttribIFormatEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribLFormatEXT, "glVertexArrayVertexAttribLFormatEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribBindingEXT, "glVertexArrayVertexAttribBindingEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexBindingDivisorEXT, "glVertexArrayVertexBindingDivisorEXT");
    }
    catch(Exception e) {}
};

enum arbVertexAttribBindingLoader = makeLoader(ARB_vertex_attrib_binding, arbVertexAttribBindingLoaderImpl, "gl43");
static if(!usingContexts) enum arbVertexAttribBinding = arbVertexAttribBindingDecls ~ arbVertexAttribBindingFuncs.makeGShared() ~ arbVertexAttribBindingLoader;

enum corearb43Decls = arbClearBufferObjectDecls ~ arbComputeShaderDecls ~ arbCopyImageDecls ~ khrDebugDecls ~ arbES3CompatibilityDecls
        ~ arbFramebufferNoAttachmentsDecls ~ arbInternalFormatQuery2Decls ~ arbInvalidateSubdataDecls ~ arbMultiDrawIndirectDecls
        ~ arbProgramInterfaceQueryDecls ~ arbShaderStorageBufferObjectDecls ~ arbStencilTexturingDecls ~ arbTextureBufferRangeDecls
         ~ arbTextureStorageMultisampleDecls ~ arbTextureViewDecls ~ arbVertexAttribBindingDecls;

enum corearb43Funcs = arbClearBufferObjectFuncs ~ arbComputeShaderFuncs ~ arbCopyImageFuncs ~ khrDebugFuncs ~ arbFramebufferNoAttachmentsFuncs
        ~ arbInternalFormatQuery2Funcs ~ arbInvalidateSubdataFuncs ~ arbMultiDrawIndirectFuncs ~ arbProgramInterfaceQueryFuncs
        ~ arbShaderStorageBufferObjectFuncs ~ arbTextureBufferRangeFuncs ~ arbTextureStorageMultisampleFuncs ~ arbTextureViewFuncs
        ~ arbVertexAttribBindingFuncs;

enum corearb43Loader = arbClearBufferObjectLoaderImpl ~ arbComputeShaderLoaderImpl ~ arbCopyImageLoaderImpl ~ khrDebugLoaderImpl ~ arbFramebufferNoAttachmentsLoaderImpl
        ~ arbInternalFormatQuery2LoaderImpl ~ arbInvalidateSubdataLoaderImpl ~ arbMultiDrawIndirectLoaderImpl ~ arbProgramInterfaceQueryLoaderImpl
        ~ arbShaderStorageBufferObjectLoaderImpl ~ arbTextureBufferRangeLoaderImpl ~ arbTextureStorageMultisampleLoaderImpl ~ arbTextureViewLoaderImpl
        ~ arbVertexAttribBindingLoaderImpl;