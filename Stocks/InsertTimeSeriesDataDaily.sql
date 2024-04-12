USE Stocks;
GO

IF EXISTS (SELECT 1 FROM sys.objects where name = 'InsertTimeSeriesDaily')
	BEGIN
		DROP PROCEDURE InsertTimeSeriesDaily;
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
-- Create date: <4/12/2024>
-- Description:	<Checks if the data for a time series data from alpha vantage exists and associates it with the ticker>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTimeSeriesDaily]
	@Ticker NVARCHAR(50),
	@Date DATE,
	@Open NVARCHAR(100),
	@High NVARCHAR(100),
	@Low NVARCHAR(100),
	@Close NVARCHAR(100),
	@Volumne NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TickerGUID UNIQUEIDENTIFIER;
	SELECT @TickerGUID = ID FROM Tickers WHERE Ticker = @Ticker;

	IF NOT EXISTS (SELECT 1 FROM TimeSeriesDaily WHERE Date = @Date AND Ticker = @TickerGUID)
		BEGIN
			INSERT INTO TimeSeriesDaily ([Date], [Close], [High], [Low], [Open], [Volumne], [Ticker]) VALUES (@Date, @Close, @High, @Low, @Open, @Volumne, @TickerGUID);
		END
END
GO
