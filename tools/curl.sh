#!/bin/sh
set -e


echo curl -H "Origin: http://app_api"  http://app_web/api/notes -I
curl -H "Origin: http://app_api"  http://app_web/api/notes -I


echo curl -H "Origin: http://app_api"  http://app_api/api/notes -I
curl -H "Origin: http://app_api"  http://app_api/api/notes -I


echo curl -H "Origin: http://app_web"  http://app_web/api/notes -I
curl -H "Origin: http://app_web"  http://app_web/api/notes -I

echo curl -H "Origin: http://app_web"  http://app_api/api/notes -I
curl -H "Origin: http://app_web"  http://app_api/api/notes -I




echo curl -H "Origin: http://app_api:3000"  http://app_web:3000/api/notes -I
curl -H "Origin: http://app_api:3000"  http://app_web:3000/api/notes -I


echo curl -H "Origin: http://app_api:3000"  http://app_api:3000/api/notes -I
curl -H "Origin: http://app_api:3000"  http://app_api:3000/api/notes -I


echo curl -H "Origin: http://app_web:3000"  http://app_web:3000/api/notes -I
curl -H "Origin: http://app_web:3000"  http://app_web:3000/api/notes -I

echo curl -H "Origin: http://app_web:3000"  http://app_api:3000/api/notes -I
curl -H "Origin: http://app_web:3000"  http://app_api:3000/api/notes -I

