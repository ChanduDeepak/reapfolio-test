// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */

import KnexSnakeCaseMappersFactory = require("objection");

export const development = {
    client: 'postgresql',
    connection: {
      host: 'rfpgflexibleserver-dev.postgres.database.azure.com',
      database: 'rfdatabase',
      user:     'pgadmin',
      password: '54rt$%rtfg^&',
      port: 5432,
      ssl: { rejectUnauthorized: false }
    },
    pool: {
      min: 100,
      max: 105
    },
    migrations: {
      directory: './migrations',
      tableName: 'knex_migrations',
      loadExtensions: ['.js']
    },
    ...KnexSnakeCaseMappersFactory
  };
