You are situated inside of an R package source directory. 

# Plan for adding uniformity trial data to agridat

This workflow describes the steps to add a new uniformity trial dataset to the agridat R package, using existing datasets as a model.

Use `data-raw/baena.bean.uniformity.csv` as an example for the raw data.
Use `data-raw/baena.bean.uniformity.R` as an example for the data preparation script.
Use `man/baena.bean.uniformity.Rd` as an example for the documentation file.

## 1. Create a data preparation script

- Write a script in `data-raw/` named after the dataset (e.g., `baena.bean.uniformity.R`).
- The script should:
  - Read the raw data file.
  - Convert the data to long format with columns: `row`, `col`, `yield` (or similar).
  - Assign the result to a variable named after the dataset.
  - Include a data check plot with `desplot`.
  - Use `kw::agex()` to export the processed data as a tab-delimited `.txt` file in `data/` and also create the `.Rd` file for documentation.

## 2. Export the data and documentation

- Run the data preparation script to generate the processed `.txt` file in the `data/` directory
- And the `.Rd` file in the `man/` directory.

## 3. Update the documentation

- Modify the documentation file e.g. `man/baena.bean.uniformity.Rd`.
- Include a citation if available.
- Include details about the experiment like field layout, plot size, etc.
- Include a `desplot` example
- Make sure the examples section uses `\dontrun{  }`

## 4. Update the package index

- Add the new dataset to the table in `man/agridat.Rd` (with dimensions and type).

## 5. Update NEWS

- Add an entry for the new dataset in `NEWS.md`.
