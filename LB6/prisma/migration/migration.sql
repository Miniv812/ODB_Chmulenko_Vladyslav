-- CreateEnum
CREATE TYPE "creature_types" AS ENUM ('Animal', 'Elemental', 'Demon', 'Mechanism', 'Murloc');

-- CreateEnum
CREATE TYPE "creature_types_damage" AS ENUM ('Fire', 'Elemental', 'Melee', 'Ranged', 'Magic');

-- CreateEnum
CREATE TYPE "hotel_stars" AS ENUM ('STAR_1', 'STAR_2', 'STAR_3', 'STAR_4', 'STAR_5');

-- CreateEnum
CREATE TYPE "local_complexity" AS ENUM ('EASY', 'MEDIUM', 'HARD');

-- CreateEnum
CREATE TYPE "local_size" AS ENUM ('SMALL', 'MEDIUM', 'LARGE');

-- CreateEnum
CREATE TYPE "player_class" AS ENUM ('MAGE', 'WARRIOR', 'ARCHER');

-- CreateEnum
CREATE TYPE "reservations_status" AS ENUM ('BOOKED', 'CANCELED', 'COMPLETED');

-- CreateEnum
CREATE TYPE "user_status" AS ENUM ('ONLINE', 'OFFLINE');

-- CreateTable
CREATE TABLE "award" (
    "quest_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,

    CONSTRAINT "award_pkey" PRIMARY KEY ("quest_id","item_id")
);

-- CreateTable
CREATE TABLE "creature" (
    "creature_id" SERIAL NOT NULL,
    "creature_name" VARCHAR(30) NOT NULL,
    "creature_description" TEXT,
    "creature_type" "creature_types" NOT NULL,
    "creature_characteristics" TEXT NOT NULL,
    "creature_type_damage" "creature_types_damage" NOT NULL,

    CONSTRAINT "creature_pkey" PRIMARY KEY ("creature_id")
);

-- CreateTable
CREATE TABLE "creature_item" (
    "creature_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,

    CONSTRAINT "creature_item_pkey" PRIMARY KEY ("creature_id","item_id")
);

-- CreateTable
CREATE TABLE "creature_location" (
    "creature_id" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,
    "spawn_time" INTEGER,

    CONSTRAINT "creature_location_pkey" PRIMARY KEY ("creature_id","location_id")
);

