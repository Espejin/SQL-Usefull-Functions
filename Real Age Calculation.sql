-- ============================================================================
-- CALCULATE REAL AGE COMPARED WITH ANOTHER FUTURE DATE.
-- Developed by: Bryan Torres
-- ============================================================================

CREATE OR ALTER FUNCTION dbo.real_age_calculation
(
	  @birth_date	DATETIME
	, @now_date DATETIME
)
RETURNS INT 
AS

BEGIN

	-- AGE CALCULATION
	---------------------------------------------------------------------
	DECLARE @AGE INT
	SET @AGE = DATEDIFF(YEAR,@birth_date,@now_date)

	-- AGE CORRECTION (CASE YOUR BIRTH DATE HASN'T HAPPENED YET)
  ---------------------------------------------------------------------
	IF DATEADD(YEAR,-@AGE,@now_date) < @birth_date
	BEGIN
		SET @AGE = @AGE - 1
	END

	RETURN @AGE

END
