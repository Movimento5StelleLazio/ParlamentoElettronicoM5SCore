CREATE TYPE "auditor_action" AS ENUM
  ('created', 'certified', 'modified', 'enabled', 'disabled');

CREATE TABLE "auditor_log" (
        "id"                    SERIAL8         PRIMARY KEY,
        "auditor_id"            INT4            NOT NULL REFERENCES "member" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "member_id"             INT4            NOT NULL REFERENCES "member" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "action"                auditor_action  NOT NULL,
        "ip_address"            TEXT NOT NULL,
        "occurrence"            TIMESTAMPTZ NOT NULL);

COMMENT ON TABLE "auditor_log" IS 'Log of auditors actions on members (i.e. member creation, member certification, etc..)';

ALTER TABLE member ADD COLUMN auditor boolean;
COMMENT ON COLUMN "member"."auditor"              IS 'Member is an auditor who can create, modify or certify other members';