-- CreateTable
CREATE TABLE "customers" (
    "customer_id" SERIAL NOT NULL,
    "customer_name" VARCHAR(50) NOT NULL,
    "customer_surname" VARCHAR(80),
    "customer_phone" VARCHAR(20) NOT NULL,
    "customer_email" VARCHAR(100) NOT NULL,
    "customer_password" VARCHAR(100) NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "guild" (
    "guild_id" SERIAL NOT NULL,
    "guild_name" VARCHAR(50) NOT NULL,
    "guild_description" TEXT,
    "guild_lvl" INTEGER NOT NULL,
    "guild_date_start" DATE NOT NULL,
    "guild_reputation" INTEGER NOT NULL,

    CONSTRAINT "guild_pkey" PRIMARY KEY ("guild_id")
);

-- CreateTable
CREATE TABLE "hotel" (
    "hotel_id" SERIAL NOT NULL,
    "hotel_name" VARCHAR(100) NOT NULL,
    "hotel_star" "hotel_stars" NOT NULL,
    "hotel_city" VARCHAR(100) NOT NULL,
    "hotel_adress" VARCHAR(120) NOT NULL,

    CONSTRAINT "hotel_pkey" PRIMARY KEY ("hotel_id")
);

-- CreateTable
CREATE TABLE "item" (
    "item_id" SERIAL NOT NULL,
    "item_name" VARCHAR(30) NOT NULL,
    "item_characteristics" TEXT NOT NULL,
    "item_cost" INTEGER,
    "item_tradeable" BOOLEAN NOT NULL,

    CONSTRAINT "item_pkey" PRIMARY KEY ("item_id")
);

-- CreateTable
CREATE TABLE "killing" (
    "quest_id" INTEGER NOT NULL,
    "creature_id" INTEGER NOT NULL,

    CONSTRAINT "killing_pkey" PRIMARY KEY ("quest_id","creature_id")
);

-- CreateTable
CREATE TABLE "location" (
    "location_id" SERIAL NOT NULL,
    "location_name" VARCHAR(20) NOT NULL,
    "location_size" "local_size" NOT NULL,
    "location_complexity" "local_complexity" NOT NULL,
    "location_min_lvl" INTEGER NOT NULL,

    CONSTRAINT "location_pkey" PRIMARY KEY ("location_id")
);

-- CreateTable
CREATE TABLE "location_guild" (
    "guild_id" INTEGER,
    "location_id" INTEGER
);

-- CreateTable
CREATE TABLE "player" (
    "player_id" SERIAL NOT NULL,
    "player_name" VARCHAR(30) NOT NULL,
    "player_characteristics" TEXT NOT NULL,
    "pclass" "player_class" NOT NULL,
    "player_lvl" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "guild_id" INTEGER,

    CONSTRAINT "player_pkey" PRIMARY KEY ("player_id")
);

-- CreateTable
CREATE TABLE "player_item" (
    "player_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "player_item_pkey" PRIMARY KEY ("player_id","item_id")
);

-- CreateTable
CREATE TABLE "quest" (
    "quest_id" SERIAL NOT NULL,
    "quest_name" VARCHAR(40) NOT NULL,
    "quest_description" TEXT NOT NULL,
    "quest_complexity" "local_complexity" NOT NULL,
    "quest_repeatable" BOOLEAN NOT NULL,

    CONSTRAINT "quest_pkey" PRIMARY KEY ("quest_id")
);

-- CreateTable
CREATE TABLE "quest_guild" (
    "quest_id" INTEGER NOT NULL,
    "guild_id" INTEGER NOT NULL,

    CONSTRAINT "quest_guild_pkey" PRIMARY KEY ("quest_id","guild_id")
);

-- CreateTable
CREATE TABLE "quest_location" (
    "quest_id" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,

    CONSTRAINT "quest_location_pkey" PRIMARY KEY ("quest_id","location_id")
);

-- CreateTable
CREATE TABLE "reservation" (
    "reservation_id" SERIAL NOT NULL,
    "check_in_date" DATE NOT NULL,
    "check_out_date" DATE NOT NULL,
    "number_of_customers" INTEGER NOT NULL,
    "customer_id" INTEGER,
    "room_id" INTEGER,
    "reservation_status" "reservations_status" NOT NULL,

    CONSTRAINT "reservation_pkey" PRIMARY KEY ("reservation_id")
);

-- CreateTable
CREATE TABLE "room" (
    "room_id" SERIAL NOT NULL,
    "room_number" INTEGER NOT NULL,
    "hotel_id" INTEGER NOT NULL,
    "room_type" INTEGER NOT NULL,

    CONSTRAINT "room_pkey" PRIMARY KEY ("room_id")
);

-- CreateTable
CREATE TABLE "room_type" (
    "type_id" SERIAL NOT NULL,
    "type_name" VARCHAR(50) NOT NULL,
    "capacity" INTEGER NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "description" TEXT,

    CONSTRAINT "room_type_pkey" PRIMARY KEY ("type_id")
);

-- CreateTable
CREATE TABLE "user" (
    "user_id" SERIAL NOT NULL,
    "user_nickname" VARCHAR(20) NOT NULL,
    "user_email" VARCHAR(40) NOT NULL,
    "user_password" VARCHAR(256) NOT NULL,
    "status" "user_status" NOT NULL,
    "user_starting_date" DATE NOT NULL,
    "last_login" TIMESTAMP(3),

    CONSTRAINT "user_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "review" (
    "review_id" SERIAL NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "item_id" INTEGER NOT NULL,

    CONSTRAINT "review_pkey" PRIMARY KEY ("review_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "award_item_id_key" ON "award"("item_id");

-- CreateIndex
CREATE UNIQUE INDEX "creature_creature_name_key" ON "creature"("creature_name");

-- CreateIndex
CREATE UNIQUE INDEX "customers_customer_phone_key" ON "customers"("customer_phone");

-- CreateIndex
CREATE UNIQUE INDEX "customers_customer_email_key" ON "customers"("customer_email");

-- CreateIndex
CREATE UNIQUE INDEX "guild_guild_name_key" ON "guild"("guild_name");

-- CreateIndex
CREATE UNIQUE INDEX "location_location_name_key" ON "location"("location_name");

-- CreateIndex
CREATE UNIQUE INDEX "location_guild_guild_id_key" ON "location_guild"("guild_id");

-- CreateIndex
CREATE UNIQUE INDEX "location_guild_location_id_key" ON "location_guild"("location_id");

-- CreateIndex
CREATE UNIQUE INDEX "player_player_name_key" ON "player"("player_name");

-- CreateIndex
CREATE UNIQUE INDEX "quest_quest_name_key" ON "quest"("quest_name");

-- CreateIndex
CREATE UNIQUE INDEX "room_hotel_id_room_number_key" ON "room"("hotel_id", "room_number");

-- CreateIndex
CREATE UNIQUE INDEX "room_type_type_name_key" ON "room_type"("type_name");

-- CreateIndex
CREATE UNIQUE INDEX "user_user_nickname_key" ON "user"("user_nickname");

-- CreateIndex
CREATE UNIQUE INDEX "user_user_email_key" ON "user"("user_email");

-- AddForeignKey
ALTER TABLE "award" ADD CONSTRAINT "award_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("item_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "award" ADD CONSTRAINT "award_quest_id_fkey" FOREIGN KEY ("quest_id") REFERENCES "quest"("quest_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "creature_item" ADD CONSTRAINT "creature_item_creature_id_fkey" FOREIGN KEY ("creature_id") REFERENCES "creature"("creature_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "creature_item" ADD CONSTRAINT "creature_item_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("item_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "creature_location" ADD CONSTRAINT "creature_location_creature_id_fkey" FOREIGN KEY ("creature_id") REFERENCES "creature"("creature_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "creature_location" ADD CONSTRAINT "creature_location_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "killing" ADD CONSTRAINT "killing_creature_id_fkey" FOREIGN KEY ("creature_id") REFERENCES "creature"("creature_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "killing" ADD CONSTRAINT "killing_quest_id_fkey" FOREIGN KEY ("quest_id") REFERENCES "quest"("quest_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "location_guild" ADD CONSTRAINT "location_guild_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "guild"("guild_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "location_guild" ADD CONSTRAINT "location_guild_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player" ADD CONSTRAINT "player_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "guild"("guild_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player" ADD CONSTRAINT "player_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player_item" ADD CONSTRAINT "player_item_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("item_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "player_item" ADD CONSTRAINT "player_item_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "player"("player_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quest_guild" ADD CONSTRAINT "quest_guild_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "guild"("guild_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quest_guild" ADD CONSTRAINT "quest_guild_quest_id_fkey" FOREIGN KEY ("quest_id") REFERENCES "quest"("quest_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quest_location" ADD CONSTRAINT "quest_location_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quest_location" ADD CONSTRAINT "quest_location_quest_id_fkey" FOREIGN KEY ("quest_id") REFERENCES "quest"("quest_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reservation" ADD CONSTRAINT "reservation_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reservation" ADD CONSTRAINT "reservation_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "room"("room_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room" ADD CONSTRAINT "room_hotel_id_fkey" FOREIGN KEY ("hotel_id") REFERENCES "hotel"("hotel_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room" ADD CONSTRAINT "room_room_type_fkey" FOREIGN KEY ("room_type") REFERENCES "room_type"("type_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("item_id") ON DELETE CASCADE ON UPDATE CASCADE;
