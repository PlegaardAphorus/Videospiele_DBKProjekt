using MySqlConnector;
using System.Diagnostics;
using System.Media;
using System.Net.Http.Headers;

namespace Datenbank_Verbindung
{
    public partial class frm_login : Form
    {
        public frm_login()
        {
            InitializeComponent();
            CenterToScreen();
        }

        private void frm_login_Load(object sender, EventArgs e)
        {

        }

        private MySqlConnection sqlVerbindung;
        
        private async void btn_login_Click(object sender, EventArgs e)
        {
            sqlVerbindung = new MySqlConnection($"Server=127.0.0.1;User={tbx_username.Text};Password={tbx_password.Text}");
            try
            {
                await sqlVerbindung.OpenAsync();
            }
            catch (Exception ex)
            {
                tbx_password.Text = string.Empty;
                tbx_username.Text = string.Empty;
                if (ex.Message.Contains("Access denied"))
                {
                    MessageBox.Show("Zugang verweigert.", "Fehler", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    MessageBox.Show("Ein unerwarteter Fehler ist aufgetreten, bitte wende dich an einen Systemadministrator", "Fehler", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            Form2 tabellenAnsicht = new Form2(sqlVerbindung);

            tabellenAnsicht.Show();
            tabellenAnsicht.Focus();
            Hide();
        }
    }
}
