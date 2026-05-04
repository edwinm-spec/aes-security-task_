#!/bin/bash
# Script to validate the agent's security analysis of the AES mix_columns vulnerability

set -e

ANSWER=$(cat)

# Check if answer identifies the core vulnerability (rotation)
if ! echo "$ANSWER" | grep -qiE "rotation|rotat|circular shift|rotate"; then
    echo "FAIL: Did not identify that mix_single_column performs rotation"
    exit 1
fi

# Check if answer mentions proper MixColumns requires Galois Field
if ! echo "$ANSWER" | grep -qiE "galois|GF\(2|field multiplication|gf\(2"; then
    echo "FAIL: Did not mention Galois Field multiplication"
    exit 1
fi

# Check if answer explains diffusion/avalanche impact
if ! echo "$ANSWER" | grep -qiE "diffusion|avalanche|mixing property"; then
    echo "FAIL: Did not explain the diffusion/avalanche impact"
    exit 1
fi

# Check if answer mentions cryptanalysis attacks
if ! echo "$ANSWER" | grep -qiE "differential|cryptanalysis|linear attack|chosen plaintext"; then
    echo "FAIL: Did not mention cryptanalysis attack vectors"
    exit 1
fi

# Check if answer traces the code path
if ! echo "$ANSWER" | grep -qiE "encrypt_block|mix_columns|round|loop"; then
    echo "FAIL: Did not trace the code path through encrypt_block and mix_columns"
    exit 1
fi

echo "PASS: Security analysis correctly identifies all aspects of the vulnerability"
exit 0

