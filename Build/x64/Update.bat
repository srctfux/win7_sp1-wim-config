@echo off

set UpdateBootWim=1
set es-ES_LangSupport=0
set AllowDiagTrackUpdates=0
set AllowEOSNotifyUpdates=0
set AddWDFUpdate=0
set AddNVMeSupport=0
set AddTPM2Support=0

if "%UpdateBootWim%"=="0" goto IE11

Dism /Mount-Wim /WimFile:C:\Build\x64\files\sources\boot.wim /Index:1 /MountDir:C:\Build\x64\mount\boot
:: Advanced Format Disk
Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb982018-v3-x64_7853a1c9c63611e17cd2c923704bf2e924bdfe7b.msu
if not "%AddWDFUpdate%"=="0" (
  :: KB2685811 - Kernel-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685811-x64_191e09df632b70fd4f4b27d4cb9227f7c5a1c98c.msu
  :: KB2685813 - User-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685813-x64_22a969bada171678b0936bb320e6a7778e8adc07.msu
)
if not "%AddNVMeSupport%"=="0" (
  :: KB2990941 - NVMe drivers
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2990941-v3-x64_05db16b151e786805b5ceabc6cfdbb4915e8082f.msu
  :: KB3087873 - NVMe drivers update
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3087873-v2-x64_098e3dc3e7133ba8a37b2e47260cd8cba960deb8.msu
)
Dism /Unmount-Wim /MountDir:C:\Build\x64\mount\boot /Commit
timeout 2

Dism /Mount-Wim /WimFile:C:\Build\x64\files\sources\boot.wim /Index:2 /MountDir:C:\Build\x64\mount\boot
:: Advanced Format Disk
Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb982018-v3-x64_7853a1c9c63611e17cd2c923704bf2e924bdfe7b.msu
if not "%AddWDFUpdate%"=="0" (
  :: KB2685811 - Kernel-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685811-x64_191e09df632b70fd4f4b27d4cb9227f7c5a1c98c.msu
  :: KB2685813 - User-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685813-x64_22a969bada171678b0936bb320e6a7778e8adc07.msu
)
if not "%AddNVMeSupport%"=="0" (
  :: KB2990941 - NVMe drivers
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2990941-v3-x64_05db16b151e786805b5ceabc6cfdbb4915e8082f.msu
  :: KB3087873 - NVMe drivers update
  Dism /Image:C:\Build\x64\mount\boot /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3087873-v2-x64_098e3dc3e7133ba8a37b2e47260cd8cba960deb8.msu
)
Dism /Unmount-Wim /MountDir:C:\Build\x64\mount\boot /Commit
timeout 2

:IE11
Dism /Mount-Wim /WimFile:C:\Build\x64\files\sources\install.wim /Index:1 /MountDir:C:\Build\x64\mount\install
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2729094-v2-x64_e1a3ecc5030a51711f558f90dd1db52e24ce074b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2758857-x64_b717b4e2168ab84dda2eb17c71a4a1adee502ba6.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2670838-x64_9f667ff60e80b64cbed2774681302baeaf0fc6a6.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2786081-x64_dc63b04c58d952d533c40b185a8b555b50d47905.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2834140-v2-x64_3db9d9b3dc20515bf4b164821b721402e34ad9d6.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2888049-x64_fae6327b151ae04b56fac431e682145c14474c69.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\IE-Win7_ab2c7c61f78862c3130c5b619fc510bcfc632a69.CAB
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\IE-Spelling-en_eb351282502a45726223354a4e92d17807d78bbb.MSU
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\IE-Hyphenation-en_092773d1a202d185aa4b0e756e29e6bc80575f0e.MSU
if not "%es-ES_LangSupport%"=="0" (
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\ielangpack-es-ES_8c26a5c6034b6865eb3fd35f897ec956ee006660.CAB
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\IE-Spelling-es-ES_51ba34590e81e0958affe0a4c35682cb5fed5fb4.MSU
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\IE-Hyphenation-es-ES_a5b7b66d02be18bbc23396138decf8a2afd52c85.MSU
)
Dism /Unmount-Wim /MountDir:C:\Build\x64\mount\install /Commit
timeout 2

