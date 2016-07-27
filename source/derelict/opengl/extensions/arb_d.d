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
module derelict.opengl.extensions.arb_d;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_debug_output
enum ARB_debug_output = "GL_ARB_debug_output";
enum arbDebugOutputDecls =
q{
enum : uint
{
    GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB   = 0x8242,
    GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243,
    GL_DEBUG_CALLBACK_FUNCTION_ARB    = 0x8244,
    GL_DEBUG_CALLBACK_USER_PARAM_ARB  = 0x8245,
    GL_DEBUG_SOURCE_API_ARB           = 0x8246,
    GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = 0x8247,
    GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = 0x8248,
    GL_DEBUG_SOURCE_THIRD_PARTY_ARB   = 0x8249,
    GL_DEBUG_SOURCE_APPLICATION_ARB   = 0x824A,
    GL_DEBUG_SOURCE_OTHER_ARB         = 0x824B,
    GL_DEBUG_TYPE_ERROR_ARB           = 0x824C,
    GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = 0x824D,
    GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = 0x824E,
    GL_DEBUG_TYPE_PORTABILITY_ARB     = 0x824F,
    GL_DEBUG_TYPE_PERFORMANCE_ARB     = 0x8250,
    GL_DEBUG_TYPE_OTHER_ARB           = 0x8251,
    GL_MAX_DEBUG_MESSAGE_LENGTH_ARB   = 0x9143,
    GL_MAX_DEBUG_LOGGED_MESSAGES_ARB  = 0x9144,
    GL_DEBUG_LOGGED_MESSAGES_ARB      = 0x9145,
    GL_DEBUG_SEVERITY_HIGH_ARB        = 0x9146,
    GL_DEBUG_SEVERITY_MEDIUM_ARB      = 0x9147,
    GL_DEBUG_SEVERITY_LOW_ARB         = 0x9148,
}
extern(System) nothrow {
    alias GLDEBUGPROCARB = void function(GLenum, GLenum, GLuint, GLenum, GLsizei, in GLchar*, GLvoid*);
    alias GLDEBUGPROCAMD = void function(GLuint, GLenum, GLenum, GLsizei, in GLchar*, GLvoid*);
}
extern(System) @nogc nothrow {
    alias da_glDebugMessageControlARB = void function(GLenum, GLenum, GLenum, GLsizei, const(GLuint)*, GLboolean);
    alias da_glDebugMessageInsertARB = void function(GLenum, GLenum, GLuint, GLenum, GLsizei, const(GLchar)*);
    alias da_glGetDebugMessageLogARB = void function(GLuint, GLsizei, GLenum*, GLenum*, GLuint*, GLenum*, GLsizei*, GLchar*);
    alias da_glDebugMessageCallbackARB = void function(GLDEBUGPROCARB, const(GLvoid)*);
}};

enum arbDebugOutputFuncs =
q{
    da_glDebugMessageControlARB glDebugMessageControlARB;
    da_glDebugMessageInsertARB glDebugMessageInsertARB;
    da_glDebugMessageCallbackARB glDebugMessageCallbackARB;
    da_glGetDebugMessageLogARB glGetDebugMessageLogARB;
};

enum arbDebugOutputLoaderImpl =
q{
    bindGLFunc(cast(void**)&glDebugMessageControlARB, "glDebugMessageControlARB");
    bindGLFunc(cast(void**)&glDebugMessageInsertARB, "glDebugMessageInsertARB");
    bindGLFunc(cast(void**)&glDebugMessageCallbackARB, "glDebugMessageCallbackARB");
    bindGLFunc(cast(void**)&glGetDebugMessageLogARB, "glGetDebugMessageLogARB");
};

enum arbDebugOutputLoader = makeExtLoader(ARB_debug_output, arbDebugOutputLoaderImpl);
static if(!usingContexts) enum arbDebugOutput = arbDebugOutputDecls ~ arbDebugOutputFuncs ~ arbDebugOutputLoader;

// ARB_depth_buffer_float
enum ARB_depth_buffer_float = "GL_ARB_depth_buffer_float";
enum arbDepthBufferFloatDecls =
q{
enum : uint
{
    GL_DEPTH_COMPONENT32F             = 0x8CAC,
    GL_DEPTH32F_STENCIL8              = 0x8CAD,
    GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD,
}};

enum arbDepthBufferFloatLoader = makeExtLoader(ARB_depth_buffer_float);
static if(!usingContexts) enum arbDepthBufferFloat = arbDepthBufferFloatDecls ~ arbDepthBufferFloatLoader;

// ARB_depth_clamp
enum ARB_depth_clamp = "GL_ARB_depth_clamp";
enum arbDepthClampDecls = `enum uint GL_DEPTH_CLAMP = 0x864F;`;
enum arbDepthClampLoader = makeExtLoader(ARB_depth_clamp);
static if(!usingContexts) enum arbDepthClamp = arbDepthClampDecls ~ arbDepthClampLoader;

// ARB_derivative_control
enum ARB_derivative_control = "GL_ARB_derivative_control";
enum arbDerivativeControlLoader = makeExtLoader(ARB_derivative_control);
static if(!usingContexts) enum arbDerivativeControl = arbDerivativeControlLoader;

// ARB_draw_buffers_blend
enum ARB_draw_buffers_blend = "GL_ARB_draw_buffers_blend";
enum arbDrawBuffersBlendDecls =
q{
extern(System) @nogc nothrow {
    alias da_glBlendEquationiARB = void function(GLuint, GLenum);
    alias da_glBlendEquationSeparateiARB = void function(GLuint, GLenum, GLenum);
    alias da_glBlendFunciARB = void function(GLuint, GLenum, GLenum);
    alias da_glBlendFuncSeparateiARB = void function(GLuint, GLenum, GLenum, GLenum, GLenum);
}};

enum arbDrawBuffersBlendFuncs =
q{
    da_glBlendEquationiARB glBlendEquationiARB;
    da_glBlendEquationSeparateiARB glBlendEquationSeparateiARB;
    da_glBlendFunciARB glBlendFunciARB;
    da_glBlendFuncSeparateiARB glBlendFuncSeparateiARB;
};

enum arbDrawBuffersBlendLoaderImpl =
q{
    bindGLFunc(cast(void**)&glBlendEquationiARB, "glBlendEquationiARB");
    bindGLFunc(cast(void**)&glBlendEquationSeparateiARB, "glBlendEquationSeparateiARB");
    bindGLFunc(cast(void**)&glBlendFunciARB, "glBlendFunciARB");
    bindGLFunc(cast(void**)&glBlendFuncSeparateiARB, "glBlendFuncSeparateiARB");
};

enum arbDrawBuffersBlendLoader = makeExtLoader(ARB_draw_buffers_blend, arbDrawBuffersBlendLoaderImpl);
static if(!usingContexts) enum arbDrawBuffersBlend = arbDrawBuffersBlendDecls ~ arbDrawBuffersBlendFuncs ~ arbDrawBuffersBlendLoader;