<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v9.3, Version=9.3.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v9.3.Core, Version=9.3.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server"
            AppointmentDataSourceID="SqlDataSourceAppointments" 
            ResourceDataSourceID="SqlDataSourceResources"
            onappointmentrowinserted="ASPxScheduler1_AppointmentRowInserted" 
            onappointmentrowinserting="ASPxScheduler1_AppointmentRowInserting" 
            onappointmentsinserted="ASPxScheduler1_AppointmentsInserted">
            <Storage>
                <Appointments ResourceSharing="True">
                    <Mappings 
                        AppointmentId="ID" 
                        AllDay="AllDay" 
                        Description="Description" 
                        End="EndTime" 
                        Label="Label" 
                        Location="Location" 
                        RecurrenceInfo="RecurrenceInfo" 
                        ReminderInfo="ReminderInfo" 
                        ResourceId="CarId" 
                        Start="StartTime" 
                        Status="Status" 
                        Subject="Subject" 
                        Type="EventType" />
                </Appointments>
                <Resources>
                    <Mappings 
                        ResourceId="ID"  
                        Caption="Model" />
                </Resources>
            </Storage>
        </dxwschs:ASPxScheduler>

        <asp:SqlDataSource ID="SqlDataSourceResources" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CarsXtraSchedulingConnectionString %>" 
            SelectCommand="spSelectResources"
            SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDataSourceAppointments" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CarsXtraSchedulingConnectionString %>" 
            SelectCommand="spSelectAppointments" 
            InsertCommand="spInsertAppointment"
            DeleteCommand="spDeleteAppointment"
            UpdateCommand="spUpdateAppointment"
            DeleteCommandType="StoredProcedure" 
            InsertCommandType="StoredProcedure" 
            SelectCommandType="StoredProcedure" 
            UpdateCommandType="StoredProcedure"
            oninserted="SqlDataSourceAppointments_Inserted" 
            oninserting="SqlDataSourceAppointments_Inserting" 
            onupdating="SqlDataSourceAppointments_Updating">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
