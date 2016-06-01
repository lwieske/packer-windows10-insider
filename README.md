# Packer-Windows10-Insider (May 2016)

Makes a Windows 10 x64 box for use with Virtualbox.

Inspired by so many other repositories on GitHub.

| Build	| Version | Codename | Date |
|---:|---:|---|---|
| 10240	| | Threshold1 | July 2015 |
| 10586	| 1511 | Threshold2 | November 2015 |
| **14352**	| **1607** | **Redstone** | **May 2016** |

```
$ packer build -force -only=virtualbox-iso windows10-insider.json

$ vagrant box add --name windows10-insider builds/windows10-insider.virtualbox.box --force

$ vagrant init windows10-insider

$ vagrant up
```

This repository is based on **Insider Preview 14352 (May 2016)** and the build does the following:

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
