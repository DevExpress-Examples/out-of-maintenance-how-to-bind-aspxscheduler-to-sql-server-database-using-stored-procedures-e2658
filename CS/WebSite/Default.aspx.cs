using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxScheduler;
using DevExpress.XtraScheduler;

public partial class _Default : System.Web.UI.Page {
    private int lastInsertedAppointmentId;

    protected void Page_Load(object sender, EventArgs e) {

        if(!IsPostBack) {
            ASPxScheduler1.Start = new DateTime(2008, 7, 12);
        }
    }

    protected void ASPxScheduler1_AppointmentRowInserting(object sender, DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertingEventArgs e) {
        e.NewValues.Remove("ID");
    }

    protected void SqlDataSourceAppointments_Inserted(object sender, SqlDataSourceStatusEventArgs e) {
        SqlConnection connection = (SqlConnection)e.Command.Connection;

        using(SqlCommand command = new SqlCommand("SELECT IDENT_CURRENT('CarScheduling')", connection)) {
            lastInsertedAppointmentId = Convert.ToInt32(command.ExecuteScalar());
        }
    }

    protected void ASPxScheduler1_AppointmentRowInserted(object sender, DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertedEventArgs e) {
        e.KeyFieldValue = lastInsertedAppointmentId;
    }

    protected void ASPxScheduler1_AppointmentsInserted(object sender, DevExpress.XtraScheduler.PersistentObjectsEventArgs e) {
        //int count = e.Objects.Count;
        //System.Diagnostics.Debug.Assert(count == 1);

        Appointment apt = (Appointment)e.Objects[0];
        ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
        storage.SetAppointmentId(apt, lastInsertedAppointmentId);
    }

    #region Providing null values for missing parameters
    protected void SqlDataSourceAppointments_Inserting(object sender, SqlDataSourceCommandEventArgs e) {
        ProvideMissingParameters(e.Command.Parameters);
    }

    protected void SqlDataSourceAppointments_Updating(object sender, SqlDataSourceCommandEventArgs e) {
        ProvideMissingParameters(e.Command.Parameters);
    }

    private static void ProvideMissingParameters(System.Data.Common.DbParameterCollection parameters) {
        SqlParameter userId = new SqlParameter("@UserId", System.Data.SqlDbType.Int);
        SqlParameter price = new SqlParameter("@Price", System.Data.SqlDbType.Money);
        SqlParameter contactInfo = new SqlParameter("@ContactInfo", System.Data.SqlDbType.NText);

        userId.Value = DBNull.Value;
        price.Value = DBNull.Value;
        contactInfo.Value = DBNull.Value;
        parameters.AddRange(new SqlParameter[] { userId, price, contactInfo });
    }
    #endregion
}