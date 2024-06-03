namespace Datenbank_Verbindung
{
    partial class Form3
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form3));
            dgv_showTable = new DataGridView();
            btn_zurück = new Button();
            btn_delRow = new Button();
            btn_addRow = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv_showTable).BeginInit();
            SuspendLayout();
            // 
            // dgv_showTable
            // 
            dgv_showTable.AllowUserToAddRows = false;
            dgv_showTable.AllowUserToDeleteRows = false;
            dgv_showTable.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_showTable.Location = new Point(12, 12);
            dgv_showTable.Name = "dgv_showTable";
            dgv_showTable.RowHeadersVisible = false;
            dgv_showTable.RowHeadersWidth = 62;
            dgv_showTable.Size = new Size(1111, 262);
            dgv_showTable.TabIndex = 0;
            // 
            // btn_zurück
            // 
            btn_zurück.Location = new Point(950, 280);
            btn_zurück.Name = "btn_zurück";
            btn_zurück.Size = new Size(173, 34);
            btn_zurück.TabIndex = 1;
            btn_zurück.Text = "Zurück";
            btn_zurück.UseVisualStyleBackColor = true;
            btn_zurück.Click += btn_zurück_Click;
            // 
            // btn_delRow
            // 
            btn_delRow.Location = new Point(236, 280);
            btn_delRow.Name = "btn_delRow";
            btn_delRow.Size = new Size(218, 34);
            btn_delRow.TabIndex = 3;
            btn_delRow.Text = "Zeile entfernen";
            btn_delRow.UseVisualStyleBackColor = true;
            btn_delRow.Click += btn_delRow_Click;
            // 
            // btn_addRow
            // 
            btn_addRow.Location = new Point(12, 280);
            btn_addRow.Name = "btn_addRow";
            btn_addRow.Size = new Size(218, 34);
            btn_addRow.TabIndex = 4;
            btn_addRow.Text = "Zeile hinzufügen";
            btn_addRow.UseVisualStyleBackColor = true;
            btn_addRow.Click += btn_addRow_Click;
            // 
            // Form3
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1135, 333);
            Controls.Add(btn_addRow);
            Controls.Add(btn_delRow);
            Controls.Add(btn_zurück);
            Controls.Add(dgv_showTable);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Name = "Form3";
            Text = "tempName";
            Load += Form3_Load;
            ((System.ComponentModel.ISupportInitialize)dgv_showTable).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView dgv_showTable;
        private Button btn_zurück;
        private Button btn_delRow;
        private Button btn_addRow;
    }
}