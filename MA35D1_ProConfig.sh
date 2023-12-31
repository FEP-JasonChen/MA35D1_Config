#!/bin/sh

linuxDtsPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/build/linux-custom/arch/arm64/boot/dts/nuvoton"
ubootDtsPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/build/uboot-custom/arch/arm/dts"
atfDeconfigPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/build/arm-trusted-firmware-custom/fdts"

linuxDeconfigPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/build/linux-custom"
ubootDeconfigPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/build/uboot-custom"
buildrootDeconfigPath="/home/user/shared/buildroot/MA35D1_Buildroot/"

ma35d1InitIOPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/build/arm-trusted-firmware-custom/plat/nuvoton/ma35d1"
S80userappPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/etc/init.d"
rcSPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/etc/init.d"
etcPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/etc"
fstabPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/etc"
mountFolderPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/mnt"
firmwareFolderPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/lib"
libmoduleFolderPath="/home/user/shared/buildroot/MA35D1_Buildroot/output/target/lib/modules"

# Get Input Project Folder Name
ProName=$1
# Check project folder if it is exist
if [ -d "$ProName" ]; then
	ProName=${ProName%/}	# delete char '/'
	echo "Recovery "$ProName" Project Config ..."
else
	echo "!! Can't find the "$ProName" Project folder ..."
	exit 1	
fi

# copy linux dts file
echo "copy $ProName linux dts file ..."
cp -f ./${ProName}/linux_dts/ma35d1.dtsi $linuxDtsPath
cp -f ./${ProName}/linux_dts/ma35d1-iot-512m.dts $linuxDtsPath

# copy uboot dts file
echo "copy $ProName uboot dts file ..."
cp -f ./${ProName}/uboot_dts/ma35d1.dtsi $ubootDtsPath
cp -f ./${ProName}/uboot_dts/ma35d1.dts $ubootDtsPath

# copy atf dts file
echo "copy $ProName atf dts file ..."
cp -f ./${ProName}/atf_dts/ma35d1.dtsi $atfDeconfigPath

# copy linux deconfig file
echo "copy $ProName linux deconfig file ..."
cp -f ./${ProName}/linux_deconfig/${ProName}_linux.config $linuxDeconfigPath

# copy uboot deconfig file
echo "copy $ProName uboot deconfig file ..."
cp -f ./${ProName}/uboot_deconfig/${ProName}_uboot.config $ubootDeconfigPath

# copy buildroot deconfig file
echo "copy $ProName buildroot deconfig file ..."
cp -f ./${ProName}/buildroot_deconfig/${ProName}_buildroot.config $buildrootDeconfigPath

# copy ma35d1_common.c file
echo "copy $ProName ma35d1_common.c(Init I/O) file ..."
cp -f ./${ProName}/board_target/ma35d1_common.c $ma35d1InitIOPath

# copy S80userapp file
echo "copy $ProName S80userapp(User APP) file ..."
cp -f ./${ProName}/board_target/S80userapp $S80userappPath

# copy rcS file
echo "copy $ProName rcS file ..."
cp -f ./${ProName}/board_target/rcS $rcSPath

# copy common - AutoRoot (inittab/passwd/shadow) files
echo "copy common - AutoRoot (inittab/passwd/shadow) files ..."
cp -f ./common/inittab $etcPath
cp -f ./common/passwd $etcPath
cp -f ./common/shadow $etcPath

# copy common - interfaces file
echo "copy common - network interfaces file ..."
cp -f ./common/interfaces $etcPath/network

# copy common - wpa/hostapd config files
echo "copy common - wpa config file ..."
cp -f ./common/wpa_supplicant_open.conf $etcPath
cp -f ./common/wpa_supplicant_wpa2.conf $etcPath
cp -f ./common/hostapd.conf $etcPath

# copy common - fstab file
echo "copy common - fstab file ..."
cp -f ./common/fstab $fstabPath

# copy common - mount folder file
echo "copy common - mount folder ..."
cp -rf ./common/SDBackup $mountFolderPath

# copy common - firmware file
echo "copy common - firmware folder ..."
cp -rf ./common/firmware $firmwareFolderPath

# copy common - rtl8821cu.ko file
echo "copy common - wifi rtl8821cu.ko file ..."
cp -f ./common/8821cu.ko $libmoduleFolderPath
cp -f ./common/cfg80211.ko $libmoduleFolderPath
cp -f ./common/brcmutil.ko $libmoduleFolderPath
cp -f ./common/brcmfmac.ko $libmoduleFolderPath

nowTime=$(TZ=Asia/Taipei date -d @`date +%s` "+%Y-%m-%d %H:%M:%S")
echo "*** Recovery Project Config Done [$nowTime] ***"

