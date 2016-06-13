# Postgres
default["postgresql"]["pg_hba"] = [
  { "type" => "local", "db" => "all", "user" => "postgres",   "addr" => "",             "method" => "peer" },
  { "type" => "local", "db" => "all", "user" => "all",   "addr" => "",             "method" => "md5" },
]
