ALTER TABLE system_setting ADD COLUMN gui_preset text;
COMMENT ON COLUMN "system_setting"."gui_preset" IS 'Choose from configured gui from the array config.gui_preset';
