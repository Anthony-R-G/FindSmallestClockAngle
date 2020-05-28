
// Create a function or method that when given a time (a string in HH:MM format) give this smallest angle created between the hour and minute hands on a circular wall clock.

//12 hrs = 360°
//1 hr = 360/12 = 30°
//1 min = 360/60 = 6°

//Assumes a 12-hr clock.


func findSmallestAngle(_ str: String) -> Double {

  let hour = Double(str.split(separator: ":")[0]) ?? 0
  let minute = Double(str.split(separator: ":")[1]) ?? 0


  let hourDisplacement = minute/2.0
  //Displacement is found by (minute/60) * 30, which can be reduced to minute/2.0.
  //Displacement is used to get the value of the hour hand as it's in-between two hours.

  let hourAngle = (hour * 30.0 + hourDisplacement)
  //Multiply hours by 30, since each hour is 30°. Then you add the remaining displacement.
  
  let minuteAngle = minute * 6
  //Because a minute is equal to 6 degrees. To find the angle the minute hand makes, simply multiply the minute value by 6.

  let angle1 = abs(minuteAngle - hourAngle)
  //Use abs to avoid negative values.

  return min(360 - angle1, angle1)
  //Return the minium of the calculated angle, and the angle of 360 minus that calculated angle (which would give you the other side)

}

print(findSmallestAngle("4:45"))

//Hour = 4
//Minute = 45

//When it's 4:45, the minute hand is on 9 and the hr hand is between 4 and 5. 
//There are 4 hours in the time 4:45. Because each hr is equal to 30°, you can multiply the 4 by 30 to get 120. 
//Next, you need to find the displacement. This is how far away from the 4 (but not quite at 5) the hour hand is.
//Because there are 60 minutes in an hour, and there's 45 minutes in the example time, we can do 45/60. This gives us 0.75, or 3/4. 
//Seeing as how a "whole" is 30°, you want to find out what 3/4th of 30° is. This is done by multiplying 0.75 by 30, which yields 22.5. 
//Thus, starting from the 4, the hour hand has moved 22.5 degrees. Combined with the 120 we got earlier, this totals 142.5. This is how far the hour hand is from the 12 mark.

//Because there are 60 minute "ticks", this means that each minute is equal to 360/60, which is 6. So a single minute is 6°. 
//There are 45 minutes in 4:45, so 45 * 6 = 270.
//From the 12 mark, the minute hand has moved 270°. 

//To find the resulting angle of the minute and hour hand, simply subtract. 270° - 142.5 = 127.5. 

