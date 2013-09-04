CREATE TABLE "member_data" (
        "member_id"             INT4            NOT NULL UNIQUE,
        "birthplace"            TEXT            NOT NULL,
        "birthdate"             DATE            NOT NULL,
        "municipality_id"       INT4            NOT NULL,
        "idcard"                TEXT            NOT NULL UNIQUE,
        "email"                 TEXT,
        "residence_address"     TEXT            NOT NULL,
        "residence_postcode"    TEXT            NOT NULL,
        "domicile_address"      TEXT            NOT NULL,
        "domicile_postcode"     TEXT            NOT NULL,
        "token_serial"          TEXT );
        
COMMENT ON TABLE "member_data" IS 'Member sensitive data collection';


CREATE TYPE "scan_type" AS ENUM
  ('id_front','id_rear','id_picture','nin','health_insurance');

CREATE TABLE "idcard_scan" (
        "member_id"             INT4            NOT NULL UNIQUE,
        "type"                  scan_type       NOT NULL,
        "data"                  BYTEA           NOT NULL );

COMMENT ON TABLE  "idcard_scan" IS 'HQ scans of member picture, id cards and/or other idenfication documents';
