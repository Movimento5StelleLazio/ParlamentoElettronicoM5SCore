CREATE TABLE "member_login" (
        PRIMARY KEY ("member_id", "login_time"),
        "member_id"             INT4 NOT NULL REFERENCES "member" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
        "login_time"            TIMESTAMP WITH TIME ZONE NOT NULL,
        "geolat"                NUMERIC(10,8), -- Latitude
        "geolng"                NUMERIC(11,8), -- Longitude
        "browser"               TEXT, -- Browser used
        "os"                    TEXT); -- Operating system used
COMMENT ON COLUMN "member_login"."geolat" IS 'Latitude';
COMMENT ON COLUMN "member_login"."geolng" IS 'Longitude';
COMMENT ON COLUMN "member_login"."browser" IS 'Browser';
COMMENT ON COLUMN "member_login"."os" IS 'Operating system';
