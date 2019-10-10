/*
 * 
 */



using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DataAccess;

namespace MessageService
{
    [ServiceContract]
    public interface IPlayerManager
    {
        [OperationContract]
        int AddPlayer(Player player);
    }

    [DataContract]
    public class Player
    {
        private String userName;
        private String password;
        private String email;
        private String score;

        [DataMember]
        public String UserName { get { return userName; } set { userName = value; } }

        [DataMember]
        public String Password { get { return password; } set { password = value; } }

        [DataMember]
        public String Email { get { return email; } set { email = value; } }

        [DataMember]
        public String Score { get { return score; } set { score = value; } }
    }
}
