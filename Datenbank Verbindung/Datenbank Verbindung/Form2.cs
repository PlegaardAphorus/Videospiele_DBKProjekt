using MySqlConnector;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
        public string[] tableNames = new string[22];    
        public string[] displayNames = new string[22];    
        
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

            int i = 0;
            while (await reader.ReadAsync())
            {
                tableNames[i] = reader.GetValue(0).ToString();
                displayNames[i] = tableNames[i];
                string tmp = displayNames[i].Replace("_", " ");
                int k = tmp.Count(c => c == ' ');
                if (k != 2)
                {
                    displayNames[i] = char.ToUpper(tmp[0]) + tmp.Substring(1);
                }
                else
                {
                    int index = tmp.IndexOf(' ', tmp.IndexOf(' ') + 1);
                    displayNames[i] = char.ToUpper(tmp[0]) + tmp.Substring(1, index) + char.ToUpper(tmp[index + 1]) + tmp.Substring(index + 2);
                    index++;
                }
                i++;
            }
            lbx_tables.DataSource = displayNames;
        }
    }
}
