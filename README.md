# Packer-Windows10-Insider (14393/August 2016)

Makes a Windows 10 x64 box for use with Virtualbox.

**Rumours: Windows 10 Insider Preview build 14393 is RTM of Anniversary Update**

![anniversaryt](http://cdn.redmondpie.com/wp-content/uploads/2016/03/windows-10-update-anniversary.jpg)

Inspired by so many other repositories on GitHub.

| Build	| Version | Codename | Date |
|---:|---:|---|---|
| 10240	| | Threshold1 | July 2015 |
| 10586	| 1511 | Threshold2 | November 2015 |
| **14393**	| **1607** | **Redstone 1** | **July 2016** |

```
$ packer build -force -only=virtualbox-iso windows10-insider.json

$ vagrant box add --name windows10-insider builds/windows10-insider.virtualbox.box --force

$ vagrant init windows10-insider

$ vagrant up
```

This repository is based on **Insider Preview 14393 (August 2016)** and the build does the following:

* Autonunattend.xml
  * update windows
  * enable winrm
* windows10-insider.json
  * restart windows
    * enables rdp
    * (enables ssh)
    * installs guest tools
  * restart windows
    * installs packages
    * does some tweaks
    * compacts the drive
