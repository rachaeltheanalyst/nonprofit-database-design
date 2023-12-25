-- Create TopDonors View
CREATE VIEW TopDonors AS
	SELECT
		Donor_id,
		SUM(Dollar_amount) AS total_donation
	FROM
		Donation
	GROUP BY
		Donor_id
	ORDER BY
		total_donation DESC
	LIMIT 5;

-- Create TotalHoursWorked View
CREATE VIEW TotalHoursWorked AS
	SELECT 
		Volunteer_id,
		SUM(Hours_worked) AS total_hours_worked
	FROM
		Contribute
	GROUP BY
		Volunteer_id;

-- Create VolunteerRank View
CREATE VIEW VolunteerRank AS
	SELECT
		V.Volunteer_id,
		V.Full_name,
		V.Top_interest,
		RANK() OVER (PARTITION BY v.Top_interest ORDER BY thw.total_hours_worked DESC) AS rank
	FROM
		Volunteers v;
	JOIN 
		TotalHoursWorked thw ON v.Volunteer_id = thw.Volunteer_id;
