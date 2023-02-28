#!/bin/bash

# Usage ./utils/copy_verifier.sh [nargo_dir:-"./circuits"] [output_folder:-"./src"] [output_file_name:-"Verifier.sol"]

NARGO_DIR=${1:-"./circuits"}
OUTPUT_FOLDER=${2:-"./src"}
OUTPUT_FILE_NAME=${3:-"Verifier.sol"}

echo "Generating verifier contract with nargo..."
nargo --program-dir $NARGO_DIR contract

cp $NARGO_DIR/contract/plonk_vk.sol $OUTPUT_FOLDER/$OUTPUT_FILE_NAME
echo "Updated Verifier.sol copied into contracts folder"

echo "Updating solidity version of the verifier contract..."
sed -i 's/pragma solidity >=0.6.0/pragma solidity ^0.8.4/g' $OUTPUT_FOLDER/$OUTPUT_FILE_NAME
sed -i "s/contract TurboVerifier/library TurboVerifier/g" $OUTPUT_FOLDER/$OUTPUT_FILE_NAME

echo "Contract ready for use!"