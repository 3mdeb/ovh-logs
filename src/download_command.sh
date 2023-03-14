# SPDX-FileCopyrightText: 2023 3mdeb <contact@3mdeb.com>
#
# SPDX-License-Identifier: MIT

MONTH="${args[month]}"
YEAR="${args[year]}"
DOMAIN="${args[domain]}"
OUTPUT="${args[output]}"

case "${MONTH}" in
  "01" );;
  "02" );;
  "03" );;
  "04" );;
  "05" );;
  "06" );;
  "07" );;
  "08" );;
  "09" );;
  "10" );;
  "11" );;
  "12" );;
  *)
    echo "MONTH must be in a range: 01-12"
    exit 1
    ;;
esac

# FIXME: It is not perfect input validation, but we do not care too much
case "${YEAR}" in
  2??? );;
  *)
    echo "YEAR must be in a range: 2000-2999"
    exit 1
    ;;
esac

mkdir -p "${OUTPUT}"

wget \
  --http-user="${OVH_USER}" \
  --http-password="${OVH_PASSWORD}" \
  --accept *gz \
  -r \
  -nd \
  --directory-prefix "${OUTPUT}" \
  ""${OVH_URL}"/"${DOMAIN}"/logs/logs-${MONTH}-${YEAR}/"
