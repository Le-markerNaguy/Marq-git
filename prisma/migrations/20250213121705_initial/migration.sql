-- CreateTable
CREATE TABLE "Admin" (
    "id_admin" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom_administrateur" TEXT NOT NULL,
    "mot_de_passe_admin" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Client" (
    "id_client" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT NOT NULL,
    "prenom" TEXT,
    "date_de_naissance" DATETIME NOT NULL,
    "sexe" TEXT NOT NULL,
    "email" TEXT
);

-- CreateTable
CREATE TABLE "Reservation" (
    "id_reservation_" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date_et_heure" DATETIME NOT NULL,
    "mode_de_paiement" TEXT NOT NULL,
    "montant" REAL NOT NULL,
    "statut" TEXT NOT NULL,
    "id_client" INTEGER NOT NULL,
    "id_admin" INTEGER NOT NULL,
    CONSTRAINT "Reservation_id_client_fkey" FOREIGN KEY ("id_client") REFERENCES "Client" ("id_client") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Reservation_id_admin_fkey" FOREIGN KEY ("id_admin") REFERENCES "Admin" ("id_admin") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Place" (
    "id_place" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numero_siege" TEXT NOT NULL,
    "type_de_place" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Film" (
    "id_film" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titre" TEXT NOT NULL,
    "date_et_heure_de_la_seance" DATETIME NOT NULL,
    "salle_de_cinema" TEXT NOT NULL,
    "version_du_film" TEXT NOT NULL,
    "type_de_projection" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Contenir" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_Contenir_A_fkey" FOREIGN KEY ("A") REFERENCES "Place" ("id_place") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_Contenir_B_fkey" FOREIGN KEY ("B") REFERENCES "Reservation" ("id_reservation_") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_Inclure" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_Inclure_A_fkey" FOREIGN KEY ("A") REFERENCES "Film" ("id_film") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_Inclure_B_fkey" FOREIGN KEY ("B") REFERENCES "Reservation" ("id_reservation_") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Admin_mot_de_passe_admin_key" ON "Admin"("mot_de_passe_admin");

-- CreateIndex
CREATE UNIQUE INDEX "Client_email_key" ON "Client"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_Contenir_AB_unique" ON "_Contenir"("A", "B");

-- CreateIndex
CREATE INDEX "_Contenir_B_index" ON "_Contenir"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Inclure_AB_unique" ON "_Inclure"("A", "B");

-- CreateIndex
CREATE INDEX "_Inclure_B_index" ON "_Inclure"("B");
