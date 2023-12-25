-- Create Trigger for Donor Status Update Based on Total Donation
CREATE TRIGGER donor_status
AFTER INSERT
ON Donation FOR EACH ROW
BEGIN
	-- Update the Donor table based on the calculated total donation
	UPDATE Donor
	SET Status =
		CASE
		WHEN (
			SELECT SUM(Dollar_amount)
			FROM Donation
			WHERE Donor_id = NEW.Donor_id
		) > 1000 THEN 'Gold'
		WHEN (
			SELECT SUM(Dollar_amount)
			FROM Donation
			WHERE Donor_id = NEW.Donor_id
		) > 500 THEN 'Silver'
		ELSE 'Bronze'
		END
	WHERE Donor_id = NEW.Donor_id;
END;

-- Create Trigger for Updating Essentials Quantity After Donation Insert
CREATE TRIGGER after_donation_insert
AFTER INSERT
ON Donation FOR EACH ROW
BEGIN
	UPDATE Essentials
    	SET Quantity = Quantity + NEW.Item_quantity
    	WHERE Name = NEW.Item_name AND Maker = NEW.Item_maker;
END;

-- Create Trigger for Updating Essentials Quantity After Food Pantry Event Insert
CREATE TRIGGER after_food_pantry_event_delete
AFTER INSERT
ON Distributes FOR EACH ROW
BEGIN
	UPDATE Essentials
    	SET Quantity = Quantity - NEW.Num_taken
    	WHERE Essential_id = NEW.Essential_id;
END;

