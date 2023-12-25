create database Travel_Insurance_Prediction_Db;

use Travel_Insurance_Prediction_Db;

/*No of customers in the dataset*/

select count(distinct(Sn_ID)) as ID_Count
from travelinsuranceprediction;

/*Min age and max age of customers*/

select min(Age) as min, max(Age) as max
from travelinsuranceprediction;

/*(Which age group purchase Insurnace)*/

select Case when Age <25 then "0-25" 
            when Age between 25 and 26 then "25-26"
            when Age between 26 and 27 then "26-27"
			when Age between 27 and 28 then "27-28"
            when Age between 28 and 29 then "28-29"
            when Age between 29 and 30 then "29-30"
            when Age between 30 and 31 then "30-31"
            when Age between 31 and 32 then "31-32"
            when Age between 32 and 33 then "32-33"
            when Age between 33 and 34 then "33-34"
            when Age between 34 and 35 then "34-35"
            when age >35 then "Above 35"
            End as Age_Range, count(*)
from travelinsuranceprediction
where TravelInsurance = 1 
group by Age_Range
order by Age_Range;

select Case when Age <25 then "0-25" 
            when Age between 25 and 26 then "25-26"
            when Age between 26 and 27 then "26-27"
			when Age between 27 and 28 then "27-28"
            when Age between 28 and 29 then "28-29"
            when Age between 29 and 30 then "29-30"
            when Age between 30 and 31 then "30-31"
            when Age between 31 and 32 then "31-32"
            when Age between 32 and 33 then "32-33"
            when Age between 33 and 34 then "33-34"
            when Age between 34 and 35 then "34-35"
            when age >35 then "Above 35"
            End as Age_Range, count(*)
from travelinsuranceprediction
where TravelInsurance = 0
group by Age_Range
order by Age_Range;
         
/*Numbers with or no ChronicDiseases purchase Travel Insurance*/

select sum(if(ChronicDiseases = 1, 1, "Null")) as Has_ChronicDiseases,
	   sum(if(ChronicDiseases = 0, 1, "Null")) as No_ChronicDiseases
from travelinsuranceprediction
where TravelInsurance = 1;

select sum(if(ChronicDiseases = 1, 1, "Null")) as Has_ChronicDiseases,
	   sum(if(ChronicDiseases = 0, 1, "Null")) as No_ChronicDiseases
from travelinsuranceprediction
where TravelInsurance = 0;

/********/

/*Education level Graduat "yes or no"*/

select GraduateOrNot, count(*)
from travelinsuranceprediction
where TravelInsurance =0
group by GraduateOrNot
order by count(*);

select GraduateOrNot, count(*)
from travelinsuranceprediction
where TravelInsurance =1
group by GraduateOrNot
order by count(*);

/*`Employment Type`*/

select `Employment Type`, count(*)
from travelinsuranceprediction
where TravelInsurance =0
group by `Employment Type`
order by count(*);

select `Employment Type`, count(*)
from travelinsuranceprediction
where TravelInsurance =1
group by `Employment Type`
order by count(*);


/*AnnualIncome*/

select min(AnnualIncome) as min, max(AnnualIncome) as max
from travelinsuranceprediction;

select Case when AnnualIncome <300000 then "0-300000" 
            when AnnualIncome between 300000 and 600000 then "3L-6L"
            when AnnualIncome between 600000 and 900000 then "6L-9L"
			when AnnualIncome between 900000 and 1200000 then "9L-12L"
            when AnnualIncome between 1200000 and 1500000 then "12L-15L"
            when AnnualIncome between 1500000 and 1800000 then "15L-18L"
            when AnnualIncome >1800000 then "Above 1800000"
            End as AnnualIncome_Range, count(*)
from travelinsuranceprediction
where TravelInsurance = 1 
group by AnnualIncome_Range
order by count(*)  asc ;


select Case when AnnualIncome <300000 then "0-300000" 
            when AnnualIncome between 300000 and 600000 then "3L-6L"
            when AnnualIncome between 600000 and 900000 then "6L-9L"
			when AnnualIncome between 900000 and 1200000 then "9L-12L"
            when AnnualIncome between 1200000 and 1500000 then "12L-15L"
            when AnnualIncome between 1500000 and 1800000 then "15L-18L"
            when AnnualIncome >1800000 then "Above 1800000"
            End as AnnualIncome_Range, count(*)
from travelinsuranceprediction
where TravelInsurance = 0
group by AnnualIncome_Range
order by count(*)  asc ;

/*FamilyMembers*/

select min(FamilyMembers) as min, max(FamilyMembers) as max
from travelinsuranceprediction;

select Case when FamilyMembers <2 then "0-2" 
            when FamilyMembers between 2 and 3 then "2-3"
            when FamilyMembers between 3 and 4 then "3-4"
			when FamilyMembers between 4 and 5 then "4-5"
            when FamilyMembers between 5 and 6 then "5-6"
            when FamilyMembers between 6 and 7 then "6-7"
            when FamilyMembers between 7 and 8 then "7-8"
            when FamilyMembers between 8 and 9 then "8-9"
            when FamilyMembers >9 then "Above 9"
            End as No0fFamilyMembers, count(*)
from travelinsuranceprediction
where TravelInsurance = 0
group by No0fFamilyMembers
order by count(*) DESC;

select Case when FamilyMembers <2 then "0-2" 
            when FamilyMembers between 2 and 3 then "2-3"
            when FamilyMembers between 3 and 4 then "3-4"
			when FamilyMembers between 4 and 5 then "4-5"
            when FamilyMembers between 5 and 6 then "5-6"
            when FamilyMembers between 6 and 7 then "6-7"
            when FamilyMembers between 7 and 8 then "7-8"
            when FamilyMembers between 8 and 9 then "8-9"
            when FamilyMembers >9 then "Above 9"
            End as No0fFamilyMembers, count(*)
from travelinsuranceprediction
where TravelInsurance = 1
group by No0fFamilyMembers
order by count(*) DESC;

/*Numbers  FrequentFlyerwith customers with or without Travel Insurance*/

select sum(if(FrequentFlyer = "Yes", 1, "Null")) as FrequentFlyer,
	   sum(if(FrequentFlyer = "No", 1, "Null")) as Not_FrequentFlyer
from travelinsuranceprediction
where TravelInsurance = 1;

select sum(if(FrequentFlyer = "Yes", 1, "Null")) as FrequentFlyer,
	   sum(if(FrequentFlyer = "No", 1, "Null")) as Not_FrequentFlyer
from travelinsuranceprediction
where TravelInsurance = 0;

/*EverTravelledAbroad*/

select EverTravelledAbroad, count(*)
from travelinsuranceprediction
where TravelInsurance =0
group by EverTravelledAbroad
order by count(*);

select EverTravelledAbroad, count(*)
from travelinsuranceprediction
where TravelInsurance =1
group by EverTravelledAbroad
order by count(*);

/*How many purchase the travel insurance */
select TravelInsurance, count(distinct(Sn_ID)) as ID_Count
from travelinsuranceprediction
group by TravelInsurance;


select *
from travelinsuranceprediction
where TravelInsurance = 1;
