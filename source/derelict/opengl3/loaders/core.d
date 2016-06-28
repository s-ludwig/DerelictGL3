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
module derelict.opengl3.loaders.core;

import derelict.opengl3.loaders.internal;

public
import derelict.opengl3.versions.base,
       derelict.opengl3.versions.gl1x,
       derelict.opengl3.versions.gl2x;

mixin(commonImports);

static if(!useContexts) {
    import derelict.opengl3.versions.base;

    class DerelictGL3Loader : SharedLibLoader
    {
        mixin(commonMembers);

        this() { super(libNames); }

        GLVersion reload(GLVersion minVersion = GLVersion.None, GLVersion maxVersion = GLVersion.HighestSupported)
        {
            import std.string : format;
            import derelict.opengl3.versions.gl1x : loadGL1x;

            // Make sure a context is active, otherwise this could be meaningless.
            if(!hasValidContext())
                throw new DerelictException("DerelictGL3.reload failure: An OpenGL context is not currently active.");

            _contextVersion = getContextVersion(this);
            if(minVersion != GLVersion.None && _contextVersion < minVersion) {
                throw new DerelictException(format("OpenGL version %s was required, but context only supports %s",
                    minVersion, _contextVersion));
            }
            if(_contextVersion > maxVersion)
                _contextVersion = maxVersion;

            _loadedVersion = loadGL1x(this);
            _loadedVersion = loadGL2x(this);

            return _loadedVersion;
        }

        protected override void loadSymbols()
        {
            _loadedVersion = loadBaseGL(this);
            initGLLoader(this);
        }
    }
}
else {
    class DerelictGL3Loader : SharedLibLoader
    {
        this() { super(libNames); }

        protected override void loadSymbols()
        {
            initGLLoader(this);
        }
    }
}

__gshared DerelictGL3Loader DerelictGL3;

shared static this() {
    DerelictGL3 = new DerelictGL3Loader;
}