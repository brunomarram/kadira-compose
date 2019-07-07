#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color

cd ~/kadira-compose

echo -e "${RED}Desligando Kadira...${NC}"
docker-compose down
echo -e "${RED}Kadira Desligado${NC}"

echo -e "${RED}Subindo e  reconfigurando Kadira...${NC}"
docker-compose up -d mongo
docker-compose exec mongo mongo --eval 'rs.initiate({_id:"kadira", members: [{_id: 0, host: "mongo:27017"}]})'
docker-compose up -d
echo -e "${RED}Kadira Ligado${NC}"

echo -e "${RED}Adicionando user guima@nucont.com...${NC}"
docker-compose exec mongo mongo kadira --eval 'db.users.remove({})'
docker-compose exec mongo mongo kadira --eval 'db.users.insert({ "_id" : "2XdEHNuftPEykJwk4", "createdAt" : ISODate("2018-11-08T13:22:49.233Z"), "services" : { "password" : { "bcrypt" : "$2a$10$WrQ5AmUzwJipn6KuIINNYuoN39.mn67.9bADbUwj1y/jQNNXCjQ0." }, "resume" : { "loginTokens" : [ { "when" : ISODate("2018-11-08T13:28:37.129Z"), "hashedToken" : "BNa/Pc6MDfBkYlqZYS+R49HrxQPhbTRtW4+HiCLh/Jw=" } ] } }, "username" : "admin", "emails" : [ { "address" : "guima@nucont.com", "verified" : false } ], "states" : { "__inited" : 1541683382581 } })'
echo -e "${RED}Usuario adicionado${NC}"

echo -e "${RED}Adicionando aplicacoes${NC}"
docker-compose exec mongo mongo kadira --eval 'db.apps.remove({})'

docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "CoA7a9JGxFcGyBDzC", "name" : "Nucont Production", "created" : ISODate("2018-11-08T13:29:15.809Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "4999ed65-29fb-4d14-9b65-57107ced6769", "plan" : "business", "shard" : "one", "subShard" : 69, "pricingType" : "paid" })'
docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "Bifs9NH3PZ8Fm8Zf3", "name" : "Nucont Staging", "created" : ISODate("2018-11-08T13:32:15.959Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "489a7e34-e09e-45af-ad28-58995184cc37", "plan" : "business", "shard" : "one", "subShard" : 125, "pricingType" : "paid" })'
echo -e "${RED}App NUCONT Production e Staging adicionados${NC}"


docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "m9pvpD9ATc4xWtPW4", "name" : "NandaApp Production", "created" : ISODate("2018-11-08T13:31:26.929Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "0c400356-f4e9-4226-8d66-007dff2d857b", "plan" : "business", "shard" : "one", "subShard" : 102, "pricingType" : "paid" })'
docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "AN2KH6JaNZ8ZQnW6L", "name" : "NandaApp Staging", "created" : ISODate("2018-11-08T13:32:23.339Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "bdda88ec-f145-471d-92bb-ccd86e20c6bf", "plan" : "business", "shard" : "one", "subShard" : 93, "pricingType" : "paid" })'
echo -e "${RED}App NANDAAPP Production e Staging adicionados${NC}"

docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "vwRcy64sC4Synvr64", "name" : "Insights Production", "created" : ISODate("2018-11-08T13:30:45.243Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "0b064a71-0846-4905-80d2-281c6449840e", "plan" : "business", "shard" : "one", "subShard" : 93, "pricingType" : "paid" })'
docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "yuLbFERWMdSgaCym7", "name" : "Insights Staging", "created" : ISODate("2018-11-08T13:32:30.360Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "866d136f-6b06-4772-b7e1-80114181129b", "plan" : "business", "shard" : "one", "subShard" : 79, "pricingType" : "paid" })'
echo -e "${RED}App INSIGHTS Production e Staging adicionados${NC}"

docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "usAbaqPoCJfy4vRTd", "name" : "Crawlers Production", "created" : ISODate("2018-11-08T13:30:21.898Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "9a71c1d5-543c-45bf-b090-363074dc81ad", "plan" : "business", "shard" : "one", "subShard" : 41, "pricingType" : "paid" })'
docker-compose exec mongo mongo kadira --eval 'db.apps.insert({ "_id" : "xFJ5GNCHstL3SoAGR", "name" : "Crawlers Staging", "created" : ISODate("2018-11-08T13:32:39.945Z"), "owner" : "2XdEHNuftPEykJwk4", "secret" : "9820f31f-6b49-4ecc-9fc8-6534f5ac8aae", "plan" : "business", "shard" : "one", "subShard" : 78, "pricingType" : "paid" })'
echo -e "${RED}App CRAWLERS Production e Staging adicionados${NC}"


echo -e "${RED}Kadira pronto!${NC}"

echo -e "${RED}.=======================.${NC}"
echo -e "${RED}|                       |${NC}"
echo -e "${RED}|  ${NC}NUHACKERS RULES \\m/.${RED} |${NC}"
echo -e "${RED}|                       |${NC}"
echo -e "${RED}'======================='${NC}"
