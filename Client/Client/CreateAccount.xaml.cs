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
//Holaaaaaa
//    como
//    estan
namespace Client {
    /// <summary>
    /// Lógica de interacción para CreateAccount.xaml
    /// </summary>
    public partial class CreateAccount : Window {
        public CreateAccount() {
            InitializeComponent();
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e) {
            this.Close();
        }

        private void Button_Send_Click(object sender, RoutedEventArgs e) {
            String userName = textBox_UserName.Text;
            String password = passwordBox_Password.Password;
            String passwordConfirmed = passwordBox_PasswordConfirmed.Password;
            String email = textBox_Email.Text;
            String emailConfirmed = textBox_EmailConfirmed.Text;

            if (userName == "" || password == "" || passwordConfirmed == "" || email == "" || emailConfirmed == "") {

            }
            else {

                if (password == passwordConfirmed){
                    if (email == emailConfirmed) {
                        ServiceReference.Player player = new ServiceReference.Player();
                        ServiceReference.PlayerManagerClient client = new ServiceReference.PlayerManagerClient();
                        player.UserName = userName;
                        player.Password = password;
                        player.Email = email;
                        client.AddPlayer(player);
                    } else {

                    }
                } else {

                }
            }

        }

        private void TextBox_PasswordAcepted_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
