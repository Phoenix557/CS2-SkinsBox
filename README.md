# SkinsBox CS2 Server Plugin

The web app writes loadouts to MySQL. A CounterStrikeSharp plugin on your CS2 server reads those rows and applies skins in-game.

## Recommended: WeaponPaints (fastest path)

1. Install **Metamod:Source** (CS2 dev build) on your dedicated server.
2. Install **CounterStrikeSharp** ([with-runtime release](https://github.com/roflmuffin/CounterStrikeSharp/releases)).
3. Download [cs2-WeaponPaints](https://github.com/Nereziel/cs2-WeaponPaints/releases).
4. Copy the plugin to `game/csgo/addons/counterstrikesharp/plugins/`.
5. Edit `addons/counterstrikesharp/configs/plugins/WeaponPaints/WeaponPaints.json`:

```json
{
  "Config": {
    "DatabaseHost": "YOUR_DB_HOST",
    "DatabasePort": 3306,
    "DatabaseUser": "skinsbox",
    "DatabasePassword": "skinsbox",
    "DatabaseName": "skinsbox",
    "Website": "https://your-skinsbox-domain.com",
    "CommandWpEnabled": true,
    "CommandWsEnabled": true
  }
}
```

6. In `addons/counterstrikesharp/configs/core.json`, set:

```json
"FollowCS2ServerGuidelines": false
```

7. Restart the server. Players use:
   - `!ws` — show website URL
   - `!wp` — refresh skins from database

## Database

SkinsBox uses the same `wp_player_*` tables as WeaponPaints. Run `shared/schema.sql` or let WeaponPaints create them on first start.

Your MySQL server must be reachable from both the web host and the CS2 VPS.

## Custom plugin (future)

A custom CounterStrikeSharp plugin can live in this folder. It would:

1. Connect to MySQL on map start
2. On `player_connect` / round start, query `wp_player_skins` by `steamid`
3. Override `CEconItemView` attributes on weapon entities (paint, wear, seed, stickers)
4. Register `!wp` to re-sync from DB

See [CounterStrikeSharp docs](https://docs.cssharp.dev/) and WeaponPaints source for reference.

## Server requirements

- Linux or Windows dedicated CS2 server
- `-insecure` flag (VAC disabled) when using Metamod
- Outbound access to MySQL port (3306) from the game server

## Policy warning

Valve restricts servers that grant items players do not own. Do not run skin plugins on official matchmaking or public competitive servers.
