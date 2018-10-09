APP_HOME=$(cd `dirname $0`; pwd)
APP_NAME="test-demo-application"

echo ""
pr=`ps ax | grep java | grep $APP_NAME | egrep -v "grep"`
echo "-------------current process status------------------------"
echo $pr
if [ -z "$pr" ];then
	echo -e "[ \033[31m \033[5m process is not running \033[0m ]"
else
	echo ""
	echo "-------------stop process----------------------------------"
	pr_num=`ps ax | grep java | grep $APP_NAME | egrep -v "grep" | awk '{print $1}'`
	echo "process is running PID:$pr_num"
	echo -e "killing process $pr_num"
	kill -9 $pr_num
	pr=`ps ax | grep java | grep $APP_NAME | egrep -v "grep" `
	if [ -z "$pr" ];then
		echo -e "[ \033[32m \033[5m process stop success \033[0m ]"
	else
		echo -e "[ \033[31m \033[5m process stop failed \033[0m ]"
		echo "process info："
		echo $pr
		exit 1;
	fi
fi
