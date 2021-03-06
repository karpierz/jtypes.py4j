# Copyright (c) 2015-2018, Adam Karpierz
# Licensed under the BSD license
# http://opensource.org/licenses/BSD-3-Clause

__all__ = ('__title__', '__summary__', '__uri__', '__version_info__',
           '__version__', '__author__', '__maintainer__', '__email__',
           '__copyright__', '__license__')

__title__        = "jtypes.py4j"
__summary__      = "Enables Python to dynamically access arbitrary Java objects " \
                   "(ctypes/cffi-based Py4J)"
__uri__          = "http://pypi.python.org/pypi/jtypes.py4j/"
__version_info__ = type("version_info", (), dict(serial=1,
                        major=0, minor=10, micro=8, releaselevel="alpha"))
__version__      = "{0.major}.{0.minor}.{0.micro}{1}{2}".format(__version_info__,
                   dict(final="", alpha="a", beta="b", rc="rc")[__version_info__.releaselevel],
                   "" if __version_info__.releaselevel == "final" else __version_info__.serial)
__author__       = "Adam Karpierz"
__maintainer__   = "Adam Karpierz"
__email__        = "adam@karpierz.net"
__copyright__    = "Copyright (c) 2015-2018, {0}".format(__author__)
__license__      = "BSD license"
