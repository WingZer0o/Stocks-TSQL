USE Stocks;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE Name = 'GetPortfolioTickers')
	BEGIN
		DROP PROCEDURE GetPortfolioTickers;
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
-- Description:	<Get a list of tickers that are in my portfolio>
-- =============================================
CREATE PROCEDURE [dbo].[GetPortfolioTickers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Tickers WHERE IsInPortfolio = 1;
END
GO
