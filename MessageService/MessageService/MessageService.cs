using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace MessageService
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código y en el archivo de configuración a la vez.
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código y en el archivo de configuración a la vez.
    public class MessageService : IUserManager
    {
        public int AddUser(User user)
        {
            Console.WriteLine("Adding user...{0},{1}", user.UserName, user.LastName);
            return 1;
        }
        public User GetUserById(string userId)
        {
            return new User
            {
                LastName = "Pérez Arriaga",
                UserName = "Juan Carlos"
            };
        }
    }
}
