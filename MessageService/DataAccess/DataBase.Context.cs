﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DataBaseContainer : DbContext
    {
        public DataBaseContainer()
            : base("name=DataBaseContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Player> PlayerSet { get; set; }
        public virtual DbSet<Match> MatchSet { get; set; }
        public virtual DbSet<Board> BoardSet { get; set; }
        public virtual DbSet<Character> CharacterSet { get; set; }
        public virtual DbSet<Question> QuestionSet { get; set; }
    }
}
