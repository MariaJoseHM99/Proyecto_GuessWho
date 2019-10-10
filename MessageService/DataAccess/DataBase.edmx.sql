
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/10/2019 11:18:58
-- Generated from EDMX file: C:\Users\Saarayim\Desktop\LISWHO\MessageService\DataAccess\DataBase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LisWho];
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

-- Creating table 'PlayerSet'
CREATE TABLE [dbo].[PlayerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [userName] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [score] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MatchSet'
CREATE TABLE [dbo].[MatchSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [numMatch] nvarchar(max)  NOT NULL,
    [Board_Id] int  NOT NULL
);
GO

-- Creating table 'BoardSet'
CREATE TABLE [dbo].[BoardSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [boardName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CharacterSet'
CREATE TABLE [dbo].[CharacterSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [characterName] nvarchar(max)  NOT NULL,
    [audio] nvarchar(max)  NOT NULL,
    [photograph] nvarchar(max)  NOT NULL,
    [Board_Id] int  NOT NULL
);
GO

-- Creating table 'QuestionSet'
CREATE TABLE [dbo].[QuestionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [question] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PlayerMatch'
CREATE TABLE [dbo].[PlayerMatch] (
    [Player_Id] int  NOT NULL,
    [Match_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'PlayerSet'
ALTER TABLE [dbo].[PlayerSet]
ADD CONSTRAINT [PK_PlayerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MatchSet'
ALTER TABLE [dbo].[MatchSet]
ADD CONSTRAINT [PK_MatchSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BoardSet'
ALTER TABLE [dbo].[BoardSet]
ADD CONSTRAINT [PK_BoardSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CharacterSet'
ALTER TABLE [dbo].[CharacterSet]
ADD CONSTRAINT [PK_CharacterSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'QuestionSet'
ALTER TABLE [dbo].[QuestionSet]
ADD CONSTRAINT [PK_QuestionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Player_Id], [Match_Id] in table 'PlayerMatch'
ALTER TABLE [dbo].[PlayerMatch]
ADD CONSTRAINT [PK_PlayerMatch]
    PRIMARY KEY CLUSTERED ([Player_Id], [Match_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Player_Id] in table 'PlayerMatch'
ALTER TABLE [dbo].[PlayerMatch]
ADD CONSTRAINT [FK_PlayerMatch_Player]
    FOREIGN KEY ([Player_Id])
    REFERENCES [dbo].[PlayerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Match_Id] in table 'PlayerMatch'
ALTER TABLE [dbo].[PlayerMatch]
ADD CONSTRAINT [FK_PlayerMatch_Match]
    FOREIGN KEY ([Match_Id])
    REFERENCES [dbo].[MatchSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerMatch_Match'
CREATE INDEX [IX_FK_PlayerMatch_Match]
ON [dbo].[PlayerMatch]
    ([Match_Id]);
GO

-- Creating foreign key on [Board_Id] in table 'MatchSet'
ALTER TABLE [dbo].[MatchSet]
ADD CONSTRAINT [FK_MatchBoard]
    FOREIGN KEY ([Board_Id])
    REFERENCES [dbo].[BoardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MatchBoard'
CREATE INDEX [IX_FK_MatchBoard]
ON [dbo].[MatchSet]
    ([Board_Id]);
GO

-- Creating foreign key on [Board_Id] in table 'CharacterSet'
ALTER TABLE [dbo].[CharacterSet]
ADD CONSTRAINT [FK_BoardCharacter]
    FOREIGN KEY ([Board_Id])
    REFERENCES [dbo].[BoardSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BoardCharacter'
CREATE INDEX [IX_FK_BoardCharacter]
ON [dbo].[CharacterSet]
    ([Board_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------