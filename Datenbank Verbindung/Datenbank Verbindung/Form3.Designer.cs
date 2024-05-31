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
            // Form3
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1135, 333);
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
    }
}