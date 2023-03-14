# OVH logs

The goal of this script is to simply download logs from OVH Website hosting for
backup (or further analysis) purposes.

This project uses [bashly](https://bashly.dannyb.co/usage/getting-started/) as
a script generator.

## Usage

```bash
ovh-logs - Script downloading logs from OVH Website Hosting

Usage:
  ovh-logs COMMAND
  ovh-logs [COMMAND] --help | -h
  ovh-logs --version | -v

Commands:
  download   Download logs from a given month

Options:
  --help, -h
    Show this help

  --version, -v
    Show version number

Environment Variables:
  OVH_USER (required)
    User name for accessing OVH logs

  OVH_PASSWORD (required)
    Password for accessing OVH logs

  OVH_URL (required)
    OVH URL for downloading logs. E.g.: logs.clusterxxx.hosting.ovh.net

```

```bash
ovh-logs download - Download logs from a given month

Alias: d

Usage:
  ovh-logs download DOMAIN MONTH YEAR [OUTPUT]
  ovh-logs download --help | -h

Options:
  --help, -h
    Show this help

Arguments:
  DOMAIN
    Domain to download logs for. E.g.: my.website.com

  MONTH
    Month to download logs for

  YEAR
    Year to download logs for

  OUTPUT
    Path to the output directory. Defaults to: ./logs
    Default: ./logs

Examples:
  ovh-logs download my.website.com 01 2023
  ovh-logs download website.com 12 2022 /tmp/ovh-logs
```

## Credits

The scripts here were inspired by following sources:
- https://sylvaindurand.org/access-the-logs-of-a-shared-ovh-server/
- https://std.rocks/ovh_logs.html
