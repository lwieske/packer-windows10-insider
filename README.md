# Packer-Windows10-Insider (17744/February 2018)

Makes a Windows 10 x64 box for use with Virtualbox.

Inspired by so many other repositories on GitHub.

| Build	| Version | Codename | Date | Marketing Term |
|---:|---:|---|---|---|
| 10240	|      | Threshold1 | July 2015      |                      |
| 10586	| 1511 | Threshold2 | November  2015 |                      |
| 14393	| 1607 | Redstone 1 | July      2016 | Anniversary Update   |
| 15063 | 1703 | Redstone 2	| April     2017 | Creators Update      |
|       | 1709 | Redstone 3	| October   2017 | Fall Creators Update |
|       | 1803 | Redstone 4	| TBA	Early 2018 |                      |
| 17025	|      |            | February 2018  |                      |
|       | 1809 | Redstone 5	| TBA	Late  2018 |                      |

```
$ packer build -force -only=virtualbox-iso windows10-insider.json

$ vagrant box add --name windows10-insider builds/windows10-insider.virtualbox.box --force

$ vagrant init windows10-insider

$ vagrant up
```

This repository is based on **Insider Preview 17025 (February 2018)** and the build does the following:

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
