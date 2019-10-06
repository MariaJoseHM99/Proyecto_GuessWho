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

namespace Cliente
{
    /// <summary>
    /// Lógica de interacción para Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void Button_Retroceder_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        /*
             
        */

        private void Button_Enviar_Click(object sender, RoutedEventArgs e)
        {
            String usuario = textBox_UsuarioR.Text;
            String contrasenia = textBox_ContraseniaR.Text;
            String confirmarContrasenia = textBox_ConfirmarContrasenia.Text;
            String correoE = textBox_CorreoElectronico.Text;
            String confirmarCorreoE = textBox_ConfirmarCorreoE.Text;
            if (usuario == "" || contrasenia == "" || confirmarContrasenia == "" || correoE == "" || confirmarCorreoE == "")
            {
                textBox_Mensaje.Text = "Complete todos los campos";
                textBox_Mensaje.IsReadOnly = true;
            }
            
            else
            {
                
            }
        }
    }
}
