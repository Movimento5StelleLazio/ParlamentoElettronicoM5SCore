CREATE TABLE "template" (
        "id"                    SERIAL4         PRIMARY KEY,
        "name"                  TEXT,
        "description"           TEXT );
COMMENT ON TABLE "template"                  IS 'Template for areas';
COMMENT ON COLUMN "template"."name"          IS 'Name for the template';
COMMENT ON COLUMN "template"."description"   IS 'Description for the template';

CREATE TABLE "template_area" (
        "id"                    SERIAL4         PRIMARY KEY,
        "template_id"           INTEGER REFERENCES "template" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "name"                  TEXT,
        "active"                BOOLEAN         NOT NULL DEFAULT true,
        "description"           TEXT );
COMMENT ON TABLE "template_area"                  IS 'Template areas to be used within a template';
COMMENT ON COLUMN "template_area"."active"        IS 'TRUE means new issues can be created in this area';
COMMENT ON COLUMN "template_area"."name"          IS 'Name for template area';
COMMENT ON COLUMN "template_area"."description"   IS 'Description for template area';

CREATE TABLE "template_area_allowed_policy" (
        PRIMARY KEY ("template_area_id", "policy_id"),
        "template_area_id"      INT4         REFERENCES "template_area" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "policy_id"             INT4         REFERENCES "policy" ("id") ON DELETE CASCADE ON UPDATE CASCADE, 
        "default_policy"        BOOLEAN NOT NULL DEFAULT false);
CREATE UNIQUE INDEX "template_area_allowed_policy_one_default_per_area_idx" ON "template_area_allowed_policy" ("template_area_id") WHERE "default_policy";
COMMENT ON TABLE "template_area_allowed_policy" IS 'Selects which policies can be used in each template area';
COMMENT ON COLUMN "template_area_allowed_policy"."default_policy" IS 'One policy per template area can be set as default.';
