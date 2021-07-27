@echo off

set UpdateBootWim=1
set es-ES_LangSupport=0
set AllowDiagTrackUpdates=0
set AllowEOSNotifyUpdates=0
set AddWDFUpdate=0
set AddNVMeSupport=0

if "%UpdateBootWim%"=="0" goto IE11

Dism /Mount-Wim /WimFile:C:\Build\x86\files\sources\boot.wim /Index:1 /MountDir:C:\Build\x86\mount\boot
:: Advanced Format Disk
Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb982018-v3-x86_b009d84249f14d4eaae7aa522be37c38dd83531b.msu
if not "%AddWDFUpdate%"=="0" (
  :: KB2685811 - Kernel-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685811-x86_4db620a8b8e85bab4822626530d01fd923c28786.msu
  :: KB2685813 - User-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685813-x86_d2c51b6b97d4ffcb069bcaafbff3135e96fe18e5.msu
)
if not "%AddNVMeSupport%"=="0" (
  :: KB2990941 - NVMe drivers
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2990941-v3-x86_7efeb5761e5e0eec0660636a1955c3d860c87ddf.msu
  :: KB3087873 - NVMe drivers update
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3087873-v2-x86_6e63b2150058e51f8a601c7d09a32ba61ad3254a.msu
)
Dism /Unmount-Wim /MountDir:C:\Build\x86\mount\boot /Commit
timeout 2

Dism /Mount-Wim /WimFile:C:\Build\x86\files\sources\boot.wim /Index:2 /MountDir:C:\Build\x86\mount\boot
:: Advanced Format Disk
Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb982018-v3-x86_b009d84249f14d4eaae7aa522be37c38dd83531b.msu
if not "%AddWDFUpdate%"=="0" (
  :: KB2685811 - Kernel-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685811-x86_4db620a8b8e85bab4822626530d01fd923c28786.msu
  :: KB2685813 - User-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685813-x86_d2c51b6b97d4ffcb069bcaafbff3135e96fe18e5.msu
)
if not "%AddNVMeSupport%"=="0" (
  :: KB2990941 - NVMe drivers
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2990941-v3-x86_7efeb5761e5e0eec0660636a1955c3d860c87ddf.msu
  :: KB3087873 - NVMe drivers update
  Dism /Image:C:\Build\x86\mount\boot /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3087873-v2-x86_6e63b2150058e51f8a601c7d09a32ba61ad3254a.msu
)
Dism /Unmount-Wim /MountDir:C:\Build\x86\mount\boot /Commit
timeout 2

:IE11
Dism /Mount-Wim /WimFile:C:\Build\x86\files\sources\install.wim /Index:1 /MountDir:C:\Build\x86\mount\install
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2729094-v2-x86_565e7f2a6562ace748c5b6165aa342a11c96aa98.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2758857-x86_48f788c1ff97e942eb12358a21abdc40d8b24b8d.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2670838-x86_984b8d122a688d917f81c04155225b3ef31f012e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2786081-x86_70122aca48659bfb8a06bed08cb7047c0c45c5f4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2834140-v2-x86_b57c05e9da2c66e1bb27868c92db177a1d62b2fb.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2888049-x86_65b4c7a5773fab177d20c8e49d773492e55e8d76.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\IE-Win7_7e3a516bb89e7275434dd7423574c646632899d5.CAB
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\IE-Spelling-en_eb351282502a45726223354a4e92d17807d78bbb.MSU
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\IE-Hyphenation-en_092773d1a202d185aa4b0e756e29e6bc80575f0e.MSU
if not "%es-ES_LangSupport%"=="0" (
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\ielangpack-es-ES_ce6d1dfaeed5982b016eb7931815f4cb88b2d7b8.CAB
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\IE-Spelling-es-ES_51ba34590e81e0958affe0a4c35682cb5fed5fb4.MSU
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\IE-Hyphenation-es-ES_a5b7b66d02be18bbc23396138decf8a2afd52c85.MSU
)
Dism /Unmount-Wim /MountDir:C:\Build\x86\mount\install /Commit
timeout 2

