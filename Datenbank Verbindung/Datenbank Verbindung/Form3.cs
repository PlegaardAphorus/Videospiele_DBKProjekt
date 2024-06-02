using MySqlConnector;
using System;
using System.Data;
using System.Reflection.Metadata;
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

        private bool successImport = false;

        private async void executeCommandAsync(MySqlCommand executeCommand)
        {
            try
            {
                await executeCommand.ExecuteNonQueryAsync();
                successImport = true;
            }
            catch (MySqlException e)
            {
                switch (e.Number)
                {
                    case 404:
                        MessageBox.Show("Einer der angegebenen Werte kann nicht in der Zukunft liegen.", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                    case 405:
                        MessageBox.Show("Es kann kein Spiel vor den Jahre 1952 erschienen sein.", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                    case 406:
                        MessageBox.Show("Sie haben einen Wert eingegeben der nicht den erwarteten Parameter entspricht.", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                    case 407:
                        MessageBox.Show("Einer der Werte kann nicht kleiner sein als 0", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                    case 408:
                        MessageBox.Show("Der Benutzer kann nicht mehr Spielzeit in einem Spiel haben als er gesamt in allen hat", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                    case 409:
                        MessageBox.Show("Eine e-mail muss ein @ inhalten und kann auch nur ein @ inhalten", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                    default:
                        MessageBox.Show("Ein unerwarteter Fehler ist aufgetreten bitte wende dich an einen Administrator.", "Fehler beim hinzufügen des Datensatzes", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        successImport = false;
                        break;
                }
            }
        }

        private void btn_addRow_Click(object sender, EventArgs e)
        {
            Form inputForm = new Form();
            inputForm.Text = "Neue Zeile hinzufügen";
            inputForm.Width = 600;
            inputForm.Height = 500;
            inputForm.MinimumSize = new Size(600, 500);
            inputForm.MaximumSize = new Size(600, 500);
            inputForm.StartPosition = FormStartPosition.CenterScreen;
            inputForm.Icon = Icon;

            int currentTop = 20;

            TextBox[] textBoxes = new TextBox[dgv_showTable.Columns.Count];
            for (int i = 0; i < dgv_showTable.Columns.Count; i++)
            {
                Label label = new Label
                {
                    Text = dgv_showTable.Columns[i].HeaderText,
                    Left = 20,
                    Top = currentTop,
                    AutoSize = true
                };
                inputForm.Controls.Add(label);

                textBoxes[i] = new TextBox
                {
                    Left = 200,
                    Top = currentTop,
                    Width = 200
                };
                inputForm.Controls.Add(textBoxes[i]);

                currentTop += 40;
            }

            Button confirmButton = new Button
            {
                Text = "Hinzufügen",
                Left = 150,
                Top = currentTop,
                Width = 120,
                Height = 40
            };
            confirmButton.Click += (s, args) =>
            {
                string[] rowValues = new string[dgv_showTable.Columns.Count];
                for (int i = 0; i < textBoxes.Length; i++)
                {
                    rowValues[i] = textBoxes[i].Text;
                }
                dgv_showTable.Rows.Add(rowValues);

                string columns = "";
                string values = "";
                for (int i = 0; i < dgv_showTable.Columns.Count; i++)
                {
                    columns += dgv_showTable.Columns[i].Name;
                    values += $"'{textBoxes[i].Text}'";
                    if (i != dgv_showTable.Columns.Count - 1)
                    {
                        columns += ",";
                        values += ",";
                    }
                }
                using MySqlCommand executeCommand = new MySqlCommand("", sqlVerbindung);
                executeCommand.CommandText = $"INSERT INTO {tableName} ({columns}) VALUES ({values})";
                executeCommandAsync(executeCommand);
                if (successImport)
                {
                    MessageBox.Show("Daten erfolgreich hinzugefügt.");
                }
                inputForm.Close();
            };
            inputForm.Controls.Add(confirmButton);

            Button cancelButton = new Button
            {
                Text = "Abbrechen",
                Left = 270,
                Top = currentTop,
                Width = 120,
                Height = 40
            };
            cancelButton.Click += (s, args) =>
            {
                inputForm.Close();
            };
            inputForm.Controls.Add(cancelButton);

            inputForm.ShowDialog();
        }
    }
}
