using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Client {

    public partial class MainWindow : Window {

        public MainWindow() {
            InitializeComponent();
        }

        private void Button_CreateAccount_Click(object sender, RoutedEventArgs e) {
            CreateAccount newWindowCreateAccount = new CreateAccount();
            this.Hide();
            newWindowCreateAccount.Show();
        }

        private void Button_LogIn_Click(object sender, RoutedEventArgs e) {
            ServiceReference.PlayerManagerClient client = new ServiceReference.PlayerManagerClient();
            if (textBox_UserName.Text != "" && passwordBox_Password.Password != "") {
                bool Logging = client.LogIn(textBox_UserName.Text, passwordBox_Password.Password);
                if (Logging == true) {
                    Lobby lobby = new Lobby();
                    lobby.Show();
                    this.Close();
                } else {
                    label_Message.Content = "*Usuario y/o contraseña incorrectos";
                }
            } else {
                label_Message.Content = "*Complete los campos de Usuario y/o Contraseña";
            }
            client.Close();
        }

        private void TextBox_UserName_TextChanged(object sender, TextChangedEventArgs e) {

        }
    }
}
