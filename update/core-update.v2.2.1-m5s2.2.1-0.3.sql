CREATE TABLE "template" (
        "id"                    integer         PRIMARY KEY,
        "name"                  TEXT,
        "description"           TEXT );
COMMENT ON TABLE "template"                  IS 'Subject skeleton areas to be used within a template';
COMMENT ON COLUMN "template"."name"          IS 'Name for template';
COMMENT ON COLUMN "template"."description"   IS 'Description for template';

CREATE TABLE "skeleton_area" (
        "id"                    integer         PRIMARY KEY,
        "name"                  TEXT,
        "active"                boolean         NOT NULL DEFAULT true,
        "description"           TEXT );
COMMENT ON TABLE "skeleton_area"                  IS 'Subject skeleton areas to be used within a template';
COMMENT ON COLUMN "skeleton_area"."active"        IS 'TRUE means new issues can be created in this area';
COMMENT ON COLUMN "skeleton_area"."name"          IS 'Name for skeleton area';
COMMENT ON COLUMN "skeleton_area"."description"   IS 'Description for skeleton area';

CREATE TABLE "skeleton_area_allowed_policy" (
	 PRIMARY KEY ("skeleton_area_id", "policy_id"),
        "skeleton_area_id"      INT4            REFERENCES "skeleton_area" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "policy_id"             INT4            REFERENCES "policy" ("id") ON DELETE CASCADE ON UPDATE CASCADE, 
        "default_policy"        BOOLEAN NOT NULL DEFAULT false);
CREATE UNIQUE INDEX "skeleton_area_allowed_policy_one_default_per_area_idx" ON "skeleton_area_allowed_policy" ("skeleton_area_id") WHERE "default_policy";
COMMENT ON TABLE "skeleton_area_allowed_policy" IS 'Selects which policies can be used in each skeleton area';
COMMENT ON COLUMN "skeleton_area_allowed_policy"."default_policy" IS 'One policy per skeleton area can be set as default.';

CREATE TABLE "template_area" (
        PRIMARY KEY ("template_id", "skeleton_area_id"),
        "template_id"           INT4            REFERENCES "template" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "skeleton_area_id"      INT4            REFERENCES "skeleton_area" ("id") ON DELETE CASCADE ON UPDATE CASCADE );
COMMENT ON TABLE "template_area"             IS 'Selects skeleton areas belonging to a template';
