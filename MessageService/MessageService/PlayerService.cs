using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DataAccess;

namespace MessageService {    

    public class PlayerService : IPlayerManager {

        public void AddPlayer(Player player) {
            DataBaseContainer dataBase = new DataBaseContainer();
            dataBase.PlayerSet.Add(new DataAccess.Player {
                userName = player.UserName,
                password = player.Password,
                email = player.Email,
                score = "0",

            });
            dataBase.SaveChanges();
            dataBase.Dispose();
            Console.WriteLine(player.UserName);
        }

        public bool LogIn(String userName, String password) {
            using (DataBaseContainer dataBase = new DataBaseContainer()) {
                var playerFinded = dataBase.PlayerSet.Where(player => player.userName == userName &&
                player.password == password).Count();
                if (playerFinded > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        }

        public bool FindPlayer(String userName, String email) {
            using (DataBaseContainer dataBase = new DataBaseContainer()) {
                var playerFinded = dataBase.PlayerSet.Where(player => player.userName == userName ||
                player.email == email).Count();
                if (playerFinded > 0) {
                    return false;
                } else {
                    return true;
                }
            }
        }
    }
}