:: Security Updates
Dism /Mount-Wim /WimFile:C:\Build\x64\files\sources\install.wim /Index:1 /MountDir:C:\Build\x64\mount\install
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2479943-x64_2a683f1c9acb8b3c1fb480c1ff07a275267030ec.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2491683-x64_f33cff50cf92e0b8c0043f1ef3587661d600633e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2506014-x64_cc70f2accbfbae5e68f3c7aa3dba8877d1dc88a7.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2506212-x64_d23437b7902566fdc1ab3c972f38b3370a1f25a3.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2532531-x64_e76d3898952ba2d157e78fbef8b02247fa354045.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2552343-x64_a099df53b7dfafc6e88b59c555f21377b7e07478.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2560656-x64_8893910e8caa34f7bd4cfbd7328e0f344b7337c9.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2564958-x64_adcf10eb04555007024c03e0acba36716f972c6f.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2579686-x64_8aafda82929dade948fa4f336325dc2ee2dcdc02.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2620704-x64_56ee47ea2404eae31cea5c9664e5e3fa316c4f19.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2621440-x64_0f4492f612ea59c386a59e587d71ee3ae5d0f475.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2631813-x64_acb32a06811d1e0460b8b942b50422a140d193aa.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2653956-x64_6b501a6dca4a50178e2c45ac648ce637b7c0839a.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2654428-x64_90e2edc247e44993622492f88722edbcdced2460.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2667402-v2-x64_15c04bd5944cd9b34a294a25b96911057593c465.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685939-x64_77e00094178df5b33701741cbddb5df861cec20c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2690533-x64_b29b40f47cdf66f570c3729d36680f1d00dd9c66.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2698365-x64_f3ad859582ad240c95b9ed867bc9b99e39d15ba9.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2705219-v2-x64_a38d382c053a348e78016d4203a53073a4de4636.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2727528-x64_0a63a41650aeaae69d37169407fdb24d4969c2c6.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2770660-x64_ad1fefadb0ff6958bd3c7b170921499d91379bdd.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2807986-x64_56312cd3e41ec18ce2167a0da8fb78b825946376.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2813430-x64_0a282a6077331c034ba2d31b85dfe65dcc71e380.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2847927-x64_ece0ef5b536b396fea024abf91ba749d462de86e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2862152-x64_72bbaf8697440a998df17db09a69b24d96c4fe07.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2862330-v2-x64_c1a8b768d8c22640d0a80966d124f441eb625934.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2864202-x64_92617ad813adf4795cd694d828558271086f4f70.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2868038-x64_f61f005ef0fc4bb84dc16b2e5ab60e44d065889c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2871997-v2-x64_92e5e108b94d145a1d8a1627e2e9b830a4fa2fc5.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2884256-x64_88f3b33a718917f2d476788a9484e49426f73d3f.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2893294-x64_2dc081110a10ae52ac520d00c7334ca768f99e0e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2900986-x64_a56afda70b8208665280cb79d0a6704bb7dcc3bb.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2912390-x64_413ad3ebc0199bd6d0ec00aaa0a17c73a00b8c30.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2973201-x64_15cd6f4d6651b3afefa3c000263b8f4b8532f79f.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2977292-x64_4214853d16c5420c290376668634e4346f64fdb4.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2978742-x64_724fd42c0778964738f29c064cfd6f8763a0023c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2984972-x64_2545620eadc06a0a3fd426b5853b2e0b48187599.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2991963-x64_22b59d6febd0ca105cd058b81bbb8b3d83cee151.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2992611-x64_786356207570e1f5c422795f3c15961af3cb2d0a.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3004375-v3-x64_c4f55f4d06ce51e923bd0e269af11126c5e7196a.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3010788-x64_ff5ca48d247b91e246262af5f27c381e7652ece5.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3011780-x64_fdd28f07643e9f123cf935bc9be12f75ac0b4d80.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3019978-x64_af5e338495c9cd753793f90da0b7082eb67eea50.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3021674-x64_1193b28116109ec0ce1d47c1b0cfa89727c71ce3.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3022777-x64_1f9fa42295fbf91316b386e7f73841ce0b951e54.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3030377-x64_84403e576de8606703954e00abcc573f24663def.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3031432-x64_e648abe279c8b0095a57271ffbab5d5d376da558.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3035126-x64_ba6bf5118bc60be7f824c4dba9131185e4755646.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3045685-x64_c43565170f9830aaa10a790d0c13122a75e8172c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3046017-x64_5451208ccc96f656f55f35fca5997801e1676bcb.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3046269-x64_9cdabeb9c2a859414c27c4f981d6b1334aee0ad5.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3059317-x64_b68db33239bddcb59e881252cfc7b79d58a2f26b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3060716-x64_49727bab5e712459ea1889422f17a847732ff8f1.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3067903-x64_32ade96fc5ca8915c044307a24aaff2415931708.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3071756-x64_b1aab0ef3752c52636409b50eb7853f645859e78.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3086255-x64_cc45ada905486ae2545da1aa346aa4ee68b74bb4.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3093513-x64_2c1e5ff88f5acbd93bb3d80b09731db3fb85eb1e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3108371-x64_b5f113175336b0fb642e82059d36cd136ba518de.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3108664-x64_9673c01a4e00a8f2a1abae886545052185e579c0.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3109103-x64_5a443c08ac3f02ae8a7ec1100f306f8cf0d216db.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3109560-x64_3e909863df771bf441c1e411b1f746722ec76736.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3110329-x64_4ed9eebee2938cf8c55550e2a7f196a409e80b76.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3115858-x64_a95be5ad42a22d5787980bcd137738b52a0c4758.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3126587-x64_a9c28babef00f427021b566bdc4d3adbb07deb9e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3138612-x64_f7b1de8ea7cf8faf57b0138c4068d2e899e2b266.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3138910-x64_accd87884dcd28f2214ad74a43e4b9639e34078b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3139398-x64_4a5707dfad03116b078bc99de404e89a9d93c801.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3139914-x64_ad8a18b8aada73f20225d233444a578902508596.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3150220-x64_4b29121b751476ed6b81ab570e2f607278d45824.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3156016-x64_97fa9ecb5f3a03a0739c6baeea3d9371c1474a6a.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3159398-x64_dc2b2c11af4b38b0b632bd7f6d683d57a93b711c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3161949-x64_e2372fb5746e9474cec6ef1710f8d58ec5c6c000.msu

