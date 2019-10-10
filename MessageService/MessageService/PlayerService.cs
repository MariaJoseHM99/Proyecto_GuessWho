using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DataAccess;

namespace MessageService
{    
    public class PlayerService : IPlayerManager
    {
        public int AddPlayer(Player player)
        {
            DataBaseContainer dataBase = new DataBaseContainer();
            dataBase.PlayerSet.Add(new DataAccess.Player
            {
                userName = player.UserName,
                password = player.Password,
                email = player.Email,
                score = "0",

            });


            dataBase.SaveChanges();


            Console.WriteLine(player.UserName);
            return 1;
        }
    }
}
