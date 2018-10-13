APP_HOME=$(cd `dirname $0`; pwd)
APP_NAME="test-demo-application"

echo ""
pr=`ps ax | grep java | grep $APP_NAME | egrep -v "grep"`
echo "-------------current process status------------------------"
echo $pr
if [ -z "$pr" ];then
	echo -e "process is not running"
else
	echo ""
	echo "-------------stop process----------------------------------"
	pr_num=`ps ax | grep java | grep $APP_NAME | egrep -v "grep" | awk '{print $1}'`
	echo "process is running PID:$pr_num"
	echo -e "killing process $pr_num"
	kill -9 $pr_num
        sleep 5
	pr=`ps ax | grep java | grep $APP_NAME | egrep -v "grep" `
	if [ -z "$pr" ];then
		echo "process stop success"
	else
		echo "process stop failed"
		echo "process info："
		echo $pr
		exit 1;
	fi
fi
