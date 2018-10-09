JAVA_HOME="/export/local/jdk1.8"
APP_HOME=$(cd `dirname $0`; pwd)
APP_NAME="test-demo-application"
JAVA_OPTS="-$APP_NAME -server -Xms512m -Xmx512m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$APP_HOME/dump -XX:ErrorFile=$APP_HOME/logs/hs_err_pid%p.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:$APP_HOME/logs/gc_pid%p.log -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:+UnlockDiagnosticVMOptions"


pr=`ps ax | grep java | grep $APP_NAME | egrep -v "grep" `
echo ""
echo "-------------current process status------------------------"
echo $pr
if [ -z "$pr" ];then
	echo "-------------starting process------------------------"
	nohup $JAVA_HOME/bin/java -jar $APP_HOME/$APP_NAME.jar  $JAVA_OPTS > $APP_HOME/nohup.out 2>&1 &
	pr=`ps ax | grep java | grep $APP_NAME | egrep -v "grep" `
	if [ -z "$pr" ];then
		echo -e "[ \033[31m  \033[5m process start fail \033[0m ]"
                exit 1
	else
		echo -e "[ \033[32m  \033[5m process start success \033[0m ]"
		echo "process info:"
		echo $pr
	fi
else
	echo -e "[ \033[31m \033[5m process alread started \033[0m ]"
        exit 1
fi
