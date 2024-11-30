# Toronto healthcare outbreak predictiion

## Overview

This repository contains the analysis and predictive modeling of outbreak patterns across various healthcare settings using Poisson regression. The study focuses on understanding the seasonal and pathogen-specific trends of outbreak frequencies for pathogens such as COVID-19, Rhinovirus, and Parainfluenza, leveraging a comprehensive dataset from Toronto's healthcare institutions. Predictive models were developed to estimate outbreak counts for 2025, incorporating key variables like month, season, pathogen type, and outbreak setting.

## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated data created according to the analysis data.
-   `data/01-raw_data` contains the raw data downloaded from Open Data Toronto.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `models` contains fitted models and the scripts of model API. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean, test, model and exploratory data.


## Statement on LLM usage

Completion of aspects of the code and polishment of text part with the help of ChatGPT-4. . The entire chat history is available in inputs/llms/usage.txt.