:: Security Updates
Dism /Mount-Wim /WimFile:C:\Build\x86\files\sources\install.wim /Index:1 /MountDir:C:\Build\x86\mount\install
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2479943-x86_7d894172a7fd5fc57ee6bc46a45bda63a9c39ab4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2491683-x86_2b4be9a49c94a1d0f82d9e4d81f5c6fa3e0c2020.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2506212-x86_6d449661f43e7a7ca489153d81aa194bbcdff2ed.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2532531-x86_7af439d768fd644cf4b1f75c644da232cae7c6d9.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2552343-x86_539c92fad1e6453d4970cdf3621ef4ec42dc2060.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2560656-x86_6fb7211c324d182af0aa6b72b44fadb75a0cbb3a.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2564958-x86_70f8e25ef01e736db5bd3cfa9ac86252c5ec980a.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2579686-x86_6dd5fc4cade4361d2e1a568519ad56c9c6113161.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2620704-x86_96ca77b9686a25ecc94acfdb4e2c34a164e2e9fd.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2621440-x86_2e25bf396aaba95c314693104ef67aff8c143959.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2631813-x86_4df2ef6c53351932b30aeb2d34f1b8c1f2c35220.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2653956-x86_e6c5e179d7c2336f2e599cb20c024b2eb7cdd9ac.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2654428-x86_022bc62d902450b9fd9c059bee4470259d72e281.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2667402-v2-x86_eec6812d9c6f710a6c1e640e8b928c99f215f39e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685939-x86_cac98814ead01349d47680ad3ee187024d6b105a.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2690533-x86_b6d7cced04f684e14527d6e9ea8c1b2d303fe6c9.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2698365-x86_d9f8e37cc61ab4abce802c29fe20a8e270321373.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2705219-v2-x86_9ebf7a4b272e9e24c0ecc8922223e026aab04853.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2727528-x86_b709c87e288114e6556e0d6010ba31daaff6716d.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2770660-x86_e536b7930c06af0a064eae92804702c7fee5186b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2807986-x86_834332ee20d163a0149f3e7158a3ba2a1768f035.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2813430-x86_c82381fd35c3bc0003e4a921e777cd26bf432eea.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2847927-x86_331e481338a40ecd1682ee95179e906eccb84757.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2862152-x86_eac008f3d7e22b10e646d969656c48c25fadc6b4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2862330-v2-x86_a6f3c9b5811bd869cf6834acb96c4a0232588c9b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2864202-x86_9e556e48e72ae30ec89c5f1c713acde26da2556a.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2868038-x86_0457a8b39e4acecc53baac5fdbff492b59afe7a0.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2871997-v2-x86_ac7d3e152836915afbf4a4ec4a40a50f32823e6f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2884256-x86_5be9d70862ca30247188dc79d63008108270b2c0.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2893294-x86_bac3e8a6e25d031fca8984ecd73ad2a6b69f7997.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2900986-x86_a993e450237ad5109c06691b47cea6aedb86642f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2912390-x86_235cde723bac4de224ab94eda3931adf8a2ba986.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2973201-x86_f9bcd5ca097ad978ed5ca19e3cf3556e0b381882.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2977292-x86_04cf6aa80a03e28472a0f2ac036f4976a1b535b8.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2978742-x86_ad7b31025c839af6b6cc2da26cca3478e069bfc2.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2984972-x86_0447ea81b8cfafde3f7454721070c6d6599c58d7.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2991963-x86_5432a41364f2de05edcac6ebefb07cd3dd1b1c80.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2992611-x86_814892fe3b23030fa2c44891fdb5f24574b0aa17.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3004375-v3-x86_822f779b87d3cd4ef4de004c344abce202a8aac6.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3010788-x86_de223a1be099fb87d0ed7bdde34b4c9a556fbec7.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3011780-x86_49e91e1439694e38d117aa0a1da8ee65c3c3b849.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3019978-x86_b6845afc1c86a99e8d663036215df67eadd83ec1.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3021674-x86_1d01fc69427400c8f7de387dea48fb9d1acd05f4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3022777-x86_8f68cad0fdcf82b019582c0fdf1eecd1cba672cd.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3030377-x86_8e7aeadba26fd06f5c2c98d8481d96278333094f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3031432-x86_6ba33eba05ec8fe744e2786f6b72965d119274d8.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3035126-x86_65e46b3d10323cee458b2ed8906b4395a3407e55.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3045685-x86_4fd2c3120125222145adff12d4c3d5d4966c28b2.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3046017-x86_3488cdf522e5efab03c0f9325bfd40d4f1c8b0e6.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3046269-x86_dad279443dc5e3446bb2b478252c90d5f115faf1.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3059317-x86_7dbad42dd71389bb65948b81220fc019d77c8b77.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3060716-x86_3343f0fc7f59da31f5fde1ef09acd148b59ba815.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3061518-x86_2fc5e70559834e4020002b3e3bc14e951f57e054.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3067903-x86_da835b25f8fc030e272b8b20a6381fc1167b28d0.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3071756-x86_31bf25fd49f04f2397666a6ff45d5f676202efc9.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3086255-x86_2c6997a6be96e7542413a38af4c92c3aaa562393.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3093513-x86_a4bd5e6e7933351d527aca55ff9eaf311e0592f2.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3108371-x86_3ae19bf9be2f7dc8c8543378844ae9a91d9d2976.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3108664-x86_b2e783ad9a7c5fa97d339ed40609692fd5a6eb1e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3109103-x86_c0f1ce4eafbe4a952a0ff22199f7952fd82b865f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3109560-x86_a6437abb26830d61d6e3aaf458252caa9996ba8b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3110329-x86_88310fe80c3ef4690ab91a89c7af2c6d3baff7a3.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3115858-x86_11f3b68870f5c03dd66232da895b212d52b9f950.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3126587-x86_2cc12374530d761edd469fa823c3547fd3b6acae.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3138612-x86_6e90531daffc13bc4e92ecea890e501e807c621f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3138910-x86_e881714d67d8761a20df086510e57b29fee06058.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3139398-x86_3413ef7a8fb60c9f7561838af5a505dd5fd9fcf1.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3139914-x86_3df17382a74df45c63dff5c1ed5858866e108a40.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3150220-x86_f3529b8f2f21ea56c6e997ff654d59e4f65d2d6e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3156016-x86_ea2cf88a256d4138109847ddc5cec66f3f660efa.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3159398-x86_c4fa9c67178bef5dbcbd72cde2fe94f5126337e5.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3161949-x86_0055d0d1e103d374e042f31ebdd26931853b882b.msu

