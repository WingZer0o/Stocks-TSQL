USE Stocks;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'GetTimeSeriesDailyByCount')
	BEGIN
		DROP PROCEDURE GetTimeSeriesDailyByCount;
	END

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Mike Mulchrone>
-- Create date: <4/13/2024>
-- Description:	<Gets a set amount of time series data sorted in descending ordering of date>
-- =============================================
CREATE PROCEDURE [dbo].[GetTimeSeriesDailyByCount]
	@Ticker NVARCHAR(50),
	@Count INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TickerID UNIQUEIDENTIFIER;
	SELECT @TickerID = ID FROM Tickers where Ticker = @Ticker;
	
    SELECT TOP (@Count) * from TimeSeriesDaily where Ticker = @TickerID ORDER BY [Date] DESC;
END
GO
