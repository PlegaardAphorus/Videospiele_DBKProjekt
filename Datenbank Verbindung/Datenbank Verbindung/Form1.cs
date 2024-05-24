using MySqlConnector;
using System.Diagnostics;
using System.Net.Http.Headers;

namespace Datenbank_Verbindung
{
    public partial class frm_login : Form
    {
        public frm_login()
        {
            InitializeComponent();
            this.CenterToScreen();
        }

        private void frm_login_Load(object sender, EventArgs e)
        {

        }

        public async void startConnection()
        {
            using MySqlConnection sqlVerbindung = new MySqlConnection($"Server=127.0.0.1;User={tbx_username.Text};Password={tbx_password.Text}");
            Debug.WriteLine(tbx_username.Text);
            Debug.WriteLine(tbx_password.Text);
            try
            {
                await sqlVerbindung.OpenAsync();
                Debug.WriteLine("Verbindung erfolreich hergestellt.");
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }
        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            startConnection();
        }
    }
}
