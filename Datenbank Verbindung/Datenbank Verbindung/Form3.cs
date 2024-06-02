﻿using MySqlConnector;
using System.Data;
using System.Windows.Forms;

namespace Datenbank_Verbindung
{
    public partial class Form3 : Form
    {
        public List<string> columnNames = new List<string>();
        public MySqlConnection sqlVerbindung;
        public string tableName;
        public Form3(List<string> colums, MySqlConnection verbindung, string name, string table)
        {
            InitializeComponent();
            CenterToScreen();
            columnNames = colums;
            sqlVerbindung = verbindung;
            Text = name;
            tableName = table;
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);

            executeCommand.CommandText = $"SELECT * FROM {tableName}";

            DataTable temp = new DataTable();
            using MySqlDataAdapter adapter = new MySqlDataAdapter(executeCommand);
            adapter.Fill(temp);

            // Spalten im DataGridView hinzufügen basierend auf den Spaltennamen im DataTable
            dgv_showTable.Columns.Clear();
            foreach (DataColumn col in temp.Columns)
            {
                dgv_showTable.Columns.Add(col.ColumnName, col.ColumnName);
            }

            foreach (DataRow row in temp.Rows)
            {
                int rowIndex = dgv_showTable.Rows.Add();
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
            Form2 viewTables = new Form2(sqlVerbindung);
            viewTables.Show();
            viewTables.Focus();
            Close();
        }

        private async void btn_delRow_Click(object sender, EventArgs e)
        {
            try
            {
                // Index der ID-Spalte finden
                int idIndex = -1;
                for (int i = 0; i < dgv_showTable.Columns.Count; i++)
                {
                    if (dgv_showTable.Columns[i].Name.ToLower().Contains("id"))
                    {
                        idIndex = i;
                        break;
                    }
                }

                if (idIndex == -1)
                {
                    throw new Exception("Keine ID-Spalte gefunden.");
                }

                int idWert = Convert.ToInt32(dgv_showTable.CurrentRow.Cells[idIndex].Value);

                using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);
                executeCommand.CommandText = $"DELETE FROM {tableName} WHERE {dgv_showTable.Columns[idIndex].Name} = {idWert}";
                await executeCommand.ExecuteNonQueryAsync();
                dgv_showTable.Rows.RemoveAt(dgv_showTable.CurrentCell.RowIndex);
            }
            catch (MySqlException ex)
            {
                if (ex.Number == 1451)
                {
                    MessageBox.Show("Dieser Datensatz konnte nicht gelöscht werden da ein Foreign Key auf diesen Verweist. Bitte löse den Fehler und versuche es dann erneut.", "Fehler beim löschen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    MessageBox.Show("Dieser Datensatz konnte auf Grund eines unbekannten Fehlers nicht gelöscht werden. Bitte wende dich an einen Administrator.", "Fehler beim löschen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btn_addRow_Click(object sender, EventArgs e)
        {

        }
    }
}