:: Optional Updates
:: KB982018  - Advanced Format Disk
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb982018-v3-x64_7853a1c9c63611e17cd2c923704bf2e924bdfe7b.msu
:: KB2574819 - DTLS protocol
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2574819-v2-x64_a0b7ffff5c8fc9b2f16b323e582bcda3bbe972d5.msu
:: KB2640148 - USB drive fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2640148-v2-x64_32f195699b401df56e4c0562757308e9b1909a3a.msu
:: KB2719857 - 4G network
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2719857-x64_b9f708b95abbab7341f310595b3dc65798cf316a.msu
:: KB2732059 - Add XPS .oxps format
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2732059-v5-x64_102edb47f7704f3f1deb4ae6ace3f7e4f0ee9765.msu
:: KB2750841 - IPv6 readiness
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2750841-x64_bb08f9dbac0d72f1227b362ee503deda2f3dceb6.msu
:: KB2761217 - Calibri Light
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2761217-x64_50d02b8fe1321e36a33545d7350730ced229d15a.msu
:: KB2799926 - USB drive fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2799926-x64_c26efbd4cd1eee10a12e3300b46a84803bbc6d8d.msu
:: KB2800095 - Smart Card fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2800095-v2-x64_acbc49bbde2fdca32d36f184128a1aba6ab3faa7.msu
:: KB2808679 - Protect from internal URL port scanning
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2808679-x64_e44a2f7de51433572a8a2c5f5f79b14c2fcb17b6.msu
:: KB2852386 - Disk Cleanup Wizard addon
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2852386-x64_3f924a0866401d6796413ad46ada8bb862e6c2c9.msu
:: KB2853952 - Hyper-V virtual IDE controller fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2853952-x64_619538e685f0bc6bcde779a1a0b80ed5611f27e7.msu
:: KB2891804 - FTP client fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2891804-x64_ce3ac5c79d2220768e2d3eb5949b90edb9609b6f.msu
:: KB2893519 - SspiPromptForCredentials fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2893519-x64_ae0f3e01c32cf3adbb340cf835e745360188021d.msu
if not "%AddWDFUpdate%"=="0" (
  :: KB2685811 - Kernel-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685811-x64_191e09df632b70fd4f4b27d4cb9227f7c5a1c98c.msu
  :: KB2685813 - User-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2685813-x64_22a969bada171678b0936bb320e6a7778e8adc07.msu
)
if not "%AddTPM2Support%"=="0" (
  :: KB2920188 - TPM 2.0
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2920188-v7-x64_4c7630277e9efaa814d922bc9ea941f3b649d16d.msu
)
if not "%AddNVMeSupport%"=="0" (
  :: KB2990941 - NVMe drivers
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2990941-v3-x64_05db16b151e786805b5ceabc6cfdbb4915e8082f.msu
  :: KB3087873 - NVMe drivers update
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3087873-v2-x64_098e3dc3e7133ba8a37b2e47260cd8cba960deb8.msu
)
:: KB3078667 - Fix memory leak in dwm.exe
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3078667-x64_7cbc9f4467945130fffbdb5aee4daf7e15f78ba7.msu
:: KB3080079 - RDS support for TLS 1.1 and TLS 1.2
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3080079-x64_2cb24acbc7ecbad33d452fdb00a57343e90dc3e5.msu
:: KB3137061 - VM SCSI disks fix
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3137061-x64_a09a61d82b7ea2b137c4a84f563ea2f4fd9776e3.msu
:: KB3140245 - Set TLS 1.1 and TLS 1.2 as default secure protocols in WinHTTP
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3140245-x64_5b067ffb69a94a6e5f9da89ce88c658e52a0dec0.msu
:: KB3161102 - Windows Journal removal
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3161102-x64_3ade1fbc413cae1afc0d3f1e1d10379ef4b44aad.msu
:: KB3179573 - August 2016 update rollup
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3179573-x64_0ec541490b3f7b02e41f26cb2c444cbd9e13df4d.msu
:: KB4019990 - d3dcompiler_47.dll
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4019990-x64_35cc310e81ef23439ba0ec1f11d7b71dd34adfe5.msu

