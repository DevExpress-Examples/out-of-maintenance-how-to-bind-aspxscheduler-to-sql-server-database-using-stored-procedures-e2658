<!-- default file list -->
*Files to look at*:

* [CarsXtraScheduling_StoredProcedures.sql](./CS/WebSite/App_Data/CarsXtraScheduling_StoredProcedures.sql) (VB: [CarsXtraScheduling_StoredProcedures.sql](./VB/WebSite/App_Data/CarsXtraScheduling_StoredProcedures.sql))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to bind ASPxScheduler to SQL Server database using stored procedures


<p>You can see that stored procedures have a number of advantages over textual SQL queries. For instance, review the <a href="http://www.sqlbook.com/SQL-Server/Why-use-Stored-Procedures-41.aspx"><u>Why use Stored Procedures?</u></a> web article. How to take advantage of stored procedures in a scheduling application? To do this, you should replace the Select, Insert, Delete, and Update command queries of the SqlDataSource with the corresponding stored procedure names and set the CommandType="StoredProcedure" attribute for all these commands (in the ASPX markup). Also, the parameters of these commands can be safely removed from the SqlDataSource definition because they are created and populated with values by the ASPxScheduler control automatically (however, missing parameters should be provided manually).This will simplify the web page with the ASPxScheduler as much as possible.</p><p>The CarsXtraScheduling_StoredProcedures.sql file containing the required stored procedures is included (tested with MS SQL Server 2005). You should create them in the CarsXtraScheduling database (see the <a href="https://www.devexpress.com/Support/Center/p/E215">How to bind ASPxScheduler to MS SQL Server database</a> example) prior to running this example.</p>

<br/>


