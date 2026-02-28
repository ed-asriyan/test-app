# Home Assistant Add-on: SimpleX XFTP Server

## How to use
1. Open the **Configuration** tab and fill in the options (see below).
2. Under **Network**, set the host port to the same value as the `port` option.
3. Save and start the addon.
4. Open **Log** and find the printed server address. Copy it into your SimpleX Chat app.

## Options
| Option               | Required | Default | Description                                                                                                                                 |
| -------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `addr`               | Yes      |         | Public domain or IP of your server. Example: `xftp1.example.com` or `1.2.3.4`.                                                              |
| `port`               | Yes      | `443`   | Port the server listens on. **Must match** the host port set in the Network section.                                                        |
| `quota`              | Yes      | `10gb`  | Total disk quota for stored files. Format: `10gb`, `100gb`, etc.                                                                            |
| `pass`               | No       |         | Password required to upload files. Shared only with upload-authorized users. The address format becomes `xftp://fingerprint:password@host`. |
| `expire_files_hours` | Yes      | `48`    | Automatically delete files after this many hours.                                                                                           |
| `new_files`          | Yes      | `true`  | Allow uploading new files. Set to `false` to decommission the server while still allowing downloads of existing files.                      |
