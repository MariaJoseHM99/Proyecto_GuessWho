using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace MessageService
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IUserManager
    {
        [OperationContract]
        int AddUser(User user);
        [OperationContract]
        User GetUserById(String userId);

        // TODO: agregue aquí sus operaciones de servicio
    }

    // Utilice un contrato de datos, como se ilustra en el ejemplo siguiente, para agregar tipos compuestos a las operaciones de servicio.
    // Puede agregar archivos XSD al proyecto. Después de compilar el proyecto, puede usar directamente los tipos de datos definidos aquí, con el espacio de nombres "MessageService.ContractType".
    [DataContract] //Marcado para serializar
    public class User
    {
        private string userName;
        private string lastName;

        [DataMember]
        public String UserName { get { return userName; } set { userName = value; } }

        [DataMember]
        public String LastName { get { return lastName; } set { lastName = value; } }
    }
}
