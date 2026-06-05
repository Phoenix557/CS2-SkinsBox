-- SkinsBox schema (WeaponPaints-compatible for CS2 plugin interoperability)

CREATE TABLE IF NOT EXISTS wp_player_skins (
  steamid VARCHAR(64) NOT NULL,
  weapon_team TINYINT NOT NULL DEFAULT 0 COMMENT '0=both, 2=T, 3=CT',
  weapon_defindex INT NOT NULL,
  weapon_paint_id INT NOT NULL DEFAULT 0,
  weapon_wear FLOAT NOT NULL DEFAULT 0.000001,
  weapon_seed INT NOT NULL DEFAULT 0,
  weapon_nametag VARCHAR(128) DEFAULT NULL,
  weapon_stattrak TINYINT NOT NULL DEFAULT 0,
  weapon_sticker_0 INT NOT NULL DEFAULT 0,
  weapon_sticker_1 INT NOT NULL DEFAULT 0,
  weapon_sticker_2 INT NOT NULL DEFAULT 0,
  weapon_sticker_3 INT NOT NULL DEFAULT 0,
  weapon_sticker_0_wear FLOAT NOT NULL DEFAULT 0,
  weapon_sticker_1_wear FLOAT NOT NULL DEFAULT 0,
  weapon_sticker_2_wear FLOAT NOT NULL DEFAULT 0,
  weapon_sticker_3_wear FLOAT NOT NULL DEFAULT 0,
  weapon_keychain INT NOT NULL DEFAULT 0,
  PRIMARY KEY (steamid, weapon_team, weapon_defindex)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS wp_player_knife (
  steamid VARCHAR(64) NOT NULL,
  weapon_team TINYINT NOT NULL DEFAULT 0,
  knife VARCHAR(64) NOT NULL DEFAULT 'weapon_knife',
  PRIMARY KEY (steamid, weapon_team)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS wp_player_gloves (
  steamid VARCHAR(64) NOT NULL,
  weapon_team TINYINT NOT NULL DEFAULT 0,
  glove_id INT NOT NULL DEFAULT 0,
  PRIMARY KEY (steamid, weapon_team)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS wp_player_agents (
  steamid VARCHAR(64) NOT NULL,
  agent_ct VARCHAR(128) DEFAULT NULL,
  agent_t VARCHAR(128) DEFAULT NULL,
  PRIMARY KEY (steamid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS wp_player_music (
  steamid VARCHAR(64) NOT NULL,
  weapon_team TINYINT NOT NULL DEFAULT 0,
  music_id INT NOT NULL DEFAULT 0,
  PRIMARY KEY (steamid, weapon_team)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS wp_player_pins (
  steamid VARCHAR(64) NOT NULL,
  weapon_team TINYINT NOT NULL DEFAULT 0,
  pin_id INT NOT NULL DEFAULT 0,
  PRIMARY KEY (steamid, weapon_team)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
