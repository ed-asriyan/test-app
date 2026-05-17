# SimpleX SMP & XFTP Servers - Home Assistant Add-on Repository
Home Assistant add-ons for self-hosting [SimpleX Chat](https://simplex.chat) [SMP](https://simplex.chat/docs/server.html#overview) and [XFTP](https://simplex.chat/docs/xftp-server.html#overview) servers.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/ed-asriyan/hassio-simplex)

This repository provides two add-ons:
- [SimpleX SMP Server](./simplex-smp-server) for relaying SimpleX messages.
- [SimpleX XFTP Server](./simplex-xftp-server) for relaying SimpleX file transfers.

> [!WARNING]
> Run these add-ons carefully on residential IP addresses!
> It is recommended to enable a password so only you or people you trust can use your server, instead of leaving it open to random users. Otherwise strangers may use it to relay encrypted messages or files, including traffic you would not want associated with your IP address, even though the traffic relayed through and stored on the server remains encrypted.
