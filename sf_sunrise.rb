require 'solareventcalculator'  
 
date = Date.parse(Date.today.to_s)
#The method signature is: date, latitude, longtitude
#values fetch from: curl "http://api.hostip.info/get_html.php?ip=208.72.143.3&position=true"
calc = SolarEventCalculator.new(date, BigDecimal.new("37.8133"), BigDecimal.new("-122.505"))  
  
utcOfficialSunrise = calc.compute_utc_official_sunrise  
utcOfficialSunset = calc.compute_utc_official_sunset
#localOfficialSunrise = calc.compute_official_sunrise('America/San_Francisco')  
pp type(utcOfficialSunrise)
  
puts "utcOfficialSunrise #{utcOfficialSunrise}"
puts "utcOfficialSunset #{utcOfficialSunset}"
#puts "localOfficialSunrise #{localOfficialSunrise}"  
