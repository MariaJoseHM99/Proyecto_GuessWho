
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/06/2019 16:05:55
-- Generated from EDMX file: C:\Users\Saarayim\Desktop\LISWHO\MessageService\DataAccess\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GuessWho];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'JugadorSet'
CREATE TABLE [dbo].[JugadorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nombreUsuario] nvarchar(max)  NOT NULL,
    [contrasenia] nvarchar(max)  NOT NULL,
    [correoElectronico] nvarchar(max)  NOT NULL,
    [puntaje] nvarchar(max)  NOT NULL,
    [Partida_Id] int  NOT NULL
);
GO

-- Creating table 'MensajeSet'
CREATE TABLE [dbo].[MensajeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [mensaje] nvarchar(max)  NOT NULL,
    [Jugador_Id] int  NOT NULL
);
GO

-- Creating table 'PartidaSet'
CREATE TABLE [dbo].[PartidaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [noPartida] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PersonajeSet'
CREATE TABLE [dbo].[PersonajeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [audio] nvarchar(max)  NOT NULL,
    [nombre] nvarchar(max)  NOT NULL,
    [fotografia] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PreguntaSet'
CREATE TABLE [dbo].[PreguntaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [noPregunta] nvarchar(max)  NOT NULL,
    [pregunta] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PartidaPersonaje'
CREATE TABLE [dbo].[PartidaPersonaje] (
    [Partida_Id] int  NOT NULL,
    [Personaje_Id] int  NOT NULL
);
GO

-- Creating table 'PartidaPregunta'
CREATE TABLE [dbo].[PartidaPregunta] (
    [Partida_Id] int  NOT NULL,
    [Pregunta_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'JugadorSet'
ALTER TABLE [dbo].[JugadorSet]
ADD CONSTRAINT [PK_JugadorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MensajeSet'
ALTER TABLE [dbo].[MensajeSet]
ADD CONSTRAINT [PK_MensajeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PartidaSet'
ALTER TABLE [dbo].[PartidaSet]
ADD CONSTRAINT [PK_PartidaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PersonajeSet'
ALTER TABLE [dbo].[PersonajeSet]
ADD CONSTRAINT [PK_PersonajeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PreguntaSet'
ALTER TABLE [dbo].[PreguntaSet]
ADD CONSTRAINT [PK_PreguntaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Partida_Id], [Personaje_Id] in table 'PartidaPersonaje'
ALTER TABLE [dbo].[PartidaPersonaje]
ADD CONSTRAINT [PK_PartidaPersonaje]
    PRIMARY KEY CLUSTERED ([Partida_Id], [Personaje_Id] ASC);
GO

-- Creating primary key on [Partida_Id], [Pregunta_Id] in table 'PartidaPregunta'
ALTER TABLE [dbo].[PartidaPregunta]
ADD CONSTRAINT [PK_PartidaPregunta]
    PRIMARY KEY CLUSTERED ([Partida_Id], [Pregunta_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Jugador_Id] in table 'MensajeSet'
ALTER TABLE [dbo].[MensajeSet]
ADD CONSTRAINT [FK_JugadorMensaje]
    FOREIGN KEY ([Jugador_Id])
    REFERENCES [dbo].[JugadorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JugadorMensaje'
CREATE INDEX [IX_FK_JugadorMensaje]
ON [dbo].[MensajeSet]
    ([Jugador_Id]);
GO

-- Creating foreign key on [Partida_Id] in table 'JugadorSet'
ALTER TABLE [dbo].[JugadorSet]
ADD CONSTRAINT [FK_PartidaJugador]
    FOREIGN KEY ([Partida_Id])
    REFERENCES [dbo].[PartidaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartidaJugador'
CREATE INDEX [IX_FK_PartidaJugador]
ON [dbo].[JugadorSet]
    ([Partida_Id]);
GO

-- Creating foreign key on [Partida_Id] in table 'PartidaPersonaje'
ALTER TABLE [dbo].[PartidaPersonaje]
ADD CONSTRAINT [FK_PartidaPersonaje_Partida]
    FOREIGN KEY ([Partida_Id])
    REFERENCES [dbo].[PartidaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Personaje_Id] in table 'PartidaPersonaje'
ALTER TABLE [dbo].[PartidaPersonaje]
ADD CONSTRAINT [FK_PartidaPersonaje_Personaje]
    FOREIGN KEY ([Personaje_Id])
    REFERENCES [dbo].[PersonajeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartidaPersonaje_Personaje'
CREATE INDEX [IX_FK_PartidaPersonaje_Personaje]
ON [dbo].[PartidaPersonaje]
    ([Personaje_Id]);
GO

-- Creating foreign key on [Partida_Id] in table 'PartidaPregunta'
ALTER TABLE [dbo].[PartidaPregunta]
ADD CONSTRAINT [FK_PartidaPregunta_Partida]
    FOREIGN KEY ([Partida_Id])
    REFERENCES [dbo].[PartidaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Pregunta_Id] in table 'PartidaPregunta'
ALTER TABLE [dbo].[PartidaPregunta]
ADD CONSTRAINT [FK_PartidaPregunta_Pregunta]
    FOREIGN KEY ([Pregunta_Id])
    REFERENCES [dbo].[PreguntaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartidaPregunta_Pregunta'
CREATE INDEX [IX_FK_PartidaPregunta_Pregunta]
ON [dbo].[PartidaPregunta]
    ([Pregunta_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------