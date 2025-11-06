[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

# ⛔️ DEPRECATED

As of v2.132.0, Ledger SAS has rebranded Ledger Live to [Ledger Wallet](https://shop.ledger.com/pages/ledger-wallet). This Chocolatey package has therefore been deprecated to reflect its rebranding, and has been superseded by [`ledger-wallet`](https://community.chocolatey.org/packages/ledger-wallet).

This repository will remain online only for archival purposes.

>[!Warning]
>I do not have redistribution rights for Ledger Live, so any legacy package versions that were not cached by the Community Repository's CDN are functionally dependent on Ledger SAS continuing to host older installers for Ledger Live on their servers. Therefore, I cannot guarantee they will continue to work indefinitely.

---

# Chocolatey Package: [Ledger Live](https://community.chocolatey.org/packages/ledger-live)

[![Latest package version shield](https://img.shields.io/chocolatey/v/ledger-live.svg)](https://community.chocolatey.org/packages/ledger-live)
[![Total package download count shield](https://img.shields.io/chocolatey/dt/ledger-live.svg)](https://community.chocolatey.org/packages/ledger-live)

## Install

[Install Chocolatey](https://chocolatey.org/install), and run the following command to install the latest approved stable version from the Chocolatey Community Repository:

```shell
choco install ledger-live --source="'https://community.chocolatey.org/api/v2'"
```

Alternatively, the packages as published on the Chocolatey Community Repository (starting with v2.81.2) will also be mirrored on this repository's [Releases page](https://github.com/brogers5/chocolatey-package-ledger-live/releases). The `nupkg` can be installed from the current directory as follows:

```shell
choco install ledger-live --source="'.'"
```

## Build

[Install Chocolatey](https://chocolatey.org/install), clone this repository, and run the following command in the cloned repository:

```shell
choco pack
```

A successful build will create `ledger-live.x.y.z.nupkg`, where `x.y.z` should be the Nuspec's normalized `version` value at build time.

>[!Note]
>Chocolatey package builds are non-deterministic. Consequently, an independently built package's checksum will not match that of the officially published package.

## Update

This package should be automatically updated by the [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au), with update queries implemented with the [PowerShellForGitHub](https://github.com/microsoft/PowerShellForGitHub) and [FXPSYaml](https://www.powershellgallery.com/packages/FXPSYaml) PowerShell modules. If it is outdated by more than a few days, please [open an issue](https://github.com/brogers5/chocolatey-package-ledger-live/issues).

AU expects the parent directory that contains this repository to share a name with the Nuspec (`ledger-live`). Your local repository should therefore be cloned accordingly:

```shell
git clone git@github.com:brogers5/chocolatey-package-ledger-live.git ledger-live
```

Alternatively, a junction point can be created that points to the local repository (preferably within a repository adopting the [AU packages template](https://github.com/majkinetor/au-packages-template)):

```shell
mklink /J ledger-live ..\chocolatey-package-ledger-live
```

Once created, simply run `update.ps1` from within the created directory/junction point. Assuming all goes well, all relevant files should change to reflect the latest version available. This will also build a new package version using the modified files.

Before submitting a pull request, please [test the package](https://docs.chocolatey.org/en-us/community-repository/moderation/package-verifier#steps-for-each-package) using the latest [Chocolatey Testing Environment](https://github.com/chocolatey-community/chocolatey-test-environment) first.
