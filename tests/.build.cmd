@echo off
setlocal
pushd "%~dp0"
if not defined JAVA_HOME (set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_152)
set javac="%JAVA_HOME%"\bin\javac -encoding UTF-8 -g:none -deprecation -Xlint:unchecked ^
    -source 1.7 -target 1.7 -bootclasspath "C:\Program Files\Java\jdk1.7.0_79\jre\lib\rt.jar;C:\Program Files\Java\jdk1.7.0_79\jre\lib\jsse.jar"
set jar="%JAVA_HOME%"\bin\jar
rmdir /Q/S java\classes 2> nul & mkdir java\classes
dir /S/B/O:N ^
    ..\src\jt\py4j\_java\py4j\*.java 2> nul > build.fil
%javac% -d java/classes -classpath java/lib/* @build.fil
%jar% cf ..\src\jt\py4j\_java\py4j.jar -C java/classes .
dir /S/B/O:N ^
    java\py4j\*.java ^
    java\p1\*.java 2> nul >> build.fil
%javac% -d java/classes -classpath java/lib/* @build.fil
del /F/Q build.fil
popd
endlocal