:: Monthly Security Only Updates
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3192391-x64_8acd94d8d268a6507c2852b0d9917f4ae1349b6c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3197867-x64_6f8f45a5706eeee8ac05aa16fa91c984a9edb929.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3205394-x64_71d0c657d24bc852f074996c32987fb936c07774.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3212642-x64_f3633176091129fc428d899c93545bdc7821e689.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4012212-x64_2decefaa02e2058dcd965702509a992d8c4e92b3.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4015546-x64_4ff5653990d74c465d48adfba21aca6453be99aa.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4019263-x64_d64d8b6f91434754fdd2a552d8732c95a6e64f30.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4022722-x64_ee5b5fae02d1c48dbd94beaff4d3ee4fe3cd2ac2.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4025337-x64_c013b7fcf3486a0f71c4f58fc361bfdb715c4e94.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4034679-x64_ccabab6aefd6c16454fac39163ae5abc2f4f1303.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4039884-v2-x64_9a38a042759ee7f4b2b3d235822a13414421542c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4038779-x64_101eabd1c808a526c500d2589dc7077417693d79.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4041678-x64_f55123caaf35a98d2056dc81a5d4a185f148601a.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4048960-x64_e86abddbeecff64956c21d98e329372edb54a413.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4055038-x64_8b56f3ba047610fcd78e10d5b1513753233e97bf.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4054521-x64_8db86e8518b1254d044f9633a205ec1077a29cd9.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4056897-x64_2af35062f69ce80c4cd6eef030eda31ca5c109ed.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4073578-x64_dcd4f238ff6a5948c962d2f9fedc8bca91cc5e66.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4074587-x64_cdc1b385546eca73c15e870e3b5f9e55e2d0ba3a.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4088878-x64_59e25abf3a0c18f9fab5128bad26d3311bedd2d6.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4093108-x64_fe804365f849cc61b133fda1efae299c534b830f.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4103712-x64_44bc3455369066d70f52da47c30ca765f511cf68.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4284867-x64_c2ecdf5620a36f257537e2e10c797f3ab572a7fe.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4338823-x64_a141926d69d13f84e280086cb70b9b37dd590219.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4345459-x64_b25787ba69cb98de9f4c82588c306c48d0d2ae9b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4343899-x64_09b367dfef2423a314f52325ce82d8675b2c5611.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4457145-x64_b9404d9790106da7b6ee732a406f9d15a1b5242e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4462915-x64_63d42d3fb635f643f43e87d762b6077998735469.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4467106-x64_ee54f25e11ccbb5d9eea964bbed2838583169ee5.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4471328-x64_f9ae741bb45b98421d159469e57d765451a4d950.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4480960-x64_bd23adfd0d82403d58aa8cd649636d136cf77700.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4486564-x64_ad686ee44cfd554e461c55d1975d377b68af5eca.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4490628-x64_d3de52d6987f7c8bdc2c015dca69eac96047c76e.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4474419-v3-x64_b5614c6cea5cb4e198717789633dca16308ef79c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3042058-x64_4e7e044dbb5c095851bd1c28c9d8eb5c17975e10.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4489885-x64_3456932a9c8da3cde6a436d26f502126188332a0.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4493448-x64_26274aef6de2f6b66e71f4a8ae51539238d1ec2d.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4499175-x64_3704acfff45ddf163d8049683d5a3b75e49b58cb.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4503269-x64_d518b12868bb1202a03fbc33c2d716092ae9c2e2.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4508772-x64_34a91f1177babd1d28069ebbdb3a5bc37f45bc57.msu
if not "%AllowDiagTrackUpdates%"=="0" (
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4507456-x64_6aa110cb2d01b8f291d1ea2c3cdc5e82204686ed.msu
)
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4512486-x64_547fe7e4099c11d494c95d1f72e62a693cd70441.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4517297-x64_6c27bad12668a2552e36b1753e913e10d61e88ad.msu
if not "%AllowDiagTrackUpdates%"=="0" (
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4516033-x64_976486f9defe12ce403bdacfd932cb6f97540f0e.msu
)
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4520003-x64_8abb11ba896edd5efc66dbfdec40d16773f82398.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4525233-x64_48aa33c778e3b612e8bcf65085536f7e329ef2b8.msu
if not "%AllowEOSNotifyUpdates%"=="0" (
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4530692-x64_511527c76fedbddc1a95b554300392f9b79f7193.msu
  Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4534314-x64_634139bc9fc7d079c56fb845601a80ce3ef102d8.msu
)

