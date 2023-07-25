步驟 :
A. 進到目錄/home/user/MA35D1_Docker_Script
   執行docker ./join

B. 將整個"Project_Config"資料夾, 複製到buildroot路徑下.

C. 執行./MA35D1_ProConfig.sh [ProName], "ProName為專案資料夾名稱, Shell會執行以下動作複製檔案至對應路徑
   Ex. "./MA35D1_ProConfig.sh eOBE"...ProName=eOBE
	***** 備份原始dts *****
	1. 在下列路徑建立bkp資料夾
		~/buildroot/MA35D1_Buildroot/output/build/linux-custom/arch/arm64/boot/dts/nuvoton/
	2. 將ma35d1-iot-512m.dts以外的dts檔案, 搬移至bkp資料夾.
	   將ma35d1.dtsi搬移至bkp資料夾.
	***** linux-dts *****
	1. 複製ma35d1.dtsi & ma35d1-iot-512m.dts至下列路徑
		~/buildroot/MA35D1_Buildroot/output/build/linux-custom/arch/arm64/boot/dts/nuvoton/
	 ***** uboot-dts *****
	1. 複製ma35d1.dtsi & ma35d1.dts至下列路徑
		~/buildroot/MA35D1_Buildroot/output/build/uboot-custom/arch/arm/dts/
	 ***** atf-dts *****
	1. 複製ma35d1.dtsi至下列路徑
		~/buildroot/MA35D1_Buildroot/output/build/arm-trusted-firmware-custom/fdts/
	***** linux-deconfig *****
	1. 複製[ProName]_linux.config至下列路徑
		~/buildroot/MA35D1_Buildroot/output/build/linux-custom/
	***** uboot-deconfig *****
	1. 複製[ProName]_uboot.config至下列路徑
		~/buildroot/MA35D1_Buildroot/output/build/uboot-custom/
	***** buildroot-deconfig *****
	1. 複製[ProName]_buildroot.config至下列路徑
		~/buildroot/MA35D1_Buildroot/
	***** Linux rcS 啟動設定檔 *****
	1. 複製rcS至下列路徑
		~/home/user/shared/buildroot/MA35D1_Buildroot/output/target/etc/init.d/
	***** Linux fstab 磁區設定檔 *****
	1. 複製fstab至下列路徑
		~/home/user/shared/buildroot/MA35D1_Buildroot/output/target/etc/
	***** Linux mnt [SDBackup] SD Card資料夾 *****
	1. 複製SDBackup至下列路徑
		~/home/user/shared/buildroot/MA35D1_Buildroot/output/target/mnt
	***** Linux lib [firmware] M4 firmware資料夾 *****
	1. 複製firmware至下列路徑
		~/home/user/shared/buildroot/MA35D1_Buildroot/output/target/lib

D. 進到目錄/home/user/shared/buildroot/MA35D1_Buildroot
	重新載入Buildroot Deconfig
	1. make menuconfig
	2. Load from "[ProName]_buildroot.config"
	3. Save to ".config"
	
	重新載入Linux Deconfig
	1. make linux-menuconfig
	2. Load from "[ProName]_linux.config"
	3. Save to ".config"

  	重新載入uboot Deconfig
	1. make uboot-menuconfig
	2. Load from "[ProName]_uboot.config"
	3. Save to ".config"

  	重新產生PACK.bin
	1. make arm-trusted-firmware-rebuild uboot-rebuild linux-rebuild
	2. make




