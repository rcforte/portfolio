@echo off

if "%JAVA_HOME%"=="" (
  echo Please define JAVA_HOME
  goto :endoffile
)
if "%SPARK_HOME%"=="" (
  echo Please define SPARK_HOME
  goto :endoffile
)
if "%IGNITE_HOME%"=="" (
  echo Please define IGNITE_HOME
  goto :endoffile
)
if "%KAFKA_HOME%"=="" (
  echo Please define KAFKA_HOME
  goto :endoffile
)

echo JAVA_HOME=%JAVA_HOME%
echo SPARK_HOME=%SPARK_HOME%
echo IGNITE_HOME=%IGNITE_HOME%
echo KAFKA_HOME=%KAFKA_HOME%

echo Starging zookeeper...
start %KAFKA_HOME%\bin\windows\zookeeper-server-start.bat %KAFKA_HOME%\config\zookeeper.properties

echo Starging kafka...
start %KAFKA_HOME%\bin\windows\kafka-server-start.bat %KAFKA_HOME%\config\server.properties

echo Starting ignite...
start %IGNITE_HOME%\bin\ignite.bat %IGNITE_HOME%\examples\config\example-ignite.xml

:endoffile
