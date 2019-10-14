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
using System.Windows.Shapes;
using System.Text.RegularExpressions;

namespace Client {

    public partial class CreateAccount : Window {

        public CreateAccount() {
            InitializeComponent();
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e) {
            MainWindow mainWindow = new MainWindow();
            this.Close();
            mainWindow.Show();
        }

        private void Button_Send_Click(object sender, RoutedEventArgs e) {
            using (ServiceReference.PlayerManagerClient client = new ServiceReference.PlayerManagerClient()) {
                if (ValidateBlankSpaces(textBox_UserName.Text, passwordBox_Password.Password, passwordBox_PasswordConfirmed.Password,
                textBox_Email.Text, textBox_EmailConfirmed.Text)) {
                    label_Message.Content = "*Debe completar todos campos";
                } else {
                    bool playerFinded = client.FindPlayer(textBox_UserName.Text, textBox_Email.Text);
                    if (playerFinded == true) {
                        if (passwordBox_Password.Password == passwordBox_PasswordConfirmed.Password) {
                            if (textBox_Email.Text == textBox_EmailConfirmed.Text) {
                                if (ValidateEmail(textBox_Email.Text) == true) {
                                    MainWindow mainWindow = new MainWindow();
                                    SendPlayer();
                                    this.Close();
                                    mainWindow.Show();
                                } else {
                                    label_Message.Content = "*Introduzca un correo electrónico válido";
                                }
                            } else {
                                label_Message.Content = "*El correo electrónico y/o contraseña deben coincidir";
                            }
                        } else {
                            label_Message.Content = "*El correo electrónico y/o contraseña deben coincidir";
                        }
                    } else {
                        label_Message.Content = "*Nombre de usuario y/o Correo electrónico ocupado";
                    }
                }
            }
        }

        private void SendPlayer() {
            ServiceReference.Player player = new ServiceReference.Player();
            ServiceReference.PlayerManagerClient client = new ServiceReference.PlayerManagerClient();
            player.UserName = textBox_UserName.Text;
            player.Password = passwordBox_Password.Password;
            player.Email = textBox_Email.Text;
            player.Score = "0";
            client.AddPlayer(player);
            client.Close();
        }

        private bool ValidateEmail(String email) {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion)) {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }

        private bool ValidateBlankSpaces(String userName, String password,
        String passwordConfirmed, String email, String emailConfirmed) {
            if (userName == "" || password == "" ||passwordConfirmed == "" || email == "" ||
                emailConfirmed == "") {
                return true;
            } else {
                return false;
            }
        }

        private void TextBox_PasswordAcepted_TextChanged(object sender, TextChangedEventArgs e) {

        }

        private void TextBox_UserName_TextChanged(object sender, TextChangedEventArgs e) {

        }
    }
}