:: IE11 Cumulative Update
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\ie11-windows6.1-kb4534251-x64_91ee2d40871aba94d4c13eaaa623c7f4b6577e46.msu

:: .Net 3.5 Updates
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2604115-x64_f803cbb37f3ff118c75241f830755dd540e17cc5.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2729452-x64_d3342805368088b5d893d96267ac0be5edfd81d6.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2736422-x64_8012d0310c4e3a74fbb64ea25d7f6050ec019201.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2742599-x64_d00e2e3bafa37096b6a83f9fc0d611ac2241d832.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2789645-x64_bbc2a9e0fef17440f8b25b5a578fb6ef6337de26.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2840631-x64_7d86527ca72d6fd1bb59a6df80126d568867c48b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2861698-x64_ffad7f02ee876e2735c248d57720118b60d4b163.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2894844-x64_71b051d4b2eae12423868e28b0e5b04a9e10c048.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2911501-x64_8c304d7a8a79af75507086623dc8873eb2fd28c0.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2931356-x64_653280975c830364b9ef78db4140ad08ce551c4b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2937610-x64_4eadbbde029e5d21eb46aaada7b2bd012f211f6f.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2943357-x64_035199134a0e40f5eb6bf83b2781850db5c84d81.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2968294-x64_cff0bafac3c677448c233dc0b596c8a14b9ff58c.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb2972100-x64_ba7fb9e64bca3e59ac2310652357065817b3355b.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3023215-x64_dc454c9dff1a95ad36982a94c15ba2ea98533e6d.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3037574-x64_c9b0b83765a45811a4ab6f3f73b984a479a85732.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3072305-x64_e1b0dcf4ffcd8101e2d191eff934b087ef1af806.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3074543-x64_142519be784f3d2b31327abf2636b3e5637cd4a4.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3097989-x64_4b1ee651904fad58ec31dd9aa3f6de89b7577d47.msu
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb3127220-x64_f1d88d7ada924a174e7b4c24d16229360de95cff.msu

