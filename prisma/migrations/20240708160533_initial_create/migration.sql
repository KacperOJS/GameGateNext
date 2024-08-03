/*
  Warnings:

  - Made the column `conditions` on table `players` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `account_viplist` DROP FOREIGN KEY `account_viplist_ibfk_1`;

-- DropForeignKey
ALTER TABLE `account_viplist` DROP FOREIGN KEY `account_viplist_ibfk_2`;

-- DropForeignKey
ALTER TABLE `accounts_storage` DROP FOREIGN KEY `accounts_storage_ibfk_1`;

-- DropForeignKey
ALTER TABLE `blessings_history` DROP FOREIGN KEY `blessings_history_ibfk_1`;

-- DropForeignKey
ALTER TABLE `guild_invites` DROP FOREIGN KEY `guild_invites_ibfk_1`;

-- DropForeignKey
ALTER TABLE `guild_invites` DROP FOREIGN KEY `guild_invites_ibfk_2`;

-- DropForeignKey
ALTER TABLE `guild_ranks` DROP FOREIGN KEY `guild_ranks_ibfk_1`;

-- DropForeignKey
ALTER TABLE `guilds` DROP FOREIGN KEY `guilds_ibfk_1`;

-- DropForeignKey
ALTER TABLE `guildwar_kills` DROP FOREIGN KEY `guildwar_kills_ibfk_1`;

-- DropForeignKey
ALTER TABLE `live_casts` DROP FOREIGN KEY `live_casts_ibfk_1`;

-- DropForeignKey
ALTER TABLE `market_history` DROP FOREIGN KEY `market_history_ibfk_1`;

-- DropForeignKey
ALTER TABLE `market_offers` DROP FOREIGN KEY `market_offers_ibfk_1`;

-- DropForeignKey
ALTER TABLE `player_binary_items` DROP FOREIGN KEY `player_binary_items_ibfk_1`;

-- DropForeignKey
ALTER TABLE `player_deaths` DROP FOREIGN KEY `player_deaths_ibfk_1`;

-- DropForeignKey
ALTER TABLE `player_kills` DROP FOREIGN KEY `player_kills_ibfk_1`;

-- DropForeignKey
ALTER TABLE `player_kills` DROP FOREIGN KEY `player_kills_ibfk_2`;

-- DropForeignKey
ALTER TABLE `player_rewards` DROP FOREIGN KEY `player_rewards_ibfk_1`;

-- DropForeignKey
ALTER TABLE `players` DROP FOREIGN KEY `players_account_fk`;

-- DropForeignKey
ALTER TABLE `prey_slots` DROP FOREIGN KEY `prey_slots_ibfk_1`;

-- DropForeignKey
ALTER TABLE `store_history` DROP FOREIGN KEY `store_history_ibfk_1`;

-- DropForeignKey
ALTER TABLE `store_history_old` DROP FOREIGN KEY `store_history_old_ibfk_1`;

-- AlterTable
ALTER TABLE `houses` MODIFY `internal_bid` BIGINT NOT NULL DEFAULT 0,
    MODIFY `holder_limit` BIGINT NOT NULL DEFAULT 0,
    MODIFY `highest_bid` BIGINT NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `player_deaths` MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `players` MODIFY `conditions` BLOB NOT NULL;

-- CreateTable
CREATE TABLE `account_character_sale` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_account` INTEGER NOT NULL,
    `id_player` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT false,
    `price_type` TINYINT NOT NULL,
    `price_coins` INTEGER NULL,
    `price_gold` INTEGER NULL,
    `dta_insert` DATETIME(0) NOT NULL,
    `dta_valid` DATETIME(0) NOT NULL,
    `dta_sale` DATETIME(0) NULL,

    UNIQUE INDEX `id_player_UNIQUE`(`id_player`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_character_sale_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_old_account` INTEGER NULL,
    `id_player` INTEGER NULL,
    `id_new_account` INTEGER NULL,
    `price_type` BOOLEAN NULL,
    `price` INTEGER NULL,
    `char_id` INTEGER NULL,
    `dta_insert` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dta_sale` DATETIME(0) NULL,
    `extornada` BOOLEAN NULL,

    INDEX `id_new_acc_idx`(`id_new_account`),
    INDEX `id_old_acc_idx`(`id_old_account`),
    INDEX `id_player_idx`(`id_player`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `atr_wikki_category` (
    `id_atr_wikki_category` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `descricao` VARCHAR(255) NOT NULL,
    `text` TEXT NOT NULL,
    `dta_insert` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dta_update` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dta_deleted` DATETIME(0) NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,

    PRIMARY KEY (`id_atr_wikki_category`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `atr_wikki_subcategory` (
    `id_atr_wikki_subcategory` INTEGER NOT NULL AUTO_INCREMENT,
    `id_atr_wikki_category` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `text` TEXT NOT NULL,
    `dta_insert` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dta_update` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dta_deleted` DATETIME(0) NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,

    INDEX `FK_ID_WIKKI_CATEGORY_idx`(`id_atr_wikki_category`),
    PRIMARY KEY (`id_atr_wikki_subcategory`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comprovante` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account` VARCHAR(155) NOT NULL,
    `metodo` VARCHAR(50) NOT NULL,
    `email` VARCHAR(150) NULL,
    `mensagem` TEXT NOT NULL,
    `valor` FLOAT NOT NULL,
    `anexo` TEXT NULL,
    `motivo` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `donate_mode` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quantidade` INTEGER NOT NULL,
    `valor` DOUBLE NOT NULL,
    `active` INTEGER NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `donate_services` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `processo` VARCHAR(255) NOT NULL,
    `frase` VARCHAR(1000) NOT NULL,
    `img` VARCHAR(255) NOT NULL,
    `banco` INTEGER NOT NULL,
    `agencia` VARCHAR(50) NOT NULL,
    `conta` VARCHAR(50) NOT NULL,
    `variacao` INTEGER NULL,
    `cpf` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `free_pass` (
    `player_id` INTEGER NOT NULL,

    INDEX `free_pass_ibfk_1`(`player_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `inject` (
    `id` INTEGER NOT NULL,
    `word` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `links` (
    `account_id` INTEGER NOT NULL,
    `code` VARCHAR(50) NOT NULL,
    `code_date` INTEGER NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_account_actions` (
    `account_id` INTEGER NOT NULL,
    `ip` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ipv6` BINARY(16) NOT NULL DEFAULT 0x30,
    `date` INTEGER NOT NULL DEFAULT 0,
    `action` VARCHAR(255) NOT NULL DEFAULT '',

    INDEX `account_id`(`account_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_admin_menu` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL DEFAULT '',
    `page` VARCHAR(255) NOT NULL DEFAULT '',
    `ordering` INTEGER NOT NULL DEFAULT 0,
    `flags` INTEGER NOT NULL DEFAULT 0,
    `enabled` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_bugtracker` (
    `account` VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL DEFAULT 0,
    `status` INTEGER NOT NULL DEFAULT 0,
    `text` TEXT NOT NULL,
    `id` INTEGER NOT NULL DEFAULT 0,
    `subject` VARCHAR(255) NOT NULL DEFAULT '',
    `reply` INTEGER NOT NULL DEFAULT 0,
    `who` INTEGER NOT NULL DEFAULT 0,
    `uid` INTEGER NOT NULL AUTO_INCREMENT,
    `tag` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_changelog` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `body` VARCHAR(500) NOT NULL DEFAULT '',
    `type` BOOLEAN NOT NULL DEFAULT false,
    `where` BOOLEAN NOT NULL DEFAULT false,
    `date` INTEGER NOT NULL DEFAULT 0,
    `player_id` INTEGER NOT NULL DEFAULT 0,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_config` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `value` VARCHAR(1000) NOT NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_faq` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `question` VARCHAR(255) NOT NULL DEFAULT '',
    `answer` VARCHAR(1020) NOT NULL DEFAULT '',
    `ordering` INTEGER NOT NULL DEFAULT 0,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_forum` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_post` INTEGER NOT NULL DEFAULT 0,
    `last_post` INTEGER NOT NULL DEFAULT 0,
    `section` INTEGER NOT NULL DEFAULT 0,
    `replies` INTEGER NOT NULL DEFAULT 0,
    `views` INTEGER NOT NULL DEFAULT 0,
    `author_aid` INTEGER NOT NULL DEFAULT 0,
    `author_guid` INTEGER NOT NULL DEFAULT 0,
    `post_text` TEXT NOT NULL,
    `post_topic` VARCHAR(255) NOT NULL DEFAULT '',
    `post_smile` BOOLEAN NOT NULL DEFAULT false,
    `post_html` BOOLEAN NOT NULL DEFAULT false,
    `post_date` INTEGER NOT NULL DEFAULT 0,
    `last_edit_aid` INTEGER NOT NULL DEFAULT 0,
    `edit_date` INTEGER NOT NULL DEFAULT 0,
    `post_ip` VARCHAR(32) NOT NULL DEFAULT '0.0.0.0',
    `sticked` BOOLEAN NOT NULL DEFAULT false,
    `closed` BOOLEAN NOT NULL DEFAULT false,

    INDEX `section`(`section`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_forum_boards` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `description` VARCHAR(255) NOT NULL DEFAULT '',
    `ordering` INTEGER NOT NULL DEFAULT 0,
    `guild` INTEGER NOT NULL DEFAULT 0,
    `access` INTEGER NOT NULL DEFAULT 0,
    `closed` BOOLEAN NOT NULL DEFAULT false,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_gallery` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `comment` VARCHAR(255) NOT NULL DEFAULT '',
    `image` VARCHAR(255) NOT NULL,
    `thumb` VARCHAR(255) NOT NULL,
    `author` VARCHAR(50) NOT NULL DEFAULT '',
    `ordering` INTEGER NOT NULL DEFAULT 0,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_menu` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `template` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `link` VARCHAR(255) NOT NULL,
    `blank` BOOLEAN NOT NULL DEFAULT false,
    `color` VARCHAR(6) NOT NULL DEFAULT '',
    `category` INTEGER NOT NULL DEFAULT 1,
    `ordering` INTEGER NOT NULL DEFAULT 0,
    `enabled` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_monsters` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `hidden` BOOLEAN NOT NULL DEFAULT false,
    `name` VARCHAR(255) NOT NULL,
    `mana` INTEGER NOT NULL DEFAULT 0,
    `exp` INTEGER NOT NULL,
    `health` INTEGER NOT NULL,
    `speed_lvl` INTEGER NOT NULL DEFAULT 1,
    `use_haste` BOOLEAN NOT NULL,
    `voices` TEXT NOT NULL,
    `immunities` VARCHAR(255) NOT NULL,
    `summonable` BOOLEAN NOT NULL,
    `convinceable` BOOLEAN NOT NULL,
    `race` VARCHAR(255) NOT NULL,
    `loot` TEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_news` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `body` TEXT NOT NULL,
    `type` BOOLEAN NOT NULL DEFAULT false,
    `date` INTEGER NOT NULL DEFAULT 0,
    `category` BOOLEAN NOT NULL DEFAULT false,
    `player_id` INTEGER NOT NULL DEFAULT 0,
    `last_modified_by` INTEGER NOT NULL DEFAULT 0,
    `last_modified_date` INTEGER NOT NULL DEFAULT 0,
    `comments` VARCHAR(50) NOT NULL DEFAULT '',
    `article_text` VARCHAR(300) NOT NULL DEFAULT '',
    `article_image` VARCHAR(100) NOT NULL DEFAULT '',
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_news_categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `description` VARCHAR(50) NOT NULL DEFAULT '',
    `icon_id` INTEGER NOT NULL DEFAULT 0,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_notepad` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `content` TEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_pages` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `title` VARCHAR(30) NOT NULL,
    `body` TEXT NOT NULL,
    `date` INTEGER NOT NULL DEFAULT 0,
    `player_id` INTEGER NOT NULL DEFAULT 0,
    `php` BOOLEAN NOT NULL DEFAULT false,
    `enable_tinymce` BOOLEAN NOT NULL DEFAULT true,
    `access` TINYINT NOT NULL DEFAULT 0,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_spells` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spell` VARCHAR(255) NOT NULL DEFAULT '',
    `name` VARCHAR(255) NOT NULL,
    `words` VARCHAR(255) NOT NULL DEFAULT '',
    `category` BOOLEAN NOT NULL DEFAULT false,
    `type` BOOLEAN NOT NULL DEFAULT false,
    `level` INTEGER NOT NULL DEFAULT 0,
    `maglevel` INTEGER NOT NULL DEFAULT 0,
    `mana` INTEGER NOT NULL DEFAULT 0,
    `soul` TINYINT NOT NULL DEFAULT 0,
    `conjure_id` INTEGER NOT NULL DEFAULT 0,
    `conjure_count` TINYINT NOT NULL DEFAULT 0,
    `reagent` INTEGER NOT NULL DEFAULT 0,
    `item_id` INTEGER NOT NULL DEFAULT 0,
    `premium` BOOLEAN NOT NULL DEFAULT false,
    `vocations` VARCHAR(100) NOT NULL DEFAULT '',
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_videos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL DEFAULT '',
    `youtube_id` VARCHAR(20) NOT NULL,
    `author` VARCHAR(50) NOT NULL DEFAULT '',
    `ordering` INTEGER NOT NULL DEFAULT 0,
    `hidden` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_visitors` (
    `ip` VARCHAR(16) NOT NULL,
    `lastvisit` INTEGER NOT NULL DEFAULT 0,
    `page` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `ip`(`ip`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `myaac_weapons` (
    `id` INTEGER NOT NULL,
    `level` INTEGER NOT NULL DEFAULT 0,
    `maglevel` INTEGER NOT NULL DEFAULT 0,
    `vocations` VARCHAR(100) NOT NULL DEFAULT '',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `newsticker` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` INTEGER NOT NULL,
    `text` TEXT NOT NULL,
    `icon` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagseguro` (
    `date` DATETIME(0) NOT NULL,
    `code` VARCHAR(50) NOT NULL,
    `reference` VARCHAR(200) NOT NULL,
    `type` INTEGER NOT NULL,
    `status` INTEGER NOT NULL,
    `lastEventDate` DATETIME(0) NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagseguro_transactions` (
    `transaction_code` VARCHAR(36) NOT NULL DEFAULT '',
    `name` VARCHAR(200) NULL,
    `payment_method` VARCHAR(50) NOT NULL DEFAULT '',
    `status` VARCHAR(50) NOT NULL DEFAULT '',
    `item_count` INTEGER NOT NULL,
    `data` DATETIME(0) NOT NULL,
    `payment_amount` FLOAT NULL DEFAULT 0,

    INDEX `name`(`name`),
    INDEX `status`(`status`),
    UNIQUE INDEX `transaction_code`(`transaction_code`, `status`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagsegurotransacoes` (
    `TransacaoID` VARCHAR(36) NOT NULL,
    `VendedorEmail` VARCHAR(200) NOT NULL,
    `Referencia` VARCHAR(200) NULL,
    `TipoFrete` CHAR(2) NULL,
    `ValorFrete` DECIMAL(10, 2) NULL,
    `Extras` DECIMAL(10, 2) NULL,
    `Anotacao` TEXT NULL,
    `TipoPagamento` VARCHAR(50) NOT NULL,
    `StatusTransacao` VARCHAR(50) NOT NULL,
    `CliNome` VARCHAR(200) NOT NULL,
    `CliEmail` VARCHAR(200) NOT NULL,
    `CliEndereco` VARCHAR(200) NOT NULL,
    `CliNumero` VARCHAR(10) NULL,
    `CliComplemento` VARCHAR(100) NULL,
    `CliBairro` VARCHAR(100) NOT NULL,
    `CliCidade` VARCHAR(100) NOT NULL,
    `CliEstado` CHAR(2) NOT NULL,
    `CliCEP` VARCHAR(9) NOT NULL,
    `CliTelefone` VARCHAR(14) NULL,
    `NumItens` INTEGER NOT NULL,
    `Data` DATETIME(0) NOT NULL,
    `ProdQuantidade_x` INTEGER NOT NULL,
    `status` TINYINT UNSIGNED NOT NULL DEFAULT 0,

    INDEX `Referencia`(`Referencia`),
    INDEX `status`(`status`),
    UNIQUE INDEX `TransacaoID`(`TransacaoID`, `StatusTransacao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `cod` VARCHAR(1000) NOT NULL,
    `method` VARCHAR(200) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `price` FLOAT NULL,
    `delivery` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `newpayment` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `paypal_transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `payment_status` VARCHAR(70) NOT NULL DEFAULT '',
    `date` DATETIME(0) NOT NULL,
    `payer_email` VARCHAR(255) NOT NULL DEFAULT '',
    `payer_id` VARCHAR(255) NOT NULL DEFAULT '',
    `item_number1` VARCHAR(255) NOT NULL DEFAULT '',
    `mc_gross` FLOAT NOT NULL,
    `mc_currency` VARCHAR(5) NOT NULL DEFAULT '',
    `txn_id` VARCHAR(255) NOT NULL DEFAULT '',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `picpay` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ref` VARCHAR(255) NOT NULL,
    `valor` DOUBLE NOT NULL,
    `pontos` INTEGER NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `account_name` VARCHAR(100) NOT NULL,
    `link` VARCHAR(7000) NULL,
    `var` INTEGER NOT NULL DEFAULT 0,

    UNIQUE INDEX `ref`(`ref`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sell_players` (
    `player_id` INTEGER NOT NULL,
    `account` INTEGER NOT NULL,
    `create` BIGINT NOT NULL,
    `createip` BIGINT NOT NULL,
    `coin` INTEGER NOT NULL,

    PRIMARY KEY (`player_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sell_players_history` (
    `player_id` INTEGER NOT NULL,
    `accountold` INTEGER NOT NULL,
    `accountnew` INTEGER NOT NULL,
    `create` BIGINT NOT NULL,
    `createip` BIGINT NOT NULL,
    `buytime` BIGINT NOT NULL,
    `buyip` BIGINT NOT NULL,
    `coin` INTEGER NOT NULL,

    PRIMARY KEY (`player_id`, `buytime`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sellchar` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `vocation` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `status` VARCHAR(40) NOT NULL,
    `oldid` VARCHAR(40) NOT NULL,
    `seller` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `snowballwar` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `score` INTEGER NOT NULL,
    `data` VARCHAR(255) NOT NULL,
    `hora` VARCHAR(255) NOT NULL,

    INDEX `id`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets` (
    `ticket_id` INTEGER NOT NULL AUTO_INCREMENT,
    `ticket_subject` VARCHAR(255) NULL,
    `ticket_author` VARCHAR(255) NULL,
    `ticket_author_acc_id` INTEGER NOT NULL,
    `ticket_last_reply` VARCHAR(11) NULL,
    `ticket_admin_reply` INTEGER NULL,
    `ticket_date` VARCHAR(255) NULL,
    `ticket_ended` VARCHAR(255) NULL,
    `ticket_status` VARCHAR(255) NULL,
    `ticket_category` VARCHAR(255) NULL,
    `ticket_description` VARCHAR(255) NULL,

    INDEX `tickets_ibfk_1`(`ticket_author_acc_id`),
    PRIMARY KEY (`ticket_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets_reply` (
    `reply_id` INTEGER NOT NULL AUTO_INCREMENT,
    `ticket_id` INTEGER NULL,
    `reply_author` VARCHAR(255) NULL,
    `reply_message` VARCHAR(255) NULL,
    `reply_date` VARCHAR(255) NULL,

    INDEX `tickets_reply_ibfk_1`(`ticket_id`),
    PRIMARY KEY (`reply_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `videos` (
    `id` INTEGER NOT NULL,
    `titulo` VARCHAR(255) NOT NULL,
    `descricao` TEXT NOT NULL,
    `categoria` INTEGER NOT NULL,
    `link` VARCHAR(11) NOT NULL,
    `ativo` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `videos_categorias` (
    `id` INTEGER NOT NULL,
    `nome` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `videos_comentarios` (
    `id` INTEGER NOT NULL,
    `mensagem` TEXT NOT NULL,
    `character` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(15) NOT NULL,
    `topico` INTEGER NOT NULL,
    `data` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ativo` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_changelogs` (
    `id_changelog` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `description` TEXT NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id_changelog`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_featured_article` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `text` VARCHAR(255) NOT NULL,
    `date` VARCHAR(30) NOT NULL,
    `author` VARCHAR(50) NOT NULL,
    `read_more` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_forum` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_post` INTEGER NOT NULL DEFAULT 0,
    `last_post` INTEGER NOT NULL DEFAULT 0,
    `section` INTEGER NOT NULL DEFAULT 0,
    `replies` INTEGER NOT NULL DEFAULT 0,
    `views` INTEGER NOT NULL DEFAULT 0,
    `author_aid` INTEGER NOT NULL DEFAULT 0,
    `author_guid` INTEGER NOT NULL DEFAULT 0,
    `post_text` TEXT NOT NULL,
    `post_topic` VARCHAR(255) NOT NULL,
    `post_smile` BOOLEAN NOT NULL DEFAULT false,
    `post_date` INTEGER NOT NULL DEFAULT 0,
    `last_edit_aid` INTEGER NOT NULL DEFAULT 0,
    `edit_date` INTEGER NOT NULL DEFAULT 0,
    `post_ip` VARCHAR(15) NOT NULL DEFAULT '0.0.0.0',
    `icon_id` INTEGER NOT NULL DEFAULT 0,
    `news_icon` VARCHAR(50) NOT NULL DEFAULT '0',
    `post_html` BOOLEAN NOT NULL DEFAULT false,
    `sticked` BOOLEAN NOT NULL DEFAULT false,
    `closed` BOOLEAN NOT NULL DEFAULT false,

    INDEX `section`(`section`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_helpdesk` (
    `account` VARCHAR(255) NOT NULL,
    `type` INTEGER NOT NULL,
    `status` INTEGER NOT NULL,
    `text` TEXT NOT NULL,
    `id` INTEGER NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `priority` INTEGER NOT NULL,
    `reply` INTEGER NOT NULL,
    `who` INTEGER NOT NULL,
    `uid` INTEGER NOT NULL AUTO_INCREMENT,
    `tag` INTEGER NOT NULL,
    `registered` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `t_id` VARCHAR(11) NOT NULL,
    `c_name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_network_box` (
    `id` INTEGER NOT NULL,
    `network_name` VARCHAR(10) NOT NULL,
    `network_link` VARCHAR(50) NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_news_tickers` (
    `date` INTEGER NOT NULL DEFAULT 1,
    `author` INTEGER NOT NULL,
    `image_id` INTEGER NOT NULL DEFAULT 0,
    `text` TEXT NOT NULL,
    `hide_ticker` BOOLEAN NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_ots_comunication` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `param1` VARCHAR(255) NOT NULL,
    `param2` VARCHAR(255) NOT NULL,
    `param3` VARCHAR(255) NOT NULL,
    `param4` VARCHAR(255) NOT NULL,
    `param5` VARCHAR(255) NOT NULL,
    `param6` VARCHAR(255) NOT NULL,
    `param7` VARCHAR(255) NOT NULL,
    `delete_it` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_ots_guildcomunication` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `param1` VARCHAR(255) NOT NULL,
    `param2` VARCHAR(255) NOT NULL,
    `param3` VARCHAR(255) NOT NULL,
    `param4` VARCHAR(255) NOT NULL,
    `param5` VARCHAR(255) NOT NULL,
    `param6` VARCHAR(255) NOT NULL,
    `param7` VARCHAR(255) NOT NULL,
    `delete_it` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_polls` (
    `id` INTEGER NOT NULL,
    `question` VARCHAR(255) NOT NULL,
    `end` INTEGER NOT NULL,
    `start` INTEGER NOT NULL,
    `answers` INTEGER NOT NULL,
    `votes_all` INTEGER NOT NULL,
    `description` VARCHAR(255) NULL DEFAULT '0'
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_polls_answers` (
    `poll_id` INTEGER NOT NULL,
    `answer_id` INTEGER NOT NULL,
    `answer` VARCHAR(255) NOT NULL,
    `votes` INTEGER NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_replay` (
    `title` VARCHAR(255) NULL,
    `version` INTEGER NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shop_category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    `button` VARCHAR(50) NOT NULL,
    `hide` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shop_donate_confirm` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` BIGINT NOT NULL,
    `account_name` VARCHAR(50) NOT NULL,
    `donate_id` INTEGER NOT NULL,
    `msg` TEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shop_donates` (
    `id` INTEGER NOT NULL,
    `date` INTEGER NOT NULL,
    `reference` VARCHAR(50) NOT NULL,
    `account_name` VARCHAR(50) NOT NULL,
    `method` VARCHAR(50) NOT NULL,
    `price` VARCHAR(20) NOT NULL,
    `points` INTEGER NOT NULL,
    `coins` INTEGER NOT NULL,
    `status` VARCHAR(20) NOT NULL DEFAULT ''
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shop_offer` (
    `id` INTEGER NOT NULL,
    `category` INTEGER NOT NULL,
    `points` INTEGER NOT NULL DEFAULT 0,
    `coins` INTEGER NOT NULL DEFAULT 0,
    `price` VARCHAR(50) NOT NULL DEFAULT '',
    `itemid` INTEGER NOT NULL DEFAULT 0,
    `mount_id` VARCHAR(100) NOT NULL DEFAULT '',
    `addon_name` VARCHAR(100) NOT NULL DEFAULT '',
    `count` INTEGER NOT NULL DEFAULT 0,
    `offer_type` VARCHAR(255) NULL,
    `offer_description` TEXT NOT NULL,
    `offer_name` VARCHAR(255) NOT NULL DEFAULT '',
    `offer_date` INTEGER NOT NULL,
    `default_image` VARCHAR(50) NOT NULL DEFAULT '',
    `hide` INTEGER NOT NULL DEFAULT 0
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shop_payment` (
    `id` INTEGER NOT NULL,
    `ref` VARCHAR(10) NOT NULL,
    `account_name` VARCHAR(50) NOT NULL,
    `service_id` INTEGER NOT NULL,
    `service_category_id` INTEGER NOT NULL,
    `payment_method_id` INTEGER NOT NULL,
    `price` VARCHAR(50) NOT NULL,
    `points` INTEGER UNSIGNED NOT NULL,
    `coins` INTEGER UNSIGNED NOT NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'waiting',
    `date` INTEGER NOT NULL,
    `gift` INTEGER NOT NULL DEFAULT 0
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shopguild_history_item` (
    `id` INTEGER NOT NULL,
    `to_name` VARCHAR(255) NOT NULL DEFAULT '0',
    `to_account` INTEGER NOT NULL DEFAULT 0,
    `from_nick` VARCHAR(255) NOT NULL,
    `from_account` INTEGER NOT NULL DEFAULT 0,
    `price` INTEGER NOT NULL DEFAULT 0,
    `offer_id` INTEGER NOT NULL DEFAULT 0,
    `trans_state` VARCHAR(255) NOT NULL,
    `trans_start` INTEGER NOT NULL DEFAULT 0,
    `trans_real` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shopguild_history_pacc` (
    `id` INTEGER NOT NULL,
    `to_name` VARCHAR(255) NOT NULL DEFAULT '0',
    `to_account` INTEGER NOT NULL DEFAULT 0,
    `from_nick` VARCHAR(255) NOT NULL,
    `from_account` INTEGER NOT NULL DEFAULT 0,
    `price` INTEGER NOT NULL DEFAULT 0,
    `pacc_days` INTEGER NOT NULL DEFAULT 0,
    `trans_state` VARCHAR(255) NOT NULL,
    `trans_start` INTEGER NOT NULL DEFAULT 0,
    `trans_real` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `z_shopguild_offer` (
    `id` INTEGER NOT NULL,
    `points` INTEGER NOT NULL DEFAULT 0,
    `itemid1` INTEGER NOT NULL DEFAULT 0,
    `count1` INTEGER NOT NULL DEFAULT 0,
    `itemid2` INTEGER NOT NULL DEFAULT 0,
    `count2` INTEGER NOT NULL DEFAULT 0,
    `offer_type` VARCHAR(255) NULL,
    `offer_description` TEXT NOT NULL,
    `offer_name` VARCHAR(255) NOT NULL,
    `pid` INTEGER NOT NULL DEFAULT 0
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `account_viplist` ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `account_viplist` ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `accounts_storage` ADD CONSTRAINT `accounts_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `blessings_history` ADD CONSTRAINT `blessings_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `guild_invites` ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `guild_invites` ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `guild_ranks` ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `guilds` ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `guildwar_kills` ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `live_casts` ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `market_history` ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `market_offers` ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `player_binary_items` ADD CONSTRAINT `player_binary_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `player_deaths` ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `player_kills` ADD CONSTRAINT `player_kills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `player_kills` ADD CONSTRAINT `player_kills_ibfk_2` FOREIGN KEY (`target`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `player_rewards` ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `players` ADD CONSTRAINT `players_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `prey_slots` ADD CONSTRAINT `prey_slots_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `store_history` ADD CONSTRAINT `store_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `store_history_old` ADD CONSTRAINT `store_history_old_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `account_character_sale_history` ADD CONSTRAINT `id_player` FOREIGN KEY (`id_player`) REFERENCES `players`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `atr_wikki_subcategory` ADD CONSTRAINT `FK_ID_WIKKI_CATEGORY` FOREIGN KEY (`id_atr_wikki_category`) REFERENCES `atr_wikki_category`(`id_atr_wikki_category`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `free_pass` ADD CONSTRAINT `free_pass_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `sell_players` ADD CONSTRAINT `sell_players_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `sell_players_history` ADD CONSTRAINT `sell_players_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `sellchar` ADD CONSTRAINT `sellchar_ibfk_1` FOREIGN KEY (`id`) REFERENCES `players`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets_reply` ADD CONSTRAINT `tickets_reply_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;