:: Optional Updates
:: KB982018  - Advanced Format Disk
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb982018-v3-x86_b009d84249f14d4eaae7aa522be37c38dd83531b.msu
:: KB2574819 - DTLS protocol
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2574819-v2-x86_219ef0b5d7e89489e3f0f01e264ec576cc3d66ad.msu
:: KB2640148 - USB drive fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2640148-v2-x86_fbd67bb52c3c78a6acdf20fff7c50cdd3809c7ed.msu
:: KB2719857 - 4G network
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2719857-x86_bbe53b55c9335c6da54aae9c71d9bfbc113e203b.msu
:: KB2732059 - Add XPS .oxps format
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2732059-v5-x86_dccdcff2975521afd586b44c0f66c6ef7d38b749.msu
:: KB2750841 - IPv6 readiness
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2750841-x86_e7863547b2b41fc18bc4c576e822107655747981.msu
:: KB2761217 - Calibri Light
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2761217-x86_b480557292b2a27b39c7b9bcfa66374473a94254.msu
:: KB2799926 - USB drive fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2799926-x86_a1a969ac2972ef6c392af2a372a97ec96fc4eb8a.msu
:: KB2800095 - Smart Card fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2800095-v2-x86_b9f45f4653b51bef3b4e314a055e7721a1b75adb.msu
:: KB2808679 - Protect from internal URL port scanning
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2808679-x86_cc43f0d998ba3b7c9aa170b5c7bdb95d6da4525a.msu
:: KB2852386 - Disk Cleanup Wizard addon
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2852386-x86_f94486e3eb81ec987c923c76553611ea356de6ce.msu
:: KB2853952 - Hyper-V virtual IDE controller fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2853952-x86_8d00592d0e44d06497f81ebe501a9ef4993df0e6.msu
:: KB2891804 - FTP client fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2891804-x86_8c124c4915c7eb31bb59c9314b2e367e338796f5.msu
:: KB2893519 - SspiPromptForCredentials fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2893519-x86_2777298fab6999a09b4f7290df3be051fbae04cd.msu
if not "%AddWDFUpdate%"=="0" (
  :: KB2685811 - Kernel-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685811-x86_4db620a8b8e85bab4822626530d01fd923c28786.msu
  :: KB2685813 - User-Mode Driver Framework version 1.11
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2685813-x86_d2c51b6b97d4ffcb069bcaafbff3135e96fe18e5.msu
)
if not "%AddNVMeSupport%"=="0" (
  :: KB2990941 - NVMe drivers
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2990941-v3-x86_7efeb5761e5e0eec0660636a1955c3d860c87ddf.msu
  :: KB3087873 - NVMe drivers update
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3087873-v2-x86_6e63b2150058e51f8a601c7d09a32ba61ad3254a.msu
)
:: KB3078667 - Fix memory leak in dwm.exe
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3078667-x86_f17f709bae924d9866be78af4ce3f0dcd6cb81f9.msu
:: KB3080079 - RDS support for TLS 1.1 and TLS 1.2
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3080079-x86_1b0379e5731934f6f14456588348e9f371d0c4df.msu
:: KB3137061 - VM SCSI disks fix
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3137061-x86_63e793080d225693b7ba988c2d6d5689ab79c7a0.msu
:: KB3140245 - Set TLS 1.1 and TLS 1.2 as default secure protocols in WinHTTP
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3140245-x86_cdafb409afbe28db07e2254f40047774a0654f18.msu
:: KB3161102 - Windows Journal removal
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3161102-x86_68e520bf57bf2f0e82af9b8577b7e0b056717ab4.msu
:: KB3179573 - August 2016 update rollup
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3179573-x86_e972000ff6074d1b0530d1912d5f3c7d1b057c4a.msu
:: KB4019990 - d3dcompiler_47.dll
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4019990-x86_1365fb557d5e5917cbf59b507eac066ad89ea3f7.msu

