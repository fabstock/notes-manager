



echo 'API_BASE_URL="${API_BASE_URL:-http://localhost:3000}"' > Docker/.env_actions
echo 'PORT="${PORT:-3000}"' >> Docker/.env_actions
echo 'WEB_BASE_URL="${WEB_BASE_URL}:-http://localhost:3001"' >> Docker/.env_actions
echo 'WEB_PORT="${WEB_PORT:-3001}"' >> Docker/.env_actions

echo '#ALLOW_EMPTY_ROOT_PASSWORD=true' >>Docker/.env_actions
echo 'DOCKERAPP_VERSION=node' >>Docker/.env_actions
echo 'NPM_VERSION=$(npm pkg get version)' >>Docker/.env_actions
echo 'TEST_FAB_ENV=1' >>Docker/.env_actions


echo 'DB_HOST="${{ secrets.DB_HOST:-mysql }}"' >> Docker/.env_actions

echo 'DB_NAME="${{ secrets.DB_NAME:-database_name }}"' >> Docker/.env_actions
echo 'DB_USER="${{ secrets.DB_USER:-database_user }}"' >> Docker/.env_actions
echo 'DB_PASSWORD="${{ secrets.DB_PASSORWD:-db_password }} "' >> Docker/.env_actions
echo 'MYSQL_ROOT_PASSWORD="${{ secrets.MYSQL_ROOT_PASSWORD:-root }}"' >> Docker/.env_actions
echo 'MARIADB_ROOT_PASSWORD="${{ secrets.MARIADB_ROOT_PASSORWD:-root }}"' >>Docker/.env_actions
echo 'MYSQL_ROOT_PASSWORD="${{ secrets.MARIADB_ROOT_PASSORWD:-root }}"' >>Docker/.env_actions

