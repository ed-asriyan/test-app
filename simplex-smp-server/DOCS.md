# Home Assistant Add-on: SimpleX SMP Server
## How to use
1. Open the **Configuration** tab and fill in the options (see below).
2. Under **Network**, set the host port to the same value as the `port` option.
3. Save and start the addon.
4. Open **Log** and find the printed server address. Copy it into your SimpleX Chat app.

## Options

| Option                 | Required | Default | Description                                                                                                                 |
| ---------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------- |
| `addr`                 | Yes      |         | Public domain or IP of your server. Example: `smp1.example.com` or `1.2.3.4`.                                               |
| `port`                 | Yes      | `5223`  | Port the server listens on. **Must match** the host port set in the Network section.                                        |
| `pass`                 | No       |         | Password required to create new queues. The address format becomes `smp://fingerprint:password@host`.                       |
| `new_queues`           | Yes      | `true`  | Allow creating new messaging queues. Set to `false` to decommission the server while existing connections continue to work. |
| `restore_messages`     | Yes      | `true`  | Save and restore undelivered messages across server restarts                                                                |
| `expire_messages_days` | Yes      | `21`    | Automatically delete undelivered messages after this many days.                                                             |
| `expire_ntfs_hours`    | Yes      | `24`    | Automatically delete undelivered notifications after this many hours.                                                       |
