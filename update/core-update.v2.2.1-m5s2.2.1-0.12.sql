CREATE TABLE "unit_group" (
        "id"                    SERIAL4         PRIMARY KEY,
        "name"                  TEXT            NOT NULL UNIQUE DEFAULT '');
CREATE INDEX "unit_group_idx" ON "unit_group" ("id");

COMMENT ON TABLE "unit_group" IS 'Group of units (name)';

CREATE TABLE "unit_group_member" (
        PRIMARY KEY ("unit_group_id","unit_id"),
        "unit_group_id"         INT4            REFERENCES "unit_group" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "unit_id"               INT4            REFERENCES "unit" ("id") ON DELETE CASCADE ON UPDATE CASCADE);
