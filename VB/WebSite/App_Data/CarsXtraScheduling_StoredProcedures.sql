USE [CarsXtraScheduling]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectAppointments]'))
	DROP PROCEDURE [dbo].[spSelectAppointments]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDeleteAppointment]'))
	DROP PROCEDURE [dbo].[spDeleteAppointment]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertAppointment]'))
	DROP PROCEDURE [dbo].[spInsertAppointment]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUpdateAppointment]'))
	DROP PROCEDURE [dbo].[spUpdateAppointment]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectResources]'))
	DROP PROCEDURE [dbo].[spSelectResources]
GO

CREATE PROCEDURE [spSelectAppointments] 
AS
	SELECT * FROM [CarScheduling]
GO

CREATE PROCEDURE [spDeleteAppointment]
	@ID int
AS
	DELETE FROM [CarScheduling] WHERE [ID] = @ID
GO

CREATE PROCEDURE [spInsertAppointment]
	@CarId nvarchar(max),
	@UserId int,
	@Status int,
	@Subject nvarchar(50),
	@Description ntext,
	@Label int,
	@StartTime datetime,
	@EndTime datetime,
	@Location nvarchar(50),
	@AllDay bit,
	@EventType int,
	@RecurrenceInfo ntext,
	@ReminderInfo ntext,
	@Price money,
	@ContactInfo ntext
AS
	INSERT INTO [CarScheduling] (
		[CarId], 
		[UserId], 
		[Status], 
		[Subject], 
		[Description], 
		[Label], 
		[StartTime], 
		[EndTime], 
		[Location], 
		[AllDay], 
		[EventType], 
		[RecurrenceInfo], 
		[ReminderInfo], 
		[Price], 
		[ContactInfo]) 
	VALUES (
		@CarId,
		@UserId, 
		@Status, 
		@Subject, 
		@Description, 
		@Label, 
		@StartTime, 
		@EndTime, 
		@Location, 
		@AllDay, 
		@EventType, 
		@RecurrenceInfo, 
		@ReminderInfo, 
		@Price, 
		@ContactInfo)
GO

CREATE PROCEDURE [spUpdateAppointment]
	@ID int,
	@CarId nvarchar(max),
	@UserId int,
	@Status int,
	@Subject nvarchar(50),
	@Description ntext,
	@Label int,
	@StartTime datetime,
	@EndTime datetime,
	@Location nvarchar(50),
	@AllDay bit,
	@EventType int,
	@RecurrenceInfo ntext,
	@ReminderInfo ntext,
	@Price money,
	@ContactInfo ntext
AS
	UPDATE [CarScheduling] SET 
		[CarId] = @CarId, 
		[UserId] = @UserId, 
		[Status] = @Status, 
		[Subject] = @Subject, 
		[Description] = @Description, 
		[Label] = @Label, 
		[StartTime] = @StartTime, 
		[EndTime] = @EndTime, 
		[Location] = @Location, 
		[AllDay] = @AllDay, 
		[EventType] = @EventType, 
		[RecurrenceInfo] = @RecurrenceInfo, 
		[ReminderInfo] = @ReminderInfo, 
		[Price] = @Price, 
		[ContactInfo] = @ContactInfo 
	WHERE 
		[ID] = @ID
GO

CREATE PROCEDURE [spSelectResources] 
AS
	SELECT [ID], [Model] FROM [Cars]
GO