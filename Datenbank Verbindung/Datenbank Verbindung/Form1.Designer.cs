namespace Datenbank_Verbindung
{
    partial class frm_login
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frm_login));
            btn_login = new Button();
            tbx_password = new TextBox();
            tbx_username = new TextBox();
            lbl_username = new Label();
            lbl_passwort = new Label();
            pbx_logo = new PictureBox();
            ((System.ComponentModel.ISupportInitialize)pbx_logo).BeginInit();
            SuspendLayout();
            // 
            // btn_login
            // 
            btn_login.Location = new Point(89, 381);
            btn_login.Name = "btn_login";
            btn_login.Size = new Size(112, 34);
            btn_login.TabIndex = 4;
            btn_login.Text = "Login";
            btn_login.UseVisualStyleBackColor = true;
            btn_login.Click += btn_login_Click;
            // 
            // tbx_password
            // 
            tbx_password.Location = new Point(73, 344);
            tbx_password.Name = "tbx_password";
            tbx_password.PasswordChar = '*';
            tbx_password.Size = new Size(150, 31);
            tbx_password.TabIndex = 3;
            // 
            // tbx_username
            // 
            tbx_username.Location = new Point(73, 278);
            tbx_username.Name = "tbx_username";
            tbx_username.Size = new Size(150, 31);
            tbx_username.TabIndex = 1;
            // 
            // lbl_username
            // 
            lbl_username.AutoSize = true;
            lbl_username.Location = new Point(73, 250);
            lbl_username.Name = "lbl_username";
            lbl_username.Size = new Size(128, 25);
            lbl_username.TabIndex = 0;
            lbl_username.Text = "Benutzername:";
            // 
            // lbl_passwort
            // 
            lbl_passwort.AutoSize = true;
            lbl_passwort.Location = new Point(73, 316);
            lbl_passwort.Name = "lbl_passwort";
            lbl_passwort.Size = new Size(86, 25);
            lbl_passwort.TabIndex = 2;
            lbl_passwort.Text = "Passwort:";
            // 
            // pbx_logo
            // 
            pbx_logo.ErrorImage = (Image)resources.GetObject("pbx_logo.ErrorImage");
            pbx_logo.Image = (Image)resources.GetObject("pbx_logo.Image");
            pbx_logo.InitialImage = (Image)resources.GetObject("pbx_logo.InitialImage");
            pbx_logo.Location = new Point(11, 12);
            pbx_logo.Name = "pbx_logo";
            pbx_logo.Size = new Size(269, 235);
            pbx_logo.TabIndex = 5;
            pbx_logo.TabStop = false;
            // 
            // frm_login
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(292, 444);
            Controls.Add(pbx_logo);
            Controls.Add(lbl_passwort);
            Controls.Add(lbl_username);
            Controls.Add(tbx_username);
            Controls.Add(tbx_password);
            Controls.Add(btn_login);
            Icon = (Icon)resources.GetObject("$this.Icon");
            MaximumSize = new Size(314, 500);
            MinimumSize = new Size(314, 500);
            Name = "frm_login";
            Text = "MySQL Verbindung";
            Load += frm_login_Load;
            ((System.ComponentModel.ISupportInitialize)pbx_logo).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button btn_login;
        private TextBox tbx_password;
        private TextBox tbx_username;
        private Label lbl_username;
        private Label lbl_passwort;
        private PictureBox pbx_logo;
    }
}
