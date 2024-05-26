namespace Datenbank_Verbindung
{
    partial class Form2
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form2));
            lbx_tables = new ListBox();
            btn_showTable = new Button();
            btn_dropTable = new Button();
            btn_sqlCommand = new Button();
            btn_logout = new Button();
            SuspendLayout();
            // 
            // lbx_tables
            // 
            lbx_tables.FormattingEnabled = true;
            lbx_tables.ItemHeight = 25;
            lbx_tables.Location = new Point(12, 12);
            lbx_tables.Name = "lbx_tables";
            lbx_tables.Size = new Size(195, 404);
            lbx_tables.TabIndex = 0;
            // 
            // btn_showTable
            // 
            btn_showTable.Location = new Point(226, 12);
            btn_showTable.Name = "btn_showTable";
            btn_showTable.Size = new Size(273, 34);
            btn_showTable.TabIndex = 1;
            btn_showTable.Text = "Ausgewählte Tabelle öffnen";
            btn_showTable.UseVisualStyleBackColor = true;
            // 
            // btn_dropTable
            // 
            btn_dropTable.Location = new Point(226, 52);
            btn_dropTable.Name = "btn_dropTable";
            btn_dropTable.Size = new Size(273, 34);
            btn_dropTable.TabIndex = 2;
            btn_dropTable.Text = "Ausgewählte Tabelle löschen";
            btn_dropTable.UseVisualStyleBackColor = true;
            // 
            // btn_sqlCommand
            // 
            btn_sqlCommand.Location = new Point(226, 92);
            btn_sqlCommand.Name = "btn_sqlCommand";
            btn_sqlCommand.Size = new Size(273, 34);
            btn_sqlCommand.TabIndex = 3;
            btn_sqlCommand.Text = "SQL Befehl eingeben";
            btn_sqlCommand.UseVisualStyleBackColor = true;
            // 
            // btn_logout
            // 
            btn_logout.Location = new Point(226, 382);
            btn_logout.Name = "btn_logout";
            btn_logout.Size = new Size(273, 34);
            btn_logout.TabIndex = 4;
            btn_logout.Text = "Abmelden";
            btn_logout.UseVisualStyleBackColor = true;
            // 
            // Form2
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(527, 450);
            Controls.Add(btn_logout);
            Controls.Add(btn_sqlCommand);
            Controls.Add(btn_dropTable);
            Controls.Add(btn_showTable);
            Controls.Add(lbx_tables);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Name = "Form2";
            Text = "Tabellen Ansicht";
            Load += Form2_Load;
            ResumeLayout(false);
        }

        #endregion

        private ListBox lbx_tables;
        private Button btn_showTable;
        private Button btn_dropTable;
        private Button btn_sqlCommand;
        private Button btn_logout;
    }
}