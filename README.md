# Token Vesting Smart Contract

A simple and secure ERC20 token vesting smart contract with cliff support, designed for team members, advisors, and early investors.

---

##  Overview

This contract allows ERC20 tokens to be locked and released gradually over time.
A cliff period can be configured to prevent any token release before a specific timestamp.

The contract follows industry-standard vesting patterns commonly used in token launches.

---

##  Features

- ERC20 token vesting
- Cliff period support
- Linear vesting after cliff
- Secure token release mechanism
- Immutable token reference
- Remix-compatible deployment

---

##  Architecture

### TokenVesting.sol
- Holds ERC20 tokens
- Releases tokens gradually over time
- Calculates releasable tokens based on vesting schedule
- Allows anyone to trigger token release

---

## ⏳ Vesting Logic

- No tokens can be released before the cliff
- Tokens vest linearly after the cliff
- All remaining tokens can be released after vesting ends

---

## Deployment (Remix IDE)

1. Open Remix IDE
2. Create a new workspace
3. Add `TokenVesting.sol` to the `contracts` folder
4. Compile using Solidity version `0.8.20`
5. Deploy the contract with vesting parameters
6. Transfer ERC20 tokens to the contract address
7. Call `release()` to distribute vested tokens

---

##  Example Usage

```text
release()
releasableAmount()
