# AES Security Analysis Task

## Task Description
Analyze a broken AES `mix_columns` implementation that performs rotation instead of proper Galois Field multiplication.

## Files
- `task.json` - The prompt and environment configuration
- `verifier.json` - Grading rubric with 11 items and 5 groundings
- `gold.json` - Ideal answer with chain of thought
- `scripts/verify_analysis.sh` - Validation script for agent answers

## Task Type
`security` - Hard difficulty

## Vulnerability
`mix_single_column` performs a rotation (circular shift) instead of proper MixColumns, breaking diffusion and enabling differential cryptanalysis.

## Author
Edwin Musili
