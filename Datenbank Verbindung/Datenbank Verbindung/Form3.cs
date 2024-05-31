using MySqlConnector;
using System.Data;

namespace Datenbank_Verbindung
{
    public partial class Form3 : Form
    {
        public List<string> columNames = new List<string>();
        public MySqlConnection sqlVerbindung;
        public string tableName;
        public Form2 viewTables;

        public Form3(Form2 tables, List<string> colums, MySqlConnection verbindung, string name, string table)
        {
            InitializeComponent();
            CenterToScreen();
            columNames = colums;
            sqlVerbindung = verbindung;
            Text = name;
            tableName = table;
            viewTables = tables;
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            foreach (string columName in columNames)
            {
                dgv_showTable.Columns.Add(columName, columName);
            }
            using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);

            executeCommand.CommandText = $"SELECT * FROM {tableName}";

            DataTable temp = new DataTable();
            using MySqlDataAdapter adapter = new MySqlDataAdapter(executeCommand);
            adapter.Fill(temp);

            foreach (DataRow row in temp.Rows)
            {
                int rowIndex = dgv_showTable.Rows.Add(); // Neue Zeile hinzufügen
                DataGridViewRow dgvRow = dgv_showTable.Rows[rowIndex];

                for (int colIndex = 0; colIndex < temp.Columns.Count; colIndex++)
                {
                    if (row[colIndex].ToString().Contains(":"))
                    {
                        int index = row[colIndex].ToString().IndexOf(':');
                        index -= 2;
                        dgvRow.Cells[colIndex].Value = row[colIndex].ToString().Remove(index, 8);
                    }
                    else
                    {
                        dgvRow.Cells[colIndex].Value = row[colIndex];
                    }
                }
            }
        }

        private void btn_zurück_Click(object sender, EventArgs e)
        {
            viewTables.Show();
            viewTables.Focus();
            Close();
        }
    }
}