:: Monthly Security Only Updates
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3192391-x86_a9d1e3f0dea012e3a331930bc1cd975005827cb6.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3197867-x86_2313232edda5cca08115455d91120ab3790896ba.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3205394-x86_e477192f301b1fbafc98deb94af80c6e94231e54.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3212642-x86_d5906af5f1f0dc07a5239311b169619ce255ab12.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4012212-x86_6bb04d3971bb58ae4bac44219e7169812914df3f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4015546-x86_a753365290d940872860776113f226436a18ca9b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4019263-x86_e978e662d844d13ccf726944c39e4b678159bcde.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4022722-x86_28f72705aa3aa2a52994bda4600cc6bbc3a2bca6.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4025337-x86_81a37e4187f7d9137159ba11ed24459dcc482895.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4034679-x86_85c67d369707044c0659b63e06c9dc3c10768e95.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4039884-v2-x86_02559e35643b19ab38e8533e7286be13b2f7b37e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4038779-x86_2b8dc6efc21dae05e188d986ddfeb21c4a0a27a6.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4041678-x86_a8054e75c3579564570a5acec859a31af43be2f4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4048960-x86_a8a12cd492c959099da690c6a868d0291eee99a2.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4055038-x86_997104549cb30a8bd6a8fd51d41b986b0ba53cdb.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4054521-x86_439c796ff835a118567d39b8c19cdcce20ef7a14.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4056897-x86_bb612f57e082c407b8cdad3f4900275833449e71.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4073578-x86_94fcf4e316d99e10d482abd5b644593a062dd21e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4074587-x86_4acde011f9386e8555109c8a06d406bbcee20a99.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4088878-x86_7512ab54d6a6df9d7e3d511d84a387aaeaeef111.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4093108-x86_f0e2e9c3d7cb132c358aa790b891eed37253fa36.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4103712-x86_9e9ca80634e4f94e95cc3a02eaea374b328f0f9d.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4284867-x86_e841ad96c7b70dd96aae7720ed10fe56b70fd884.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4338823-x86_4b18056251ec97112381473c933b7964c778d4ed.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4345459-x86_022e33c702492e68ceec50725fea6fe6bdeba88e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4343899-x86_0d9ef0cfeca3da376193a05088c6d172774378dc.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4457145-x86_7b0fbc85360a4117eaae84c7088ccd09eac7527f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4462915-x86_bfcfa4c0997862cd2c0f8cd3df6f38bdacf6d07b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4467106-x86_e50f03c417cbe4ec2acbdcd6cd609c23bbc656fc.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4471328-x86_bf41fb711ea06d24ac27361bba39d3bee0aa56a2.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4480960-x86_dc89957c2ba506cef74cdf6760dc73237a067b9a.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4486564-x86_4b0702863cf9aeea96f06ebb99778922019b7ff4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4490628-x86_3cdb3df55b9cd7ef7fcb24fc4e237ea287ad0992.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4474419-v3-x86_0f687d50402790f340087c576886501b3223bec6.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3042058-x86_43f903af3a098660965bb60c7f870a2b80b656a4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4489885-x86_8078e687b908bf6319d77d48fc2f70e0f67dfcf5.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4493448-x86_187831a12093488fb2fc5be81af26f8f8d0fb386.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4499175-x86_6f1319c32d5bc4caf2058ae8ff40789ab10bf41b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4503269-x86_525652cb7e59c7ec922ff4e7efc60426d10cbe14.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4508772-x86_b852e3552dbca976ceb92b5cbbfeb240f2fe5eb6.msu
if not "%AllowDiagTrackUpdates%"=="0" (
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4507456-x86_41556c1452fcaadce2984d9e4ee9fe6068f38e29.msu
)
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4512486-x86_4c88f71af8e9d07e5fb141d7aed0bcc7f532781e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4517297-x86_9321421c6bda4a3a3471fb01521f1ef283eeb9e3.msu
if not "%AllowDiagTrackUpdates%"=="0" (
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4516033-x86_a6edd53b7a26c1dd6f74e10a57554dd082e7b4ae.msu
)
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4520003-x86_86ac80d58f564c48502a7e2e65b64f7fd1fd2c10.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4525233-x86_53b4c81f12784e2c13f3d1edd3cb639d339ec65e.msu
if not "%AllowEOSNotifyUpdates%"=="0" (
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4530692-x86_3cf61cbfabb6a62909f5b856c8e41907ffbb4639.msu
  Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4534314-x86_8db043d6362034a2235a5f10f62c907d5f09668c.msu
)

