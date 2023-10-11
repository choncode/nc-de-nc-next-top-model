#!/usr/bin/env bash

for file in "../nc-de-nc-next-top-model"/*.sql; do
    psql -f "${file}" > ${file%.sql}.txt
done
