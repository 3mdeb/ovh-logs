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

function rename_log_file() {
  local file_path="$1"
  local suffix=".log.gz"

  # Extract the directory path and the file name
  local dir_path=$(dirname "$file_path")
  local filename=$(basename "$file_path")

  # Extract the date and prefix from the original file name
  local date_and_prefix=$(echo "$filename" | sed "s/\([0-9]*-[0-9]*-[0-9]*\)$suffix/\1/")
  local date=$(echo "$date_and_prefix" | grep -oE '[0-9]+-[0-9]+-[0-9]+')
  local prefix=$(echo "$date_and_prefix" | sed "s/-\($date\)//")

  # Split the date into day, month, and year
  IFS="-" read -ra date_parts <<< "$date"
  local day="${date_parts[0]}"
  local month="${date_parts[1]}"
  local year="${date_parts[2]}"

  # Assemble the new file name
  local new_filename="${year}-${month}-${day}-${prefix}${suffix}"

  # Construct the new file path
  local new_file_path="${dir_path}/${new_filename}"

  # Rename the file
  mv "$file_path" "$new_file_path"

  echo "File has been renamed from $file_path to $new_file_path"
}

mkdir -p "${OUTPUT}"

wget \
  --http-user="${OVH_USER}" \
  --http-password="${OVH_PASSWORD}" \
  --accept *gz \
  -r \
  -nd \
  --directory-prefix "${OUTPUT}" \
  ""${OVH_URL}"/"${DOMAIN}"/logs/logs-${MONTH}-${YEAR}/"

for log_file in ${OUTPUT}/${DOMAIN}-*log.gz; do
  rename_log_file "$log_file"
done
