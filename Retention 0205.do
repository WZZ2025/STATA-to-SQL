* This dofile is for retention calculation in Stata
* The data is simulated, with 50 individuals within 39 households.

* 1. Check the data format to make sure it is date format. 
gen date = date(string(date_str), "YMD")  
format date %td  

* 2. Determine whether the user satisfies the retention condition. 
gen next_day = date + 1   
gen retained = 0  
sort pid date
bysort pid (date): gen next_active = date[_n+1]  

replace retained = 1 if next_active == next_day  

* 3. Summarise whether each individual is marked as retained at least once. /
egen any_retained = max(retained), by(pid)  

* 4. Calculate the average retention rate across users. 
mean any_retained


****若改为平均家庭留存率****
**1. SAME

**2. Determine whether the household satisfies the retention condition. 

preserve  
keep hh_id date
duplicates drop  
sort hh_id date

gen next_day = date + 1  
gen retained_hh = 0  
gen next_active_hh = date[_n+1] if hh_id == hh_id[_n+1]  
replace retained_hh = 1 if next_active_hh == next_day  

* 3. Summarise whether each household is retained at least once. 
egen any_retained_hh = max(retained_hh), by(hh_id)  

* 4. Calculate the average retention rate across households. 
mean any_retained_hh

restore  



