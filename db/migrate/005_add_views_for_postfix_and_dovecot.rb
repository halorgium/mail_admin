class AddViewsForPostfixAndDovecot < ActiveRecord::Migration
  def self.up
    execute <<-EOT
      CREATE VIEW email_accounts AS 
        SELECT 
          "a"."name" || '@' || "d"."name" AS "email", 
          "d"."name" || '/' || "a"."name" || '/' AS "mailbox", 
          COALESCE("a"."optional_uid", "d"."uid") AS "uid", 
          COALESCE("a"."optional_gid", "d"."gid") AS "gid", 
          "a"."crypted_password" AS "password" 
        FROM "accounts" "a" 
        LEFT JOIN "domains" "d" 
          ON "a"."domain_id" = "d"."id";

      CREATE VIEW email_forwardings AS 
        SELECT 
          "f"."source_name" || '@' || "sd"."name" AS "source", 
          "da"."name" || '@' || "dd"."name" AS "destination" 
        FROM "forwardings" "f" 
        LEFT JOIN "domains" "sd" 
          ON "f"."source_domain_id" = "sd"."id" 
        LEFT JOIN "accounts" "da" 
          ON "f"."destination_account_id" = "da"."id" 
        LEFT JOIN "domains" "dd" 
          ON "da"."domain_id" = "dd"."id";

      CREATE VIEW email_transports AS 
        SELECT 
          "d"."name" AS "domain", 
          "t"."name" AS "transport"
        FROM "transports" "t" 
        LEFT JOIN "domains" "d" 
          ON "t"."domain_id" = "d"."id";
    EOT
  end

  def self.down
    execute <<-EOT
      DROP VIEW email_forwardings;
      DROP VIEW email_accounts;
    EOT
  end
end