:: IE11 Cumulative Update
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\ie11-windows6.1-kb4534251-x86_6841cf7fda1f2b47d237fa66837c155ffa45c688.msu

:: .Net 3.5 Updates
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2604115-x86_ce7a451847e64a24f0d847374df553967fbc8bfd.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2729452-x86_e3e3e5a5c39b64ee6967e6001202db360d4af31e.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2736422-x86_a7853add16b14609c9b34348b52878b15eb9410f.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2742599-x86_4635e7bd952943828ed081f8aa5af53dfe5919a1.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2789645-x86_c18ffa86730f7c050e55415e087766090058ba71.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2840631-x86_d92c8e47b77676ed5ff3a0a4ce41b5cbbc3aeaa4.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2861698-x86_a72b2ff407544a6b87006f70fbc17667c15c66a2.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2894844-x86_d628cb41a17b6cee85c3bdf3e4612219fb7257ba.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2911501-x86_5a0d066e5a944d4568d34a4c19ccb050c3dcc069.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2931356-x86_63227724e483ccf74c3758070282f5506176e937.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2937610-x86_d90a5d24f180953737b45d7883b16347b00874d0.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2943357-x86_b4b1831a98ce4bf16dda9e2432cf2eb1fe598cb7.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2968294-x86_5d007341c62969877271e7aa20607281bc8c338b.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb2972100-x86_2ed06d2b5d61481a10c30622ee9b3065f23aecc7.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3023215-x86_5a3149242c9361da3ec722cd1ecaf91337c262a0.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3037574-x86_76628701022bc09846327d2ce164f07411869a5a.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3072305-x86_8514a610fc87bf01cf239c8472a13f32bb63a894.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3074543-x86_2c5e35baae5bfa1a4e4d49f55af2988cc4dac9ad.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3097989-x86_6e8b76304c2a9530929b42676357472c034f06fb.msu
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb3127220-x86_e37990f67b986ebb8acc886cc0b5efee9ad51de9.msu

