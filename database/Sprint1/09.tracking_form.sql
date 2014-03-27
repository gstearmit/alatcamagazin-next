CREATE TABLE `tracking_form` (
	`form_id` INT(11) NOT NULL AUTO_INCREMENT,
	`form_name` VARCHAR(255) NOT NULL,
	`domain` VARCHAR(255) NULL DEFAULT NULL,
	`form_url` VARCHAR(1000) NULL DEFAULT NULL,
	`form_format` TEXT NULL,
	`description` VARCHAR(500) NULL DEFAULT NULL,
	`reg_dttm` DATETIME NULL DEFAULT NULL,
	`upd_dttm` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`form_id`)