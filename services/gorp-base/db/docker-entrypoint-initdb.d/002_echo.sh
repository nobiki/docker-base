echo "hogehogehoge"

psql -U ${POSTGRES_USER} ${POSTGRES_DB} -l
psql -U ${POSTGRES_USER} ${POSTGRES_DB} -c "\d hoge"
psql -U ${POSTGRES_USER} ${POSTGRES_DB} -c "select * from hoge"