:: .Net 3.5 Cumulative Update
Dism /Image:C:\Build\x86\mount\install /Add-Package /Packagepath:C:\Build\x86\updates\windows6.1-kb4532945-x86_0438d1eece17622a078b0d08dd6e812a67a09f37.msu

:: Post Install
reg load HKEY_USERS\BUILD C:\Build\x86\mount\install\Users\default\ntuser.dat
reg IMPORT C:\Build\x86\setup\Scripts\User.reg
reg unload HKEY_USERS\BUILD
reg load HKLM\BUILD C:\Build\x86\mount\install\Windows\System32\config\SYSTEM
C:\Build\x64\tools\PsExec64.exe -accepteula -nobanner -i -s reg IMPORT C:\Build\x86\setup\Scripts\System.reg
reg unload HKLM\BUILD
XCopy /E C:\Build\x86\setup C:\Build\x86\mount\install\Windows\Setup
del C:\Build\x86\mount\install\Windows\Setup\Scripts\System.reg
del C:\Build\x86\mount\install\Windows\Setup\Scripts\User.reg
Dism /Unmount-Wim /MountDir:C:\Build\x86\mount\install /Commit
timeout 2

:: Disable Components
Dism /Mount-Wim /WimFile:C:\Build\x86\files\sources\install.wim /Index:1 /MountDir:C:\Build\x86\mount\install
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Chess"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"FaxServicesClientPackage"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"FreeCell"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Hearts"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"InboxGames"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Internet Backgammon"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Internet Checkers"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Internet Games"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Internet Spades"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Minesweeper"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"More Games"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"MSRDC-Infrastructure"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"OpticalMediaDisc"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Printing-XPSServices-Features"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"PurblePlace"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Shanghai"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Solitaire"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"SpiderSolitaire"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"TabletPCOC"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"WindowsGadgetPlatform"
Dism /Image:C:\Build\x86\mount\install /Disable-Feature /FeatureName:"Xps-Foundation-Xps-Viewer"
Dism /Unmount-Wim /MountDir:C:\Build\x86\mount\install /Commit
timeout 2

C:\Build\x64\tools\imagex.exe /COMPRESS maximum /EXPORT "C:\Build\x86\files\sources\install.wim" 1 "C:\Build\x86\files\sources\windows.wim" "Windows 7"
C:\Build\x64\tools\imagex.exe /info "C:\Build\x86\files\sources\windows.wim" 1 "Windows 7" "Windows 7"
del C:\Build\x86\files\sources\install.wim
move C:\Build\x86\files\sources\windows.wim C:\Build\x86\files\sources\install.wim
timeout 2

C:\Build\x64\tools\oscdimg.exe -bootdata:1#p0,e,b"C:\Build\x86\files\boot\etfsboot.com" -o -h -m -u2 -udfver102 "C:\Build\x86\files" -l"WINDOWS_DVD" "WINDOWS_DVD.iso"
