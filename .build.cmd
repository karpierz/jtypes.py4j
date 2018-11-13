@echo off
rem py4j-27799
setlocal
set JAVA8_HOME=C:\Program Files\Java\jdk1.8.0_181
if not defined JAVA_HOME (set JAVA_HOME=%JAVA8_HOME%)
set javac="%JAVA_HOME%"\bin\javac -encoding UTF-8 -g:none -deprecation -Xlint:unchecked ^
    -source 1.8 -target 1.8 -bootclasspath "%JAVA8_HOME%\jre\lib\rt.jar;%JAVA8_HOME%\jre\lib\jsse.jar"
set jar="%JAVA_HOME%"\bin\jar
set py=C:\Windows\py.exe -3.6 -B
pushd "%~dp0"\src\jt\py4j\_java
%javac% ^
    py4j\*.java ^
    py4j\reflection\*.java ^
    py4j\model\*.java ^
    py4j\commands\*.java
%py% -m class2py py4j\Base64.class
%py% -m class2py py4j\CallbackClient.class
%py% -m class2py py4j\CallbackConnection.class
%py% -m class2py py4j\ClientServer.class
%py% -m class2py py4j\ClientServerConnection.class
%py% -m class2py py4j\DefaultApplication.class
%py% -m class2py py4j\DefaultGatewayServerListener.class
%py% -m class2py py4j\Gateway.class
%py% -m class2py py4j\GatewayConnection.class
%py% -m class2py py4j\GatewayServer.class
%py% -m class2py py4j\GatewayServerListener.class
%py% -m class2py py4j\JVMView.class
%py% -m class2py py4j\NetworkUtil.class
%py% -m class2py py4j\Protocol.class
%py% -m class2py py4j\ReturnObject.class
%py% -m class2py py4j\JavaServer.java
%py% -m class2py py4j\PythonClient.java
%py% -m class2py py4j\Py4JException.class
%py% -m class2py py4j\Py4JAuthenticationException.class
%py% -m class2py py4j\Py4JJavaException.class
%py% -m class2py py4j\Py4JNetworkException.class
%py% -m class2py py4j\Py4JJavaServer.java
%py% -m class2py py4j\Py4JServerConnection.java
%py% -m class2py py4j\Py4JPythonClient.java
%py% -m class2py py4j\Py4JPythonClientPerThread.java
%py% -m class2py py4j\Py4JClientConnection.java
%py% -m class2py py4j\StringUtil.class
%py% -m class2py py4j\reflection\LRUCache.class
%py% -m class2py py4j\reflection\MethodDescriptor.class
%py% -m class2py py4j\reflection\MethodInvoker.class
%py% -m class2py py4j\reflection\PythonProxyHandler.class
%py% -m class2py py4j\reflection\ReflectionEngine.class
%py% -m class2py py4j\reflection\TypeConverter.class
%py% -m class2py py4j\reflection\TypeUtil.class
%py% -m class2py py4j\reflection\RootClassLoadingStrategy.java
%py% -m class2py py4j\reflection\ReflectionUtil.java
%py% -m class2py py4j\reflection\CurrentThreadClassLoadingStrategy.java
%py% -m class2py py4j\reflection\ClassLoadingStrategy.java
%py% -m class2py py4j\model\HelpPageGenerator.class
%py% -m class2py py4j\model\Py4JClass.class
%py% -m class2py py4j\model\Py4JField.class
%py% -m class2py py4j\model\Py4JMember.class
%py% -m class2py py4j\model\Py4JMethod.class
%py% -m class2py py4j\commands\AbstractCommand.class
%py% -m class2py py4j\commands\ArrayCommand.class
%py% -m class2py py4j\commands\AuthCommand.java
%py% -m class2py py4j\commands\CallCommand.class
%py% -m class2py py4j\commands\Command.class
%py% -m class2py py4j\commands\ConstructorCommand.class
%py% -m class2py py4j\commands\DirCommand.class
%py% -m class2py py4j\commands\ExceptionCommand.class
%py% -m class2py py4j\commands\FieldCommand.class
%py% -m class2py py4j\commands\HelpPageCommand.class
%py% -m class2py py4j\commands\JVMViewCommand.class
%py% -m class2py py4j\commands\ListCommand.class
%py% -m class2py py4j\commands\MemoryCommand.class
%py% -m class2py py4j\commands\ReflectionCommand.class
%py% -m class2py py4j\commands\ShutdownGatewayServerCommand.class
%py% -m class2py py4j\commands\StreamCommand.class
del /F/Q ^
    py4j\*.class ^
    py4j\reflection\*.class ^
    py4j\model\*.class ^
    py4j\commands\*.class
popd
pushd "%~dp0"\tests
rmdir /Q/S java\classes 2> nul & mkdir java\classes
dir /S/B/O:N ^
    ..\src\jt\py4j\_java\py4j\*.java ^
    2> nul > build.fil
%javac% -d java/classes -classpath java/lib/* @build.fil
%jar% cf ..\src\jt\py4j\_java\py4j.jar -C java/classes .
dir /S/B/O:N ^
    java\py4j\*.java ^
    java\p1\*.java ^
    2> nul >> build.fil
%javac% -d java/classes -classpath java/lib/* @build.fil
del /F/Q build.fil
popd
endlocal
