#修改IP address和port符合自己設備的IP
robots[0]="192.168.50.51:5551"
tablets[0]="192.168.50.61:5561"

#修改要安裝的APK路徑
robot_apk_path="C:\Users\Admin\Desktop\robot.apk"
tablet_apk_path="C:\Users\Admin\Desktop\tablet.apk"

adb kill-server

for((i=0; i < ${#robots[@]}; i++))
do
	echo ${robots[i]}
	adb connect ${robots[i]}
done

adb devices | tail -n +2 | cut -sf 1 | xargs -iX adb -s X install -r $robot_apk_path
adb kill-server

for((i=0; i < ${#tablets[@]}; i++)) 
do
	echo ${tablets[i]}
	adb connect ${tablets[i]}
done

adb devices | tail -n +2 | cut -sf 1 | xargs -iX adb -s X install -r $tablet_apk_path

#DEVICES=`adb devices | grep -v devices | grep device | cut -f 1`

echo "installing...."

#sleep 2s