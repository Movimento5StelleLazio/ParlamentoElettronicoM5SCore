CREATE TABLE checked_event (
        "event_id"               INT4 NOT NULL,
        "member_id"              INT4 NOT NULL,
        CONSTRAINT "checked_event_pkey" PRIMARY KEY ("event_id", "member_id"),
        CONSTRAINT "checked_event_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "event" ("id") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT "checked_event_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member" ("id") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE);

COMMENT ON TABLE "checked_event" IS 'Possibility to filter events';
