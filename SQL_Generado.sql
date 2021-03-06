
IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Animes] (
    [id_anime] int NOT NULL IDENTITY,
    [nombre] varchar(255) NOT NULL,
    [genero] varchar(100) NULL,
    [nombre_en_ingles] varchar(255) NULL,
    CONSTRAINT [PK_Animes] PRIMARY KEY ([id_anime])
);
GO

CREATE TABLE [Historial] (
    [id_historial] int NOT NULL IDENTITY,
    [id_anime] int NOT NULL,
    [id_temp] int NOT NULL,
    [fecha_inicio] datetime NULL,
    [fecha_fin] datetime NULL,
    [fecha_pausa] datetime NULL,
    [visto_en] varchar(200) NULL,
    CONSTRAINT [PK_Historial] PRIMARY KEY ([id_historial]),
    CONSTRAINT [FK_historial_animes] FOREIGN KEY ([id_anime]) REFERENCES [Animes] ([id_anime]) ON DELETE NO ACTION
);
GO

CREATE TABLE [Temporadas] (
    [id_anime] int NOT NULL,
    [id_temporada] int NOT NULL,
    [nombre_temporada] varchar(500) NULL,
    [estado] varchar(500) NULL,
    [tipo] varchar(50) NULL,
    [temporada_estreno] varchar(400) NULL,
    CONSTRAINT [PK_Temporadas] PRIMARY KEY ([id_anime], [id_temporada]),
    CONSTRAINT [FK_temporadas_animes] FOREIGN KEY ([id_anime]) REFERENCES [Animes] ([id_anime]) ON DELETE NO ACTION
);
GO

CREATE INDEX [IX_Historial_id_anime] ON [Historial] ([id_anime]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210412120009_MigracionAnimesDBInicial', N'5.0.4');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Temporadas] ADD [IdTemporadaNavigationIdAnime] int NULL;
GO

ALTER TABLE [Temporadas] ADD [IdTemporadaNavigationIdTemporada] int NULL;
GO

ALTER TABLE [Historial] ADD [IdTemporadaNavigationIdAnime] int NULL;
GO

ALTER TABLE [Historial] ADD [IdTemporadaNavigationIdTemporada] int NULL;
GO

CREATE INDEX [IX_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] ON [Temporadas] ([IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]);
GO

CREATE INDEX [IX_Historial_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] ON [Historial] ([IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]);
GO

ALTER TABLE [Historial] ADD CONSTRAINT [FK_Historial_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] FOREIGN KEY 
([IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) REFERENCES [Temporadas] ([id_anime], [id_temporada]) ON DELETE NO ACTION;
GO

ALTER TABLE [Temporadas] ADD CONSTRAINT [FK_Temporadas_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] FOREIGN KEY 
([IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) REFERENCES [Temporadas] ([id_anime], [id_temporada]) ON DELETE NO ACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210422175625_UnionHistorialTemporadas', N'5.0.4');
GO

COMMIT;
GO


