/*trigger to update shipment status when date updated*/
DROP TRIGGER IF EXISTS change_status;
delimiter // 
CREATE TRIGGER change_status BEFORE UPDATE ON order1 
FOR EACH ROW     
BEGIN
   IF (NEW.shipment_date != OLD.shipment_date) 
   THEN
       SET NEW.shipment_status = 'shipped';
   END IF;
END;
//
DELIMITER ;