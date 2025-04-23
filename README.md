# MSCS_632_B01_Assignment8
# Prolog Family Tree Program

This project implements a simple Family Tree in Prolog, showcasing logical inference, recursion, and family relationship queries using Prolog rules.

## File Structure

- `family_tree.pl`: Contains the Prolog code defining basic and derived family relationships, along with an `initialization` block that runs test queries on load.

## Features

- Define basic relationships using `parent/2`, `male/1`, and `female/1`
- Infer relationships like:
  - `child/2` — reverse of `parent`
  - `grandparent/2` — derived from two levels of `parent`
  - `sibling/2` — same parent, different individual
  - `cousin/2` — based on sibling relationship of parents
  - `descendant/2` — recursive logic to find all descendants
- Auto-run queries using `:- initialization(main).`
