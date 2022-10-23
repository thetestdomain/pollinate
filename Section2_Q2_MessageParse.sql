-- Proc to demonstrate Message Reading

CREATE PROCEDURE ParseMEssages
AS
BEGIN
INSERT INTO notifications (id,message)
SELECT id, data FROM messages
WHERE type='notification';

INSERT INTO alerts (id,shortMessage)
SELECT id, convert(varchar(15),data) FROM messages
WHERE type='alert';

END;

EXEC ParseMEssages