:: .Net 3.5 Cumulative Update
Dism /Image:C:\Build\x64\mount\install /Add-Package /Packagepath:C:\Build\x64\updates\windows6.1-kb4532945-x64_d070fb06c4c56f70e4d2e891181028fa7c35694d.msu

:: Post Install
reg load HKEY_USERS\BUILD C:\Build\x64\mount\install\Users\default\ntuser.dat
reg IMPORT C:\Build\x64\setup\Scripts\User.reg
reg unload HKEY_USERS\BUILD
reg load HKLM\BUILD C:\Build\x64\mount\install\Windows\System32\config\SYSTEM
C:\Build\x64\tools\PsExec64.exe -accepteula -nobanner -i -s reg IMPORT C:\Build\x64\setup\Scripts\System.reg
reg unload HKLM\BUILD
XCopy /E C:\Build\x64\setup C:\Build\x64\mount\install\Windows\Setup
del C:\Build\x64\mount\install\Windows\Setup\Scripts\System.reg
del C:\Build\x64\mount\install\Windows\Setup\Scripts\User.reg
Dism /Unmount-Wim /MountDir:C:\Build\x64\mount\install /Commit
timeout 2

:: Disable Components
Dism /Mount-Wim /WimFile:C:\Build\x64\files\sources\install.wim /Index:1 /MountDir:C:\Build\x64\mount\install
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Chess"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"FaxServicesClientPackage"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"FreeCell"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Hearts"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"InboxGames"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Internet Backgammon"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Internet Checkers"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Internet Games"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Internet Spades"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Minesweeper"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"More Games"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"MSRDC-Infrastructure"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"OpticalMediaDisc"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Printing-XPSServices-Features"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"PurblePlace"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Shanghai"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Solitaire"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"SpiderSolitaire"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"TabletPCOC"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"WindowsGadgetPlatform"
Dism /Image:C:\Build\x64\mount\install /Disable-Feature /FeatureName:"Xps-Foundation-Xps-Viewer"
Dism /Unmount-Wim /MountDir:C:\Build\x64\mount\install /Commit
timeout 2

C:\Build\x64\tools\imagex.exe /COMPRESS maximum /EXPORT "C:\Build\x64\files\sources\install.wim" 1 "C:\Build\x64\files\sources\windows.wim" "Windows 7"
C:\Build\x64\tools\imagex.exe /info "C:\Build\x64\files\sources\windows.wim" 1 "Windows 7" "Windows 7"
del C:\Build\x64\files\sources\install.wim
move C:\Build\x64\files\sources\windows.wim C:\Build\x64\files\sources\install.wim
timeout 2

C:\Build\x64\tools\oscdimg.exe -bootdata:2#p0,e,b"C:\Build\x64\files\boot\etfsboot.com"#pEF,e,b"C:\Build\x64\files\efi\microsoft\boot\efisys.bin" -o -h -m -u2 -udfver102 -l"WINDOWS_DVD" "C:\Build\x64\files" "WINDOWS_DVD.iso"
