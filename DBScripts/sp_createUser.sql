DELIMITER $$

USE `usersdb`$$

DROP PROCEDURE IF EXISTS `sp_createUser`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN u_username VARCHAR(20),
    IN u_email VARCHAR(20),
    IN u_password VARCHAR(200)
)
BEGIN
    IF ( SELECT EXISTS (SELECT 1 FROM tbl_user WHERE p_username = u_username) ) THEN

        SELECT 'Username Exists !!';

    ELSE

        INSERT INTO tbl_user
        (
            p_username,
            p_email,
            p_password
        )
        VALUES
        (
            u_username,
            u_email,
            u_password
        );

    END IF;
END$$

DELIMITER ;