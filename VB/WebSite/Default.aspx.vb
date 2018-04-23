Imports System
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxScheduler
Imports DevExpress.XtraScheduler

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Private lastInsertedAppointmentId As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

        If Not IsPostBack Then
            ASPxScheduler1.Start = New Date(2008, 7, 12)
        End If
    End Sub

    Protected Sub ASPxScheduler1_AppointmentRowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertingEventArgs)
        e.NewValues.Remove("ID")
    End Sub

    Protected Sub SqlDataSourceAppointments_Inserted(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
        Dim connection As SqlConnection = CType(e.Command.Connection, SqlConnection)

        Using command As New SqlCommand("SELECT IDENT_CURRENT('CarScheduling')", connection)
            lastInsertedAppointmentId = Convert.ToInt32(command.ExecuteScalar())
        End Using
    End Sub

    Protected Sub ASPxScheduler1_AppointmentRowInserted(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertedEventArgs)
        e.KeyFieldValue = lastInsertedAppointmentId
    End Sub

    Protected Sub ASPxScheduler1_AppointmentsInserted(ByVal sender As Object, ByVal e As DevExpress.XtraScheduler.PersistentObjectsEventArgs)
        'int count = e.Objects.Count;
        'System.Diagnostics.Debug.Assert(count == 1);

        Dim apt As Appointment = CType(e.Objects(0), Appointment)
        Dim storage As ASPxSchedulerStorage = DirectCast(sender, ASPxSchedulerStorage)
        storage.SetAppointmentId(apt, lastInsertedAppointmentId)
    End Sub

    #Region "Providing null values for missing parameters"
    Protected Sub SqlDataSourceAppointments_Inserting(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs)
        ProvideMissingParameters(e.Command.Parameters)
    End Sub

    Protected Sub SqlDataSourceAppointments_Updating(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs)
        ProvideMissingParameters(e.Command.Parameters)
    End Sub

    Private Shared Sub ProvideMissingParameters(ByVal parameters As System.Data.Common.DbParameterCollection)
        Dim userId As New SqlParameter("@UserId", System.Data.SqlDbType.Int)
        Dim price As New SqlParameter("@Price", System.Data.SqlDbType.Money)
        Dim contactInfo As New SqlParameter("@ContactInfo", System.Data.SqlDbType.NText)

        userId.Value = DBNull.Value
        price.Value = DBNull.Value
        contactInfo.Value = DBNull.Value
        parameters.AddRange(New SqlParameter() { userId, price, contactInfo })
    End Sub
    #End Region
End Class