# Packer-Windows10-Insider ( 19H1 / 18343 / März 2019 )

Makes a Windows 10 x64 box for use with Virtualbox.

Inspired by so many other repositories on GitHub.

`https://docs.microsoft.com/en-us/windows-insider/flight-hub/`

## Skip Ahead and Fast builds for Windows 10 (20H1)

You can get builds of 20H1 today if you've opted in to Fast builds.
The items in bold are the latest releases for the individual versions of the item.

| Build | Fast       | Slow       | ISO        | SDK        |
|------:|-----------:|-----------:|-----------:|-----------:|
| 18885 |  4/26/2019 |            |            |            |
| 18875 |  4/10/2019 |            |            |            |
| 18865 |  3/27/2019 |            |            |            |
| 18860 |  3/20/2019 |            |            |            |
| 18855 |  3/13/2019 |            |            |            |
| 18850 |  3/06/2019 |            |            |            |
| 18845 |  2/28/2019 |            |            |            |
| 18841 |  2/22/2019 |            |            |            |
| 18836 |  2/14/2019 |            |            |            |

## Next feature update for Windows 10 (19H2)

| Build | Fast       | Slow       | ISO        | SDK        |
|------:|-----------:|-----------:|-----------:|-----------:|
|       |            |            |            |            |

## Next feature update for Windows 10 (19H1)

You can get builds of 19H1 today if your device is in the Fast ring.

| Build | Fast       | Slow       | ISO        | SDK        |
|------:|-----------:|-----------:|-----------:|-----------:|
| 18362 |  3/20/2019 |  3/22/2019 |            |            |
| 18361 |  3/19/2019 |            |            |            |
| 18358 |  3/15/2019 |            |            |            |
| 18356 |  3/12/2019 |  3/19/2019 |  3/19/2019 |  3/20/2019 |
| 18353 |  3/08/2019 |            |            |            |
| 18351 |  3/05/2019 |  3/11/2019 |            |  3/12/2019 |
| 18346 |  2/26/2019 |            |  3/05/2019 |  3/06/2019 |
| 18343 |  2/22/2019 |            |  3/12/2019 |            |
| 18342 |  2/20/2019 |  2/27/2019 |            |            |
| 18334 |  2/08/2019 |            |            |  2/12/2019 |
| 18329 |  2/01/2019 |            |            |            |
| 18327 |  2/05/2019 |            |            |            |
| 18323 |  1/24/2019 |            |            |  1/29/2019 |
| 18317 |  1/16/2019 |            |            |  1/22/2019 |
| 18312 |  1/9/2019  |            |            |  1/15/2019 |
| 18309 |  1/3/2019  |            |            |   1/9/2019 |
| 18305 |  2/19/2018 |            |            |            |
| 18298 | 12/10/2018 |            |            |            |
| 18290 | 11/28/2018 |            | 12/11/2018 |  12/4/2018 |
| 18282 | 11/14/2018 |            |            | 11/20/2018 |
| 18277 | 11/07/2018 |            |            |            |
| 18272 | 10/31/2018 |            | 10/31/2018 |  11/6/2018 |
| 18267 | 10/24/2018 |            |            |            |
| 18262 | 10/17/2018 |            |            |            |
| 18252 |  10/3/2018 |            |            |            |
| 18247 |  9/27/2018 |            |            |            |
| 18242 |  9/18/2018 |            |            |            |
| 18237 |  9/12/2018 |            |            |            |
| 18234 |  9/06/2018 |            |            |            |
| 18219 |  8/16/2018 |            |            |            |
| 18214 |  8/10/2018 |            |            |            |
| 18204 |  7/25/2018 |            |            |            |

## Past Release / Redstone 5

## Past Release / Redstone 4

## Past Release / Redstone 3

## Past Release / Redstone 2

## Past Release / Redstone 1

## Past Release / Threshold 2

## Past Release / Threshold 1

```shell
$ packer build -force -only=virtualbox-iso windows10-insider.json

$ vagrant box add --name windows10-insider builds/windows10-insider.virtualbox.box --force

$ vagrant init windows10-insider

$ vagrant up
```

This repository is based on **Insider Preview 18343 (February 2019)** and the build does the following:

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

## TODO

The box startup within vagrant (vagrant up) does not come to an end.

But you can properly do a 'vagrant ssh' to the box, give it a try.