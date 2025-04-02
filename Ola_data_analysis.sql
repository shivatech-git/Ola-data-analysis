CREATE DATABASE Ola;
Use ola;
#ONE rETRIEVE ALL SUCCESSFUL BOOKINGS;
CREATE VIEW Successful_bookings AS
SELECT * FROM bookings WHERE Booking_Status = 'Success';
SELECT * FROM Successful_bookings;

#two find average ride distance of each vehicle type;
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance FROM bookings GROUP BY Vehicle_Type;

#THREE total number of cancelled rides by customers;
CREATE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customers;

#FOUR list the top 5 customers;
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
SELECT * FROM Top_5_Customers;

#FIVE get number of rides cancelled by drivers due to personal and car_related issues;
CREATE VIEW Rides_Canceled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM bookings WHERE Canceled_Rides_By_Driver = 'Personal & Car related issue';

#SIX find maximum and minimum driver ratings for prime season bookings;
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#SEVEN Get all rides with upi payments;
CREATE VIEW UPI_PAYMENT AS
 SELECT * FROM bookings WHERE Payment_Method = 'UPI';
 
 #EIGHT find average customer rating per vehicle;
 CREATE VIEW AVG_Cust_Rating AS
 SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
 FROM bookings
 GROUP BY Vehicle_Type;
 
 #NINE calculated total booking value of rides completed successfully
 CREATE VIEW total_successful_ride_value AS
 SELECT SUM(Booking_Value) AS total_successful_ride_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 
 #TEN List all incomplete rides along with the reason;
 CREATE VIEW Incomplete_Rides_Reason AS
 SELECT Booking_ID, Incomplete_Rides_Reason 
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';