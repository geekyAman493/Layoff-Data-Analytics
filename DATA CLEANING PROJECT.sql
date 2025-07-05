-- Data Cleaning
-- 1.Remove Duplicates
-- 2.Handle Null Values or blank values
-- 3.Standardize Data
-- 4.Remove Unnecessary Columns


select * from layoffs;

/*CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
select * from
layoffs;
*/




WITH DUPLICATES AS (
select *,row_number()
OVER(partition by COMPANY,LOCATION,INDUSTRY,TOTAL_LAID_OFF,percentage_laid_off,'DATE',stage,country,funds_raised_millions) AS ROW_NUM
 from layoffs_staging)
SELECT * FROM DUPLICATES
WHERE ROW_NUM >1;
 
SELECT * FROM layoffs_staging
WHERE COMPANY='casper';


WITH DUPLICATES AS (
select *,row_number()
OVER(partition by COMPANY,LOCATION,INDUSTRY,TOTAL_LAID_OFF,percentage_laid_off,'DATE',stage,country,funds_raised_millions) AS ROW_NUM
 from layoffs_staging)
delete
FROM DUPLICATES
WHERE ROW_NUM >1;





CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO layoffs_staging2
select *,row_number()
OVER(partition by COMPANY,LOCATION,INDUSTRY,TOTAL_LAID_OFF,percentage_laid_off,'DATE',stage,country,funds_raised_millions) AS ROW_NUM
 from layoffs_staging;

delete
from layoffs_staging2
where row_num>1;


select *
from layoffs_staging2
where row_num>1;

-- standardizing data
update layoffs_staging2
set company =trim(company);

select *
from layoffs_staging2
where industry LIKE 'Crypto%';

update layoffs_staging2
set industry ='Crypto'
where industry like 'Crypto%';

update layoffs_staging2
set country =trim(Trailing '.'  from country)
where country like 'United States%';



select `date`,
from layoffs_staging2;

update layoffs_staging2
set date= str_to_date(`date`,'%m/%d/%Y');


select `date`
from layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY column `date` DATE;


SELECT * FROM layoffs_staging2
where company like "Bally%";

UPDATE layoffs_staging2
SET industry=null
WHERE industry='';


select t1.industry,t2.industry
from layoffs_staging2 as t1
join layoffs_staging2 as t2
on t1.company=t2.company 
where( t1.industry is null or t1.industry='')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company 
set t1.industry=t2.industry
where( t1.industry is null)
and t2.industry is not null;

select * from
layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete from
layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select * from
layoffs_staging2;

Alter table layoffs_staging2
drop column row_num;





