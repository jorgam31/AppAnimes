﻿// <auto-generated />
using System;
using AppAnimes.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace AppAnimes.Migrations
{
    [DbContext(typeof(AppAnimesDBContext))]
    [Migration("20210812144712_ChangedFKVistoEnHistorial")]
    partial class ChangedFKVistoEnHistorial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.4")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("AppAnimes.Models.Anime", b =>
                {
                    b.Property<int>("AnimeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Genero")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(255)
                        .IsUnicode(false)
                        .HasColumnType("varchar(255)");

                    b.Property<string>("NombreIngles")
                        .HasMaxLength(255)
                        .IsUnicode(false)
                        .HasColumnType("varchar(255)");

                    b.HasKey("AnimeId");

                    b.ToTable("Animes");
                });

            modelBuilder.Entity("AppAnimes.Models.Historial", b =>
                {
                    b.Property<int>("IdHistorial")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id_historial")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("AnimeId")
                        .HasColumnType("int");

                    b.Property<int?>("AnyoVisto")
                        .HasColumnType("int");

                    b.Property<DateTime?>("FechaFin")
                        .HasColumnType("datetime");

                    b.Property<DateTime?>("FechaInicio")
                        .HasColumnType("datetime");

                    b.Property<int?>("TemporadaId")
                        .HasColumnType("int");

                    b.Property<int>("VistoEn")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("int");

                    b.HasKey("IdHistorial");

                    b.HasIndex("AnimeId");

                    b.HasIndex("TemporadaId");

                    b.HasIndex("VistoEn");

                    b.ToTable("Historial");
                });

            modelBuilder.Entity("AppAnimes.Models.Temporada", b =>
                {
                    b.Property<int>("TemporadaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("AnimeId")
                        .HasColumnType("int");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.Property<string>("NombreTemporada")
                        .HasMaxLength(250)
                        .IsUnicode(false)
                        .HasColumnType("varchar(250)");

                    b.Property<int?>("NumeroTemporada")
                        .HasColumnType("int");

                    b.Property<string>("TemporadaEstreno")
                        .IsRequired()
                        .HasMaxLength(200)
                        .IsUnicode(false)
                        .HasColumnType("varchar(200)");

                    b.Property<string>("Tipo")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("tipo");

                    b.HasKey("TemporadaId");

                    b.HasIndex("AnimeId");

                    b.ToTable("Temporadas");
                });

            modelBuilder.Entity("AppAnimesNuevo.Models.Paginas", b =>
                {
                    b.Property<int>("paginaId")
                        .ValueGeneratedOnAdd()
                        .IsUnicode(false)
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("esFansub")
                        .HasColumnType("bit");

                    b.Property<bool>("esLegal")
                        .HasColumnType("bit");

                    b.Property<bool>("estaActivo")
                        .HasColumnType("bit");

                    b.Property<bool>("estaDisponible")
                        .HasColumnType("bit");

                    b.Property<string>("nombrePagina")
                        .IsRequired()
                        .HasMaxLength(500)
                        .HasColumnType("nvarchar(500)");

                    b.Property<string>("urlPagina")
                        .HasMaxLength(500)
                        .HasColumnType("nvarchar(500)");

                    b.HasKey("paginaId");

                    b.ToTable("Paginas");
                });

            modelBuilder.Entity("AppAnimes.Models.Historial", b =>
                {
                    b.HasOne("AppAnimes.Models.Anime", "Anime")
                        .WithMany("Historials")
                        .HasForeignKey("AnimeId")
                        .HasConstraintName("FK_Historial_Animes")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("AppAnimes.Models.Temporada", "Temporada")
                        .WithMany("Historials")
                        .HasForeignKey("TemporadaId")
                        .HasConstraintName("FK_Historial_Temporadas");

                    b.HasOne("AppAnimesNuevo.Models.Paginas", "Pagina")
                        .WithMany("Historials")
                        .HasForeignKey("VistoEn")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Anime");

                    b.Navigation("Pagina");

                    b.Navigation("Temporada");
                });

            modelBuilder.Entity("AppAnimes.Models.Temporada", b =>
                {
                    b.HasOne("AppAnimes.Models.Anime", "Anime")
                        .WithMany("Temporadas")
                        .HasForeignKey("AnimeId")
                        .HasConstraintName("FK_Temporadas_Animes")
                        .OnDelete(DeleteBehavior.NoAction);

                    b.Navigation("Anime");
                });

            modelBuilder.Entity("AppAnimes.Models.Anime", b =>
                {
                    b.Navigation("Historials");

                    b.Navigation("Temporadas");
                });

            modelBuilder.Entity("AppAnimes.Models.Temporada", b =>
                {
                    b.Navigation("Historials");
                });

            modelBuilder.Entity("AppAnimesNuevo.Models.Paginas", b =>
                {
                    b.Navigation("Historials");
                });
#pragma warning restore 612, 618
        }
    }
}
