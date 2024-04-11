USE Stocks;
GO

IF EXISTS (SELECT 1 FROM sys.objects where name = 'InsertTicker')
	BEGIN
		DROP PROCEDURE InsertTicker;
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
-- Create date: <4/10/2023>
-- Description:	<Inserts a ticker if it doesn't exist>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTicker] 
	@Ticker NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM Tickers WHERE Ticker = @Ticker)
		BEGIN
			INSERT INTO Tickers (Ticker) VALUES (@Ticker);
		END
END
GO