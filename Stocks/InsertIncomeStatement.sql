USE Stocks;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'InsertIncomeStatement')
	BEGIN
		DROP PROCEDURE InsertIncomeStatement;
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
-- Description:	<Inserts an income statement from Alpha Vantage>
-- =============================================
CREATE PROCEDURE [dbo].[InsertIncomeStatement] 
	@FiscalDateEnding DATETIME,
	@ReportedCurrency NVARCHAR(100),
	@GrossProfit NVARCHAR(MAX),
	@TotalRevenue NVARCHAR(MAX),
	@CostOfRevenue NVARCHAR(MAX),
	@CostofGoodsAndServicesSold NVARCHAR(MAX),
	@OperatingIncome NVARCHAR(MAX),
	@SellingGeneralAndAdministrative NVARCHAR(MAX),
	@ResearchAndDevelopment NVARCHAR(MAX),
	@OperatingExpenses NVARCHAR(MAX),
	@InvestmentIncomeNet NVARCHAR(MAX),
	@NetInterestIncome NVARCHAR(MAX),
	@InterestIncome NVARCHAR(MAX),
	@InterestExpense NVARCHAR(MAX),
	@NonInterestIncome NVARCHAR(MAX),
	@OtherNonOperatingIncome NVARCHAR(MAX),
	@Depreciation NVARCHAR(MAX),
	@DepreciationAndAmortization NVARCHAR(MAX),
	@IncomeBeforeTax NVARCHAR(MAX),
	@IncomeTaxExpense NVARCHAR(MAX),
	@InterestAndDebtExpense NVARCHAR(MAX),
	@NetIncomeFromContinuingOperations NVARCHAR(MAX),
	@ComprehensiveIncomeNetOfTax NVARCHAR(MAX),
	@Ebit NVARCHAR(MAX),
	@Ebitda NVARCHAR(MAX),
	@NetIncome NVARCHAR(MAX),
	@Ticker NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TickerID UNIQUEIDENTIFIER;
	SELECT @TickerID = ID FROM Tickers WHERE Ticker = @Ticker;
    
	IF NOT EXISTS (SELECT 1 FROM IncomeStatements WHERE FiscalDateEnding = @FiscalDateEnding AND Ticker = @TickerID)
		BEGIN
			INSERT INTO IncomeStatements (FiscalDateEnding, ReportedCurrency,
			GrossProfit,
			TotalRevenue,
			CostOfRevenue,
			CostofGoodsAndServicesSold,
			OperatingIncome,
			SellingGeneralAndAdministrative,
			ResearchAndDevelopment,
			OperatingExpenses,
			InvestmentIncomeNet,
			NetInterestIncome,
			InterestIncome,
			InterestExpense,
			NonInterestIncome,
			OtherNonOperatingIncome,
			Depreciation,
			DepreciationAndAmortization,
			IncomeBeforeTax,
			IncomeTaxExpense,
			InterestAndDebtExpense,
			NetIncomeFromContinuingOperations,
			ComprehensiveIncomeNetOfTax,
			Ebit,
			Ebitda,
			NetIncome,
			Ticker
			) 
			VALUES (
			@FiscalDateEnding,
			@ReportedCurrency,
			@GrossProfit,
			@TotalRevenue,
			@CostOfRevenue,
			@CostofGoodsAndServicesSold,
			@OperatingIncome,
			@SellingGeneralAndAdministrative,
			@ResearchAndDevelopment,
			@OperatingExpenses,
			@InvestmentIncomeNet,
			@NetInterestIncome,
			@InterestIncome,
			@InterestExpense,
			@NonInterestIncome,
			@OtherNonOperatingIncome,
			@Depreciation,
			@DepreciationAndAmortization,
			@IncomeBeforeTax,
			@IncomeTaxExpense,
			@InterestAndDebtExpense,
			@NetIncomeFromContinuingOperations,
			@ComprehensiveIncomeNetOfTax,
			@Ebit,
			@Ebitda,
			@NetIncome,
			@TickerID
			);
		END
END
GO
