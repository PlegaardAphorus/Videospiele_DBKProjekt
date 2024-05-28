using Microsoft.VisualBasic;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;

namespace Datenbank_Verbindung
{
    public partial class Form2 : Form
    {
        private MySqlConnection sqlVerbindung;
        public List<string> tableNames = new List<string>();
        public List<string> displayNames = new List<string>();

        public Form2(MySqlConnection verbindung)
        {
            InitializeComponent();
            CenterToScreen();
            sqlVerbindung = verbindung;
        }

        private async void Form2_Load(object sender, EventArgs e)
        {
            using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);
            executeCommand.CommandText = "USE videospiele";
            await executeCommand.ExecuteNonQueryAsync();

            executeCommand.CommandText = "SHOW TABLES";
            MySqlDataReader reader = await executeCommand.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                string tableName = reader.GetValue(0).ToString();
                tableNames.Add(tableName);
                string displayName = tableName.Replace("_", " ");
                int k = displayName.Count(c => c == ' ');

                if (k != 2)
                {
                    displayName = char.ToUpper(displayName[0]) + displayName.Substring(1);
                }
                else
                {
                    int index = displayName.IndexOf(' ', displayName.IndexOf(' ') + 1);
                    displayName = char.ToUpper(displayName[0]) + displayName.Substring(1, index) + char.ToUpper(displayName[index + 1]) + displayName.Substring(index + 2);
                }

                displayNames.Add(displayName);
            }

            lbx_tables.DataSource = displayNames;
            reader.Close();
        }

        private void btn_logout_Click(object sender, EventArgs e)
        {
            sqlVerbindung.Close();
            Close();
            frm_login login = new frm_login();
            login.Show();
            login.Focus();
        }

        private void btn_sqlCommand_Click(object sender, EventArgs e)
        {
            // ggf. weglassen
            Interaction.InputBox("Bitte geben Sie den SQL Befehl ein.", "SQL Befehl");
        }

        private async void btn_dropTable_Click(object sender, EventArgs e)
        {
            if (lbx_tables.SelectedIndex >= 0)
            {
                using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);

                executeCommand.CommandText = $"DROP TABLE {tableNames[lbx_tables.SelectedIndex]}";

                try
                {
                    await executeCommand.ExecuteNonQueryAsync();
                    displayNames.RemoveAt(lbx_tables.SelectedIndex);
                    tableNames.RemoveAt(lbx_tables.SelectedIndex);
                    lbx_tables.DataSource = null;
                    lbx_tables.DataSource = displayNames;
                    lbx_tables.SelectedIndex = 0;
                }
                catch (MySqlException ex)
                {
                    if (ex.Number == 3730)
                    {
                        MessageBox.Show("Die Tabelle konnte nicht gelöscht werden, da es einen Beziehung mit Foreign Keys gibt bitte löse das Problem und versuche es danach erneut.", "Fehler beim löschen der Tabelle", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (ex.Number == 1142)
                    {
                        MessageBox.Show("Die Tabelle konnte nicht gelöscht werden, da du nicht die Rechte dazu besitzt", "Fehler beim löschen der Tabelle", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }

            }
        }

        private async void btn_showTable_Click(object sender, EventArgs e)
        {
            using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);
            executeCommand.CommandText = $"SELECT * FROM {tableNames[lbx_tables.SelectedIndex]}";

            //MySqlDataReader reader = await executeCommand.ExecuteReaderAsync();

            DataTable temp = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(executeCommand);
            adapter.Fill(temp);

            foreach (DataColumn column in temp.Columns)
            {
                foreach (DataRow row in temp.Rows)
                {
                    MessageBox.Show($"{row[column]}");
                }
            }
        }
    }
}
