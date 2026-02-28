# Home Assistant Add-on: SimpleX XFTP Server
## How to use
1. Open **Configurations** tab
    1. Fill out **Options**:
        - **addr** — The public domain or IP of your server. Example: `xftp1.example.com` or `1.2.3.4`.
        - **quota** — Total disk quota for stored files. Format: `10gb`, `100gb`, etc.
        - **pass** _(optional)_ — Password to protect the server.
        - **port** — The port the XFTP server is reachable on. **Must match** the host port you set in the Network section of this addon. Default: `443`.
    2. Set the host port under **Network** to the same value as the `port` option above. If they differ, the printed server address will be wrong and clients won't be able to connect.
2. Save and start the addon
3. Open logs and find **the first** print with server address. Copy it and paste to your SimpleX Chat app.